# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/18"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "TF"
  }
}

  
  