# AWS VPC Infrastructure with Terraform

[Place your architecture diagram here]

## Project Overview
This Terraform project creates a production-ready VPC infrastructure in AWS with high availability and disaster recovery considerations. The infrastructure is deployed in the us-east-2 region with multi-AZ support.

## Infrastructure Components
- VPC with DNS hostnames enabled
- 2 Public Subnets (different AZs)
- 2 Private Subnets (different AZs)
- Internet Gateway
- Public Route Table with IGW route
- 2 Private Route Tables (one per AZ)
- Network ACLs for public subnets

## Prerequisites
- AWS Account
- Terraform installed (v1.0.0 or newer)
- AWS CLI configured with appropriate credentials
- Git (optional, for version control)

## Project Structure
```
002-terraform-project/
├── modules/
│   └── vpc/
│       ├── vpc.tf
│       ├── inputs.tf
│       └── outputs.tf
├── main.tf
├── variables.tf
├── providers.tf
└── README.md
```

## CIDR Ranges
- VPC CIDR: 10.10.0.0/16
- Public Subnet 1: 10.10.0.0/20 (us-east-2a)
- Public Subnet 2: 10.10.16.0/20 (us-east-2b)
- Private Subnet 1: 10.10.128.0/20 (us-east-2a)
- Private Subnet 2: 10.10.144.0/20 (us-east-2b)

## Step-by-Step Implementation Guide

### 1. Project Setup
1. Create project directory structure
2. Initialize Terraform project
3. Configure AWS provider

### 2. VPC Module Development
1. Create VPC resource with DNS hostnames enabled
2. Add Internet Gateway
3. Create subnets:
   - Public subnets with auto-assign public IP
   - Private subnets without public IP
4. Configure routing:
   - Public route table with IGW route
   - Private route tables for isolated routing
5. Implement Network ACLs for security

### 3. Module Integration
1. Define module variables
2. Create module outputs
3. Configure main project variables
4. Integrate VPC module in main.tf

## Usage

1. Clone the repository:
```bash
git clone [repository-url]
cd 002-terraform-project
```

2. Initialize Terraform:
```bash
terraform init
```

3. Review the changes:
```bash
terraform plan
```

4. Apply the infrastructure:
```bash
terraform apply
```

5. Clean up resources:
```bash
terraform destroy
```

## Best Practices Implemented
- Modular design for reusability
- Consistent tagging strategy
- Separate route tables for public and private subnets
- Security through Network ACLs
- High availability with multi-AZ deployment
- Standardized naming conventions

## Variables Customization
The project uses variables for flexibility. Main configurable variables:
- Region
- Project name
- Environment
- CIDR blocks
- Availability Zones

## Contributing
1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License


## Authors
Muhammad Ahsan Rafique

## Acknowledgments
- AWS Documentation
- Terraform Documentation

