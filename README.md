# AWS Infrastructure via Terraform and Terragrunt

This repository demonstrates how to efficiently manage and deploy AWS infrastructure using Terraform and Terragrunt. The project simplifies provisioning, promotes reusable code, and handles multi-environment configurations seamlessly. The deployed infrastructure includes an Auto-Scaling Group (ASG), an Application Load Balancer (ALB), Route 53 DNS management, and KMS encryption.

---

## **Features**

- **Infrastructure as Code:** Declaratively define your AWS resources using Terraform.
- **Multi-Environment Support:** Manage configurations for development, staging, and production environments.
- **Auto-Scaling and Load Balancing:** Automatically scale EC2 instances and distribute traffic using ALB.
- **HTTPS Support:** Secure communication using AWS Certificate Manager (ACM).
- **Remote State Management:** Uses AWS S3 and DynamoDB for secure and consistent state storage.
- **KMS Encryption:** Secure EBS volumes with AWS Key Management Service (KMS).
- **Terragrunt Integration:** Simplifies environment overrides and dependency management.

---

## **Repository Structure**

```plaintext
AWSinfrastructureviaTerraformandTerragrunt/
├── modules/           # Reusable Terraform modules
├── environments/      # Environment-specific configurations (dev, staging, prod)
├── terragrunt.hcl     # Terragrunt configuration file
└── README.md          # Documentation
```

### **Modules**
Reusable Terraform modules for common AWS services:

- **VPC Module:** Creates a Virtual Private Cloud with subnets, route tables, and internet gateways.
- **EC2 Module:** Provisions EC2 instances with autoscaling and security groups.
- **ALB Module:** Configures Application Load Balancers with HTTP and HTTPS listeners.
- **RDS Module:** Deploys a relational database with backups and multi-AZ support.
- **Route 53 Module:** Manages DNS records for the environment.

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
- A registered Route 53 domain
- An SSL certificate provisioned in AWS ACM

---

### **Setup Instructions**

1. Clone the repository:

   ```bash
   git clone <repository-url>
   cd AWSinfrastructureviaTerraformandTerragrunt
   ```

2. Navigate to the environment directory:

   ```bash
   cd environments/eu-north-1
   ```

3. Initialize Terragrunt:

   ```bash
   terragrunt init
   ```

4. Review the plan:

   ```bash
   terragrunt plan
   ```

5. Apply the configuration:

   ```bash
   terragrunt apply
   ```

6. Verify the deployment:
   - Check the ALB DNS name and Route 53 configuration.
   - Access the application via the Route 53 domain: `https://app.ankaraplckursu.online`.

---

## **Validation**

After deployment, ensure the following:
1. DNS resolution works:
   ```bash
   nslookup app.ankaraplckursu.online
   ```
2. ALB listeners are configured correctly:
   ```bash
   aws elbv2 describe-listeners --load-balancer-arn <ALB-ARN>
   ```
3. Application is accessible at:
   ```
   https://app.ankaraplckursu.online
   ```

---

## **Troubleshooting**

### Common Errors and Fixes

1. **ValidationError: Security groups not linked to VPC**
   - Ensure security groups specified in the launch template are linked to the VPC used by the ASG.

2. **Duplicate Listener Error**
   - Check for existing listeners on the ALB using:
     ```bash
     aws elbv2 describe-listeners --load-balancer-arn <ALB-ARN>
     ```

3. **DNS Resolution Issues**
   - Verify Route 53 records point to the correct ALB DNS name.

4. **KMS Key Not Found**
   - Ensure the KMS key is correctly configured and referenced in the Terraform files.

5. **HTTPS Listener Issues**
   - Ensure the ACM certificate ARN is valid and correctly linked in the ALB listener configuration.

---

## **Contact**

For support or queries, contact **Mehmet Sungur**.

---

