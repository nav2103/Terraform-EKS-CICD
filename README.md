### README.md

# Automating EKS Cluster Deployment and Nginx Application Deployment using Terraform and Jenkins CI/CD Pipeline

## Project Overview

This project automates the deployment of an Amazon Elastic Kubernetes Service (EKS) cluster and an Nginx application using Terraform for infrastructure management, Jenkins for continuous integration and continuous deployment (CI/CD), and GitHub for version control.

## Components

1. **Terraform**: Used to define and provision AWS resources.
2. **Jenkins**: Automates the CI/CD pipeline.
3. **GitHub**: Hosts the Terraform files for version control.
4. **Amazon EKS**: Manages the Kubernetes cluster.
5. **Nginx**: Deployed as a sample application on the EKS cluster.

## Project Structure

```sh
.
├── eks
│   ├── main.tf                # Main Terraform configuration file
│   ├── kubernetes.tf          # Kubernetes deployment and service configurations
│   ├── jenkinsfile            # Jenkins pipeline script
├── jenkins-server
│   ├── main.tf                # Main Terraform configuration file
│   ├── variables.tf           # Terraform variables
│   ├── provider.tf            # AWS provider configuration
│   ├── backend.tf             # Terraform backend configuration
│   ├── data.tf                # Data sources configuration
│   ├── terraform.tfvars       # Variables values
│   ├── install-jenkins.sh     # Script to install and configure Jenkins
├── README.md                  # Project documentation
```

## Prerequisites

1. **Terraform**: Install Terraform CLI.
2. **GitHub**: Set up a repository to store Terraform files.

## Setup Instructions

### First, fork this repo.

### 1. Clone the Repository

```sh
git clone https://github.com/yourusername/your-repo.git
cd your-repo
```

### 2. Configure AWS Provider

Update the `provider "aws"` block in `main.tf` with your desired AWS region. Also, update all the required details in the files.

### 3. Navigate to the Jenkins server and Initialize Terraform

```sh
cd jenkins-server
terraform init
```

### 4. Create Terraform Plan

```sh
terraform plan
```

### 5. Apply Terraform Configuration

This creates a Jenkins server and makes it up and running with all the required resources (Terraform, K8S, Jenkins, Java & AWS CLI).

```sh
terraform apply
```

### 6. Jenkins CI/CD Pipeline

- Hit the PublicIP of the server with port 8080.
- Setup Jenkins.
- Save AWS credentials (AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY) as global credentials.
- Create a Jenkins Pipeline and enter the JenkinsFile (groovy script) present in the repo.
- Run the Jenkins pipeline to automate the deployment process.

### 7. Verify Deployment

- Check the AWS Management Console for the EKS cluster and associated resources.

## Key Files

### `main.tf`

Defines AWS resources such as VPC, subnets, IAM roles, and EKS cluster.

### `kubernetes.tf`

Contains Kubernetes resources for deploying the Nginx application.

### `config-files`

Contains `.yml` file of deployment and service.

### `jenkinsfile`

Jenkins pipeline script to automate the deployment process.

## Conclusion

This project demonstrates the automation of EKS cluster and Nginx application deployment using Terraform, Jenkins, and GitHub. It ensures a consistent, scalable, and maintainable setup for deploying containerized applications on AWS.

## References

- [Terraform Documentation](https://www.terraform.io/docs)
- [Jenkins Documentation](https://www.jenkins.io/doc/)
- [Amazon EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)

---

This `README.md` provides a comprehensive guide to set up and manage the project, ensuring that all necessary details are clear and well-organized.
