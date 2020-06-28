resource "aws_db_subnet_group" "subnet_public_group" {
  name = "public subnet group rds"
  subnet_ids = [aws_subnet.public-1.id, aws_subnet.public-2.id]

  tags = {
    Name = "Public Subnet Group RDS"
  }
}

resource "aws_security_group" "rds_allow_home_connection" {
  name = "rds_allow_home_connection"
  description = "only connection from my house"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "rds_allow_home_connection"
  }
  
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "TCP"
    cidr_blocks = [var.home_ip]
  }
}

resource "aws_db_instance" "rds_postgres_db_instance" {
  identifier           = "rds-postgres-db-instance"
  vpc_security_group_ids = [aws_security_group.rds_allow_home_connection.id]
  db_subnet_group_name = aws_db_subnet_group.subnet_public_group.id

  deletion_protection  = false
  publicly_accessible  = true
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "11.6"
  instance_class       = "db.t2.micro"
  name                 = "postgres"
  username             = "postgres"
  password             = "postgres"
  skip_final_snapshot  = true
  final_snapshot_identifier = "Ignore"
}

output "rds_postgres_db_instance_endpoint" {
  value = aws_db_instance.rds_postgres_db_instance.endpoint
}