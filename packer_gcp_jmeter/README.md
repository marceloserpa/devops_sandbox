# Packer JMeter

## How to create an image in GCP

```
packer build -var 'project_id=add your project id' \
             -var 'account_file=here add your full path key' \
             compute_template.json
```


```
/opt/apache-jmeter-5.0/bin/jmeter -n -t test_plan.jmx \
             -l test_result.csv \
             -e -o reports/html/ \
             -Jusers=1 \
             -Jduration=30
```
