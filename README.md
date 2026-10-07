# inventory-sync infrastructure: review exercise

Welcome, and thanks for taking the time to do this exercise.

A teammate has opened a pull request with the Terraform for a new service called **inventory-sync**. The service runs on a single EC2 instance, pulls inventory data from an upstream provider using an API key, and writes the results to an S3 artifacts bucket. Your job is to review the pull request before it merges.

Plan to spend about **30 minutes**.

> **Do not run `terraform apply`.** This code is for review only and must not be deployed to any AWS account.

## What's in the repo

| File | Contents |
|------|----------|
| `versions.tf` | Terraform and AWS provider version constraints |
| `main.tf` | Provider configuration, AMI lookup, and the EC2 instance |
| `security.tf` | Security group for the instance |
| `s3.tf` | Artifacts bucket, its settings, and its bucket policy |
| `iam.tf` | Instance role and profile, and a support role |
| `variables.tf` | Input variables and their defaults |
| `outputs.tf` | Outputs |
| `example.tfvars` | Placeholder values for the required inputs |

## Prerequisites

- Terraform 1.5 or later ([install guide](https://developer.hashicorp.com/terraform/install))
- Internet access for `terraform init` to download the AWS provider

You do **not** need an AWS account or credentials. Everything in this exercise can be done by reading the code and running `terraform validate`.

## Getting started

1. Clone the repository and change into it.

   ```bash
   git clone <repo-url>
   cd <repo-directory>
   ```

2. Download the AWS provider.

   ```bash
   terraform init
   ```

3. Confirm the configuration is syntactically valid.

   ```bash
   terraform validate
   ```

   You should see `Success! The configuration is valid.` A valid configuration is not the same as a safe one. That's what you're here to judge.

4. Read through the files. A sensible order is `variables.tf` first, then `main.tf`, `security.tf`, `s3.tf`, and `iam.tf`.

`terraform plan` is not part of the exercise. It needs AWS credentials to look up the AMI and account ID, and it isn't necessary to complete the review.

## What to do

Review the code the way you would review a teammate's pull request before it goes to production. Focus on security, but note anything else you'd raise in a real review.

For each problem you find, write down:

- **Where:** the file and the resource or variable
- **What:** what's wrong
- **Why it matters:** what could realistically go wrong if this merged
- **Fix:** how you'd change it (a code snippet is welcome but not required)

Then rank your findings in the order you would fix them.

If something looks unusual but you think it's acceptable, say so and explain why. Knowing what *not* to flag counts as much as knowing what to flag.

## Submitting

Send your notes back in whatever format is easiest for you: a Markdown file, a doc, or plain text in an email.

## What happens next

We'll schedule a follow-up conversation where you walk us through your findings. Expect questions about your reasoning, how you'd prioritize, and how you'd roll fixes out safely. You can use the documentation and tools you'd normally use at work, but be ready to explain every finding in your own words.

## Questions

If anything about the setup is unclear or `terraform init` fails, reply to the email you received this exercise in. Questions about logistics are welcome; we won't give hints about the review itself.
