provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ssh_open" {
  name        = "ssh-open"
  description = "SSH from anywhere (bad)"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # BAD
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "trivy-playground-public-bucket-example"
  acl    = "public-read" # BAD
  # No server-side encryption configuration (BAD)
}
