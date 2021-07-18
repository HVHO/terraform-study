output "s3_bucket_arn" {
	value = aws_s3_bucket.terraform_state.arn
}

output "dayamo_table_name" {
	value = aws_dynamodb_table.terraform_locks.name
}