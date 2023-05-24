/*
 * variables.tf
 * Common variables to use in various Terraform files (*.tf)
 */

# The AWS region to use for the bucket and registry; typically `us-east-1`.
# Other possible values: `us-east-2`, `us-west-1`, or `us-west-2`.
# Currently, Fargate is only available in `us-east-1`.
variable "region" {
  default = "us-east-1"
}

# The AWS profile to use, this would be the same value used in AWS_PROFILE.
variable "aws_profile" {
  default = "default"
}

# The role that will have access to the S3 bucket, this should be a role that all
# members of the team have access to.
#variable "saml_role" {}

# Name of the application. This value should usually match the application tag below.
variable "app" {
  default = "openPELServices"
}
# Name of the environment. This value should usually match the application tag below.
variable "env" {
  default = "test"
}

# A map of the tags to apply to various resources. The required tags are:
# `application`, name of the app;
# `environment`, the environment being created;
# `team`, team responsible for the application;
# `contact-email`, contact email for the _team_;
# and `customer`, who the application was create for.

variable "tags" {
  type = "map"
  default = {
    Name        = "default-name"
    application = "openPELServices"
    environment = "dev"
  }
}

# NOTE: set 2 if we want alb (auto load balancer)
variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "1" 
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 6000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 1
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}
