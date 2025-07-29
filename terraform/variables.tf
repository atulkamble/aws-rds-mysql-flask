variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "db_name" {
  description = "The name of the MySQL database"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "The master username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
  default     = "admin12345"
}

variable "db_instance_class" {
  description = "The instance type for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance (in GB)"
  type        = number
  default     = 20
}

variable "db_engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The version of the MySQL engine"
  type        = string
  default     = "8.0"
}

variable "vpc_cidr" {
  description = "The CIDR block for allowing inbound MySQL traffic"
  type        = string
  default     = "0.0.0.0/0"  # NOTE: Change to your IP for production use
}
