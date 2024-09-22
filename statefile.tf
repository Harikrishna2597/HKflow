terraform {
  backend "s3" {
    bucket         = "hknv2325"           
    key            = "terraform/state"    
    region         = "ap-south-1"          
  }
}
