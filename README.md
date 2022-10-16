# terraform-awsrds-openvpn

## File Structure:
.
├── modules
│   ├── rds_mysql
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── security-group
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── mysql private.tf
├── openvpn.tf
├── security-groups.tf
├── variables.tf
└── vpc.tf

4 directories, 14 files

## Steps for creation of resource:
`terraform init`
`terraform plan -target='module.dev-vpc'`
`terraform apply --auto-approve -target='module.dev-vpc'`
`terraform apply --auto-approve -target='aws_instance.openvpn-deploy'`
`terraform apply --auto-approve -target='module.mysql'`
