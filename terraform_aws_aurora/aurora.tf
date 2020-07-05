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

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.r4.large"
  engine             = "aurora-postgresql"
  engine_version     = "11.7"
  publicly_accessible = true
  db_subnet_group_name = aws_db_subnet_group.subnet_public_group.id
}

resource "aws_rds_cluster" "default" {
  cluster_identifier = "aurora-cluster-demo"
  availability_zones = ["us-east-1a", "us-east-1b"]
  engine             = "aurora-postgresql"
  engine_version     = "11.7"
  database_name      = "postgres"
  master_username    = "postgres"
  master_password    = "postgresabc"
  vpc_security_group_ids = [aws_security_group.rds_allow_home_connection.id]
  db_subnet_group_name = aws_db_subnet_group.subnet_public_group.id
}


#output "rds_postgres_db_instance_endpoint" {
#  value = aws_db_instance.rds_postgres_db_instance.endpoint
#}