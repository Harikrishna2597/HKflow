terraform {
  backend "s3" {
    bucket = "do-not-delete-myhkbucket"        #replace with the project specific bucketname
    key    = "backend/terraform.tfstate"
    region = "ap-south-1"                                          #replce the region
    dynamodb_table = "terraform-state-lock-DO-NOT-DELETE"          #do not change the dynamoDB table name
  }
}