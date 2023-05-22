# app/env to scaffold
app = "SampleAPI"
environment = "dev"

internal = "true"
container_port = "8080"
replicas = "1"
health_check = "/health"
region = "us-east-1"
aws_profile = "default"
vpc = "vpc-123"
private_subnets = "subnet-123,subnet-456"
public_subnets = "subnet-789,subnet-012"
tags = {
  application = "SampleAPI"
  environment = "dev"
}