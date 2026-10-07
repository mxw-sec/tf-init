output "instance_id" {
  description = "ID of the application instance"
  value       = aws_instance.app.id
}

output "instance_public_ip" {
  description = "Public IP of the application instance"
  value       = aws_instance.app.public_ip
}

output "artifact_bucket" {
  description = "Name of the artifacts bucket"
  value       = aws_s3_bucket.artifacts.id
}

output "support_role_arn" {
  description = "ARN of the support role"
  value       = aws_iam_role.support.arn
}
