terraform {
#  backend "remote" {
#    hostname     = "brightbluemoon.jfrog.io"
#    organization = "terraform-state" # your Terraform Backend repo key
#    workspaces {
#      name = "my-workspace"
#    }
#  }
required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    artifactory = {
      source  = "jfrog/artifactory"
      version = "~> 12.0"
    }
    platform = {
      source  = "jfrog/platform"
      version = "~> 2.0"
    }
    xray = {
      source  = "jfrog/xray"
      version = "~> 3.1"
    }
  }

# ── Remote Backend Configuration ───────────────────────────────────────────
  backend "s3" {
    bucket         = "jk-jfrog-terraform-state-2026"  # Your unique S3 bucket
    key            = "global/jfrog/terraform.tfstate"   # Path inside the bucket where the file will live
    region         = "ap-south-1"                        # AWS Region of your bucket
#    dynamodb_table = "jk-terraform-state-lock"             # Your DynamoDB table name for locking
    encrypt        = true                               # Ensures state is encrypted at rest
    use_lockfile   = true
  }
}

# ── Provider Configurations ───────────────────────────────────────────────
provider "artifactory" {
  url          = "https://brightbluemoon.jfrog.io"
  access_token = var.jfrog_token
}

provider "platform" {
  url          = "https://brightbluemoon.jfrog.io"
  access_token = var.jfrog_token
}

provider "xray" {
  url          = "https://brightbluemoon.jfrog.io"
  access_token = var.jfrog_token
}
