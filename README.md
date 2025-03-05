# Automated Cloud Infrastructure Deployment with Terraform

This repository contains a Terraform script that automates the deployment of a cloud infrastructure setup on AWS. The setup includes an EC2 instance, an S3 bucket, a security group, and IAM roles.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Usage

1. Clone this repository:
    ```sh
    git clone [https://github.com/iammaksudul/automated-cloud-infrastructure.git](https://github.com/iammaksudul/Automated-Cloud-Infrastructure-Deployment-with-Terraform)
    cd Automated-Cloud-Infrastructure-Deployment-with-Terraform
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Review the Terraform plan:
    ```sh
    terraform plan
    ```

4. Apply the Terraform plan to create the infrastructure:
    ```sh
    terraform apply
    ```

5. Destroy the infrastructure when no longer needed:
    ```sh
    terraform destroy
    ```

## Configuration

You can customize the configuration by modifying the `variables.tf` file.

## Files

- `main.tf`: The main Terraform script
- `variables.tf`: Variables used in the Terraform script
- `outputs.tf`: Outputs from the Terraform script
- `README.md`: This file

## License

This project is licensed under the MIT License.
