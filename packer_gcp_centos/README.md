# Packer CentOS GCP Image

## How to run

```
packer build -var 'project_id=add your project id' \
             -var 'account_file=here add your full path key' \
             compute_template.json
```
