# AWS Infrastructure via Terraform and Terragrunt

This repository demonstrates how to efficiently manage and deploy AWS infrastructure using Terraform and Terragrunt. The project is designed to simplify provisioning, promote reusable code, and handle multi-environment configurations seamlessly.

---

## **Features**

- **Infrastructure as Code:** Declaratively define your AWS resources using Terraform.
- **Multi-Environment Support:** Manage configurations for development, staging, and production environments.
- **Modular Design:** Reusable modules for AWS services like VPC, EC2, S3, and RDS.
- **Remote State Management:** Uses AWS S3 and DynamoDB for secure and consistent state storage.
- **Terragrunt Integration:** Simplifies environment overrides and dependency management.

---

## **Repository Structure**

```plaintext
AWSinfrastructureviaTerraformandTerragrunt/
├── modules/           # Reusable Terraform modules
├── environments/      # Environment-specific configurations (dev, staging, prod)
├── terragrunt.hcl     # Terragrunt configuration file
└── README.md         # Documentation
```

### **Modules**
Reusable Terraform modules for common AWS services:

- **VPC Module:** Creates a Virtual Private Cloud with subnets, route tables, and internet gateways.
- **EC2 Module:** Provisions EC2 instances with autoscaling and security groups.
- **S3 Module:** Configures S3 buckets with versioning and encryption.
- **RDS Module:** Deploys a relational database with backups and multi-AZ support.

### **Environments**
Configurations for multiple environments:

- **Dev:** Development environment.
- **Staging:** Pre-production testing.
- **Prod:** Production environment.

---

## **Getting Started**

### **Prerequisites**

- [Terraform](https://www.terraform.io/downloads.html)
- [Terragrunt](https://terragrunt.gruntwork.io/)
- AWS CLI with configured credentials

### **Setup Instructions**

1. Clone the repository:

   ```bash
   git clone https://github.com/mehmetsungur/AWSinfrastructureviaTerraformandTerragrunt.git
   cd AWSinfrastructureviaTerraformandTerragrunt
   ```

2. Configure the backend in `terragrunt.hcl`:

   ```hcl
   remote_state {
     backend = "s3"
     config = {
       bucket         = "your-terraform-state-bucket"
       key            = "path/to/your/statefile.tfstate"
       region         = "eu-north-1"
       dynamodb_table = "terraform-lock-table"
     }
   }
   ```

3. Navigate to the desired environment:

   ```bash
   cd environments/dev
   ```

4. Initialize and apply Terragrunt:

   ```bash
   terragrunt init
   terragrunt apply
   ```

---

## **Best Practices**

1. **Use Remote State:** Store Terraform state files in S3 for consistency and team collaboration.
2. **Follow DRY Principles:** Leverage Terragrunt to avoid repetitive configurations.
3. **Test Changes:** Use `terraform plan` or `terragrunt plan` to preview changes before applying.
4. **Secure Credentials:** Use AWS IAM roles and avoid hardcoding sensitive data.

---

## **Contributing**

Contributions are welcome! Feel free to open an issue or submit a pull request to enhance the repository.

---

## **License**

This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## **Contact**

For questions or feedback, reach out to [Mehmet Sungur](https://github.com/mehmetsungur) or open an issue in the repository.

Happy coding! 🚀