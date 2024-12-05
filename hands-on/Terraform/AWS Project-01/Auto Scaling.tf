resource "aws_launch_template" "example" {
  name          = "example-launch-template"
  image_id      = "ami-0866a3c8686eaeeba"
  key_name      = aws_key_pair.jumper_to_private_key_pair.key_name
  iam_instance_profile {name = aws_iam_instance_profile.ec2_profile.name}
  instance_type = "t2.micro"

  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3
              echo "Hello, World from ASG" > /home/ec2-user/index.html
              cd /home/ec2-user
              python3 -m http.server 80 &
              EOF

)
    tags = {
      Name = "AutoScaling-Instance"
    }
}


resource "aws_autoscaling_group" "example" {
  launch_template {
    id      = aws_launch_template.example.id
    version = "$Latest"
  }

  min_size              = 1
  max_size              = 3
  desired_capacity      = 1
  vpc_zone_identifier   = [aws_subnet.Private_ssup1.id , aws_subnet.Private_ssup2.id] 
  target_group_arns = [aws_lb_target_group.test.arn]
  health_check_type     = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "AutoScalingInstance"
    propagate_at_launch = true
  }
}
