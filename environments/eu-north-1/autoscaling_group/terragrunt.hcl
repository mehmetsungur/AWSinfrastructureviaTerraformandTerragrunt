include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../module_asg"
}

dependency "security_group" {
  config_path = "../security_group/ec2_sg"
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply"]
  mock_outputs = {
    security_group_id = "sg-045ad468a53d8cae1"
  }
}

dependency "kms_key" {
  config_path = "../kms_key"
  mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply"]
  mock_outputs = {
    arn = "arn:aws:kms:eu-north-1:724772091868:key/d3648b62-77a1-41ba-a279-e996d1ec85ff"
  }
}


dependency "alb" {
  config_path = "../alb"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    alb_listener_arn = "alb_listener_arn"
  }
}

dependency "route53" {
  config_path = "../route53_zone"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    domain_name = "domain_name"
  }
}

inputs = {
  aws_region = "eu-north-1"
  environment = "dev"
  name_prefix = "app"

  asg_desired_capacity = 1
  asg_max_size = 1
  asg_min_size = 1

  vpc_id = "vpc-0c60664ec6164de45"
  availability_zones = ["subnet-0a7a61bfdd6fc2913", "subnet-04b248ddc5f502ba8", "subnet-01a977e439ced7984"]
  key_name = "course-key"
  security_groups = ["sg-00faade8433e09ab0"]
  device_enable_encryption = true
  device_encryption_key = dependency.kms_key.outputs.arn
  lb_listener = dependency.alb.outputs.alb_listener_arn
  domain_name = "app.${dependency.route53.outputs.domain_name}"
}