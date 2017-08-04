provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "wordpress_server" {
  ami           = "ami-099fe766"
  instance_type = "t2.micro"
  key_name = "admin_key"
  security_groups = ["${aws_security_group.wp_security.name}"]

tags {
    Name = "wordpress-server"
  }
provisioner "local-exec" {
    command = "echo [wordpress] > ansible/hosts;echo ${aws_instance.wordpress_server.public_ip} >> ansible/hosts"
  }
provisioner "local-exec" {
    command = "sleep 120; ssh -o StrictHostKeyChecking=no -i ./keys/admin_key ubuntu@${aws_instance.wordpress_server.public_ip} sudo apt-get install python -y; ansible-playbook -u ubuntu --private-key ./keys/admin_key -i ansible/hosts ansible/playbook.yml; ./output.sh"
  }
}
