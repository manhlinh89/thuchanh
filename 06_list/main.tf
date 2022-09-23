variable "states" {
  type = list(object({
    name       = string
    tags = map(string)
  }))
  description = "List User"
  default = [
    {
      name       = "Paul"
      tags = {
		  "department" = "Sales"
		  "mobile" = "0902209011"
	  }
    },
    {
      name       = "Jonh"
      tags = {
		  "department" = "Software"
		  "mobile" = "0946076717"
	  }
    }
  ]
}

locals {
  generic_code_block = {
    for state in var.states: "${state.name}" => state
  }
}

//-------------------------------------------------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }
  }

  required_version = ">= 1.2.5"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_iam_user" "users" {
	for_each = local.generic_code_block
	name = each.key
	tags = each.value.tags
}


output "test" {
	 //value  = local.generic_code_block
	  value = [
        for ip, ip_value in local.generic_code_block :
            { name = ip_value.name }
    ]
	
 
}