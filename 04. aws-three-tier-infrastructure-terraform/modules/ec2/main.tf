resource "aws_launch_template" "this" {

  name_prefix = "${var.project_name}-${var.environment}-"

  image_id = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    var.app_security_group_id
  ]

  user_data = base64encode(file("${path.module}/user-data.sh"))

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-${var.environment}-app"
    }
  }
}

resource "aws_autoscaling_group" "this" {

  name = "${var.project_name}-${var.environment}-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    var.private_subnet_a_id,
    var.private_subnet_b_id
  ]

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  launch_template {

    id = aws_launch_template.this.id

    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-app"
    propagate_at_launch = true
  }
}