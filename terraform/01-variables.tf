#Accepts String value
variable "image_uri" {
  description = "ECR image URI feeded from github workflow"
  type        = string
  default     = "324037290092.dkr.ecr.us-east-1.amazonaws.com/simpleregistry:latest"
}