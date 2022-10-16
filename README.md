# terraform-awsrds-openvpn

## File Structure:
<img width="181" alt="Screenshot 2022-10-16 at 12 16 34 PM" src="https://user-images.githubusercontent.com/45258145/196022198-ced77fb2-7aca-4b56-81fa-4329e2e13892.png">


## Steps for creation of resource:
`terraform init`
`terraform plan -target='module.dev-vpc'`
`terraform apply --auto-approve -target='module.dev-vpc'`
`terraform apply --auto-approve -target='aws_instance.openvpn-deploy'`
`terraform apply --auto-approve -target='module.mysql'`
