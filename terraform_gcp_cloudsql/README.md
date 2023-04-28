# Terraform GCP CloudSQL

Initialize environment variables:

```
export PROJECT_ID=???
export GCP_KEY_PATH=??
```

Provisioning infrastructure :)

```
terraform plan -var "project_id=$PROJECT_ID" -var "file_account_path=$GCP_KEY_PATH" .
```
