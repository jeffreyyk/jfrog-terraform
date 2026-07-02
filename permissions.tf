resource "platform_permission" "my_permission" { 
 name = "developers-permission" 
 artifact = { 
 targets = [{ 
  name = "generic-local" 
  include_patterns = ["**"] 
  exclude_patterns = [""] # must have at least 1 element — use [""] not []
  operations = ["READ", "WRITE", "ANNOTATE"] 
 }] 
 principals = { 
  groups = [{ name = "developers", operations = ["READ", "WRITE"] }]
  } 
 } 
}
