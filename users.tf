# Create a new Artifactory user called terraform
resource "artifactory_unmanaged_user" "test-user" {
  name     = "terraform"
  email    = "test-user@artifactory-terraform.com"
#  groups   = ["logged-in-users"]
  password = "TempPassword#123!"
}
