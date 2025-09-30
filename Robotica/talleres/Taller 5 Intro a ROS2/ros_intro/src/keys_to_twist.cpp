#include "keys_to_twist.h"
#define FORWARD 1.0
#define BACKWARDS -1.0
#define LEFT 1.0
#define RIGHT -1.0
#define STILL 0.0

using namespace robmovil;

KeysToTwist::KeysToTwist() : Node("nh")
{
  // nos susbribimos a los tópicos que reportan cuando se apreta o suelta una tecla.
  key_up_sub_ = this->create_subscription<keyboard_msgs::msg::Key>("/keyup", 10, std::bind(&KeysToTwist::on_key_up, this, std::placeholders::_1));
  key_down_sub_ = this->create_subscription<keyboard_msgs::msg::Key>("/keydown", 10, std::bind(&KeysToTwist::on_key_down, this, std::placeholders::_1));

  // anunciamos que vamos a publicar un mensaje de tipo geometry_msgs::msg::Twist en el tópico /cmd_vel.
  twist_pub_ = this->create_publisher<geometry_msgs::msg::Twist>("/cmd_vel", 10);

  // ...

  up_ = down_ = left_ = right_ = false;
}

void stop(geometry_msgs::msg::Twist &twist)
{
  twist.linear.x = STILL;
}

void stop_spinning(geometry_msgs::msg::Twist &twist)
{
  twist.angular.z = STILL;
}

void KeysToTwist::on_key_up(const keyboard_msgs::msg::Key::SharedPtr key_event)
{
  geometry_msgs::msg::Twist twist;

  switch (key_event->code)
  {
  case keyboard_msgs::msg::Key::KEY_UP:
    stop(twist);
    break;

  case keyboard_msgs::msg::Key::KEY_DOWN:
    stop(twist);
    break;

  case keyboard_msgs::msg::Key::KEY_LEFT:
    stop_spinning(twist);
    break;

  case keyboard_msgs::msg::Key::KEY_RIGHT:
    stop_spinning(twist);
    break;

  default:
    return;
  }

  twist_pub_->publish(twist);
}

void KeysToTwist::on_key_down(const keyboard_msgs::msg::Key::SharedPtr key_event)
{
  geometry_msgs::msg::Twist twist;

  switch (key_event->code)
  {
  case keyboard_msgs::msg::Key::KEY_UP:
    twist.linear.x = FORWARD;
    break;

  case keyboard_msgs::msg::Key::KEY_DOWN:
    twist.linear.x = BACKWARDS;
    break;

  case keyboard_msgs::msg::Key::KEY_LEFT:
    twist.angular.z = LEFT;
    break;

  case keyboard_msgs::msg::Key::KEY_RIGHT:
    twist.angular.z = RIGHT;
    break;

  default:
    return;
  }


  twist_pub_->publish(twist);
}
