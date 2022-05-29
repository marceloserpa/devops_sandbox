

resource "aws_security_group" "msk-cluster-sg" {
  vpc_id = aws_vpc.main.id
}

resource "aws_kms_key" "kms" {
  description = "msk-cluster-poc"
}

resource "aws_msk_cluster" "msk-cluster-poc" {
  cluster_name           = "msk-cluster-poc"
  kafka_version          = "2.4.1"
  number_of_broker_nodes = 3

  broker_node_group_info {
    instance_type = "kafka.t3.small"

    client_subnets = [
      aws_subnet.public-1.id,
      aws_subnet.public-2.id,
      aws_subnet.public-3.id,
    ]
    storage_info {
      ebs_storage_info {
        volume_size = 1000
      }
    }
    security_groups = [aws_security_group.msk-cluster-sg.id]
  }

  client_authentication {
      unauthenticated = true
  }

  encryption_info {
    encryption_at_rest_kms_key_arn = aws_kms_key.kms.arn
  }

  enhanced_monitoring = "PER_TOPIC_PER_PARTITION"

  tags = {
    Name = "MSK Cluster PoC Marcelo"
  }
}

output "zookeeper_connect_string" {
  value = aws_msk_cluster.msk-cluster-poc.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.msk-cluster-poc.bootstrap_brokers_tls
}

output "bootstrap_brokers" {
  description = "PlainText connection host:port pairs"
  value       = aws_msk_cluster.msk-cluster-poc.bootstrap_brokers
}