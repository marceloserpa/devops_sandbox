## Terraform + GCP firewall rules POC


Initialize terraform project:
```
terraform init
```

To deploy GCP resources run the following command:
```
terraform apply -var 'project_id=YOUR_PROJECT_NAME'
```

To destroy all GCP resources created by above command:
```
terraform destroy -var 'project_id=YOUR_PROJECT_NAME'
```
