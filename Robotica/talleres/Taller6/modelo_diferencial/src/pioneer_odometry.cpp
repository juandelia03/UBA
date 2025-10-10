#include "pioneer_odometry.h"
#include <std_msgs/msg/float64.hpp>
#include <nav_msgs/msg/odometry.h>
#include <geometry_msgs/msg/transform_stamped.hpp>
#include <tf2_geometry_msgs/tf2_geometry_msgs.hpp>
#include <tf2/LinearMath/Quaternion.h>

using namespace robmovil;

#define WHEEL_BASELINE 0.331
#define WHEEL_RADIUS 0.0975
#define ENCODER_TICKS 500.0

PioneerOdometry::PioneerOdometry() : Node("nodeOdometry"), x_(0), y_(0), theta_(0), ticks_initialized_(false)
{
  // Nos suscribimos a los comandos de velocidad en el tópico "/robot/cmd_vel" de tipo geometry_msgs::Twist
  twist_sub_ = this->create_subscription<geometry_msgs::msg::Twist>("/cmd_vel", rclcpp::QoS(10), std::bind(&PioneerOdometry::on_velocity_cmd, this, std::placeholders::_1));

  vel_pub_left_ = this->create_publisher<std_msgs::msg::Float64>("/robot/left_wheel/cmd_vel", rclcpp::QoS(10));
  vel_pub_right_ = this->create_publisher<std_msgs::msg::Float64>("/robot/right_wheel/cmd_vel", rclcpp::QoS(10));

  encoder_sub_ = this->create_subscription<robmovil_msgs::msg::EncoderTicks>("/robot/encoders", rclcpp::QoS(10), std::bind(&PioneerOdometry::on_encoder_ticks, this, std::placeholders::_1));

  pub_odometry_ = this->create_publisher<nav_msgs::msg::Odometry>("/robot/odometry", rclcpp::QoS(10));

  tf_broadcaster_ = std::make_unique<tf2_ros::TransformBroadcaster>(*this);
}

void PioneerOdometry::on_velocity_cmd(const geometry_msgs::msg::Twist::SharedPtr twist)
{
  /** Completar los mensajes de velocidad vLeft y vRight*/
  double velocidad_adelante = twist->linear.x;
  double velocidad_angular = twist->angular.z;

  double vLeft = (velocidad_adelante - velocidad_angular * (WHEEL_BASELINE / 2.0)) / WHEEL_RADIUS;
  double vRight = (velocidad_adelante + velocidad_angular * (WHEEL_BASELINE / 2.0)) / WHEEL_RADIUS;

  // publish left velocity
  {
    std_msgs::msg::Float64 msg;
    msg.data = vLeft;

    vel_pub_left_->publish(msg);
  }

  // publish right velocity
  {
    std_msgs::msg::Float64 msg;
    msg.data = vRight;

    vel_pub_right_->publish(msg);
  }
}

void PioneerOdometry::on_encoder_ticks(const robmovil_msgs::msg::EncoderTicks::SharedPtr encoder)
{
  // La primera vez que llega un mensaje de encoders
  // inicializo las variables de estado.
  if (!ticks_initialized_)
  {
    ticks_initialized_ = true;
    last_ticks_left_ = encoder->ticks_left.data;
    last_ticks_right_ = encoder->ticks_right.data;
    last_ticks_time = encoder->header.stamp;
    return;
  }

  int32_t delta_ticks_left = encoder->ticks_left.data - last_ticks_left_;
  int32_t delta_ticks_right = encoder->ticks_right.data - last_ticks_right_;

  // calcular el desplazamiento relativo: delta_x, delta_y, delta_theta

  // para calcular cada delta necesito d_izq/der considerando G=1

  // pi * D * delta alpa / N
  double d_izq = M_PI * (WHEEL_RADIUS * 2) * ((double)delta_ticks_left / ENCODER_TICKS);
  double d_der = M_PI * (WHEEL_RADIUS * 2) * ((double)delta_ticks_right / ENCODER_TICKS);

  double delta_theta = (d_der - d_izq) / WHEEL_BASELINE;

  double d = (d_izq + d_der) / 2;

  // ACA USO EL theta_ ????? cuanto pudo haber rotado en una vuelta de encoder, es aproximado aparte
  double delta_x = d * cos(theta_);
  double delta_y = d * sin(theta_);

  /* Utilizar este delta de tiempo entre momentos */
  rclcpp::Time current_time(encoder->header.stamp);
  double delta_t = (current_time - last_ticks_time).seconds();

  /** Utilizar variables globales x_, y_, theta_ definidas en el .h */
  x_ += delta_x;
  y_ += delta_y;
  theta_ += delta_theta;

  // Construir el mensaje odometry utilizando el esqueleto siguiente:
  nav_msgs::msg::Odometry msg;

  msg.header.stamp = encoder->header.stamp;
  msg.header.frame_id = "map";
  msg.child_frame_id = "base_link";

  msg.pose.pose.position.x = x_;
  msg.pose.pose.position.y = y_;
  msg.pose.pose.position.z = 0;

  tf2::Quaternion q;

  q.setRPY(0, 0, theta_); // roll, pitch, yaw
  msg.pose.pose.orientation = tf2::toMsg(q);

  msg.twist.twist.linear.x = d / delta_t; // velocidad es distancia sobre tiempo no?
  msg.twist.twist.linear.y = 0;
  msg.twist.twist.linear.z = 0;

  msg.twist.twist.angular.x = 0;
  msg.twist.twist.angular.y = 0;
  msg.twist.twist.angular.z = delta_theta / delta_t;

  pub_odometry_->publish(msg);

  // Actualizo las variables de estado

  last_ticks_left_ = encoder->ticks_left.data;
  last_ticks_right_ = encoder->ticks_right.data;
  last_ticks_time = current_time;

  /* Mando tambien un transform usando TF */

  geometry_msgs::msg::TransformStamped t;
  t.header.stamp = this->get_clock()->now();
  t.header.frame_id = "map";
  t.child_frame_id = "base_link";
  t.transform.translation.x = msg.pose.pose.position.x;
  t.transform.translation.y = msg.pose.pose.position.y;
  t.transform.translation.z = msg.pose.pose.position.z;
  t.transform.rotation = msg.pose.pose.orientation;

  tf_broadcaster_->sendTransform(t);
}
