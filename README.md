# terraform-awsrds-openvpn

## File Structure:
<img width="181" alt="Screenshot 2022-10-16 at 12 16 34 PM" src="https://user-images.githubusercontent.com/45258145/196022198-ced77fb2-7aca-4b56-81fa-4329e2e13892.png">


## Steps for creation of resource:
1. `terraform init`.
2. `terraform plan -target='module.dev-vpc'`.
3. `terraform apply --auto-approve -target='module.dev-vpc'`.
4. `terraform apply --auto-approve -target='aws_instance.openvpn-deploy'`.
5. `terraform apply --auto-approve -target='module.mysql'`.

## Deletion of resource:
1. `terraform destroy --auto-approve -target='module.mysql'`.
2. `terraform destroy --auto-approve -target='aws_instance.openvpn-deploy'`.
3. `terraform destroy --auto-approve -target='module.dev-vpc'`.
