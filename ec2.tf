resource "aws_instance" "good-morning" {
  ami               = "ami-5b673c34"
  instance_type     = "t2.micro"
  availability_zone = "ap-south-1a"
  security_groups   = ["${aws_security_group.morning-ssh-http.name}"]
  key_name = "zoomkey"
  user_data = <<-EOF
                #! /bin/bash
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo systemctl enable httpd
                echo "<h1>Sample Webserver Network Nuts" | sudo tee  /var/www/html/index.html
  EOF


  tags = {
        Name = "webserver"
  }

}
