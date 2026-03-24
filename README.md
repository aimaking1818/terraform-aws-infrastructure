-> Terraform AWS Infrastructure Project

->  Overview

This project demonstrates a production-ready AWS infrastructure built using Terraform.

->Architecture

* VPC with public subnet
* Internet Gateway
* EC2 instance with Nginx
* Security Groups
* Remote state (S3 + DynamoDB)

-> Technologies Used

* Terraform
* AWS (EC2, VPC, S3, DynamoDB)
* Shell Scripting

->  Project Structure

* modules/ → reusable infrastructure
* environments/ → dev & prod configs
* scripts/ → provisioning scripts
->Features

* Modular Terraform design
* Multi-environment setup (dev/prod)
* Remote state management
* Automated provisioning using user_data

-> How to Run

terraform init
terraform workspace new dev
terraform apply -var-file="environments/dev.tfvars"


->Output

* EC2 instance running Nginx
* Accessible via public IP

-> Learning Outcomes

* Infrastructure as Code (IaC)
* Terraform modules & state management
* AWS architecture design
