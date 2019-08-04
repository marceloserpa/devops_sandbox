resource "aws_security_group" "rds_mysql_poc_sg" {
  name = "rds_mysql_poc_sg"

  description = "only connection from my house"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    cidr_blocks = ["${var.home_ip}/32"]
  }

}
resource "aws_db_instance" "rds_mysql_poc_db" {
  identifier           = "rds-poc"
  security_group_names = ["${aws_security_group.rds_mysql_poc_sg.id}"]
  publicly_accessible  = true
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "admin12345"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}