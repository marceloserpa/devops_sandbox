
# Packer Ubuntu AMI

## How to run

```
packer build -var 'aws_access_key=MY ACCESS KEY' \
    -var 'aws_secret_key=MY SECRET KEY' \
    ubuntu_template.json
```
