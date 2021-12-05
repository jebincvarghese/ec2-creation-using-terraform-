resource "aws_instance"  "server" {
    
  ami                          =  "ami-0108d6a82a783b352"
  instance_type                =  "t2.micro"
  associate_public_ip_address  =  true
  key_name                     =  "recovery"
  vpc_security_group_ids       =  [ "sg-00cfca7488d565c49" , "sg-0bcbb656bf4480489"]
  tags = {
    Name = "webserver"
  }
    
}
