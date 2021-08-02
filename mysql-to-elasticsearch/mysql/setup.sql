CREATE USER 'logstash'@'%' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON *.* TO 'logstash'@'%';

FLUSH PRIVILEGES;