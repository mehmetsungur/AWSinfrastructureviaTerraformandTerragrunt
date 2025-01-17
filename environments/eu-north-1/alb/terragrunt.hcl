include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../module_alb"
}

dependency "security_group_id" {
  config_path = "../security_group/alb_sg/"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    security_group_id = "sg-00faade8433e09ab0"
  }
}

dependency "certificate_arn" {
  config_path = "../acm_certificate/"
  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    certificate_arn = "certificate_arn"
  }
}


inputs = {
    name = "course-alb"
    security_groups = ["sg-045ad468a53d8cae1"]
    subnets = [
        "subnet-0a7a61bfdd6fc2913",
        "subnet-04b248ddc5f502ba8",
        "subnet-01a977e439ced7984"
    ]
    certificate_arn = dependency.certificate_arn.outputs.certificate_arn
}