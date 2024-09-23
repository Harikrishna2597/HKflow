resource "aws_instance" "my_instance_new2" {
  ami           = "ami-0ad21ae1d0696ad58" 
  instance_type = "t2.micro"
  key_name      = aws_key_pair.newkeypair2.key_name
  

  tags = {
    Name = "MyEC2Instance"
  }
}


resource "aws_key_pair" "newkeypair2" {
key_name = var.hk12_key
public_key = tls_private_key.rsa_hk_new2.public_key_openssh
depends_on = [aws_s3_bucket.newbucket]
}

#key pair which has been created above is encrypted with RSA algorithm 4096 bits, we can change this accroding to requirement 
resource "tls_private_key" "rsa_hk_new2" {
algorithm = "RSA"
rsa_bits  = 4096
}

#this creates a file in our working directory and download the aws key pair which we have created above
resource "local_file" "hk_key_new2" {
content  = tls_private_key.rsa_hk_new2.private_key_pem
filename = var.hk12_key.key_pair_pem
depends_on = [aws_key_pair.newkeypair2]
}

output "key_pair_pem" {
  value     = aws_key_pair.newkeypair2.public_key
  sensitive = true
}