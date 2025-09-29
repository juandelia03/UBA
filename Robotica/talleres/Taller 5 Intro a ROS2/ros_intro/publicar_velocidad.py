import rclpy
from rclpy.node import Node

from geometry_msgs.msg import Twist


class PublisherVelocity(Node):

    def __init__(self):
        super().__init__('publisher_velocity')
        self.publisher_ = self.create_publisher(Twist, '/cmd_vel', 10)
        timer_period = 0.5  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        msg = Twist()
        
        #Completar con el mensaje a enviar por el nodo "publisher_velocity"

        self.publisher_.publish(msg)
        self.get_logger().info(f'Publishing Twist: linear.x={msg.linear.x}, angular.z={msg.angular.z}')


def main(args=None):
    rclpy.init(args=args)

    publisher_velocity = PublisherVelocity()

    rclpy.spin(publisher_velocity)

    publisher_velocity.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()
