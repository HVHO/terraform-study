output "address" {
	value = aws_db_instance.db.address
}

output "port" {
	value = aws_db_instance.db.port
}

output "user" {
	value = aws_db_instance.db.username
}

output "pass" {
	value = aws_db_instance.db.password
	sensitive = true 
}