# inventory-sync infrastructure

Terraform for the inventory-sync service: one EC2 instance, an artifacts
bucket, and the IAM and network plumbing around them.

## Layout

| File           | Contents                                   |
|----------------|--------------------------------------------|
| `main.tf`      | Provider, AMI lookup, EC2 instance         |
| `security.tf`  | Security group                             |
| `s3.tf`        | Artifacts bucket and bucket policy         |
| `iam.tf`       | Instance role/profile, support role        |
| `variables.tf` | Inputs                                     |
| `outputs.tf`   | Outputs                                    |

## Usage

```
terraform init
terraform validate
terraform plan -var vpc_id=vpc-xxxx -var subnet_id=subnet-xxxx
```

## Exercise instructions

This repository is a review exercise. It is not intended to be deployed:
do not run `terraform apply` against any account.

Review it as you would a pull request from a teammate. For each problem you
find, note the file and resource, why it matters, and how you would fix it.
Plan to spend about 30 minutes. You may use the Terraform and AWS documentation.
