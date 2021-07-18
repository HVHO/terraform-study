provider "aws" {
	region = "ap-northeast-2"
}

terraform {
  backend "s3" {
	  bucket = "terraform-up-and-running-state-terry"
	  key = "stage/data-stores/mysql/terraform.tfstate"
	  region = "ap-northeast-2"

	  dynamodb_table = "terraform-up-and-running-locks"
	  encrypt = true
  }
}

resource "aws_db_instance" "db" {
	identifier_prefix = "terraform-up-and-running"
	engine = "mysql"
	allocated_storage = 10
	instance_class = "db.t2.micro"
	name = "example_database"
	username = "admin"

	password =  data.aws_secretsmanager_secret_version.db_password.secret_string
}

data "aws_secretsmanager_secret_version" "db_password" {
	secret_id = "mysql-master-password-stage"
}