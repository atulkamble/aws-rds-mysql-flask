provider "aws" {
  region = var.aws_region
}

resource "aws_db_instance" "mysql_rds" {
  identifier              = "mydb"
  allocated_storage       = var.db_allocated_storage
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  publicly_accessible     = true
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
}

resource "aws_security_group" "rds_sg" {
  name        = "allow-mysql"
  description = "Allow MySQL inbound traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
