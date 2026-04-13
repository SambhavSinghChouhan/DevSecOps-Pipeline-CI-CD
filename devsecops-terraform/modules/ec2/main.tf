resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "devsecops" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (ap-south-1)
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<-EOF
#!/bin/bash
yum update -y

# Install Docker
amazon-linux-extras install docker -y
systemctl start docker
systemctl enable docker

# Add ec2-user to docker group
usermod -aG docker ec2-user

# Install Docker Compose (v2 plugin)
mkdir -p /usr/libexec/docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
  -o /usr/libexec/docker/cli-plugins/docker-compose

chmod +x /usr/libexec/docker/cli-plugins/docker-compose

# Verify installation
docker --version
docker compose version

# Install Trivy
rpm -ivh https://github.com/aquasecurity/trivy/releases/latest/download/trivy.rpm

# Install Java (for OWASP Dependency Check)
yum install java-11-amazon-corretto -y

# Create working directory
mkdir -p /home/ec2-user/app
chown ec2-user:ec2-user /home/ec2-user/app

EOF

  tags = {
    Name = "DevSecOps-Instance"
  }
}