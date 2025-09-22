variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "repo_url" {
  default = "https://github.com/Trainings-TechEazy/test-repo-for-devops"
}
