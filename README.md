# dms-terraform-project
AWS Data Migration Service (DMS) Prototype

# Run instructions

The source AWS account has IAM Admin user PFDevAdmin
The target AWS account has IAM Admin user DevAdmin

Run this sequence of commands 

Open one (Google Chrome) browser session with AWS console in the source AWS user Profile PFDevadmin
```aws login --profile PFDevAdmin```

Open another(Google Chrome) browser session with AWS console in the target AWS profile DevAdmin
```aws login --profile DevAdmin```

Then run
```terraform plan```
```terraform apply```
