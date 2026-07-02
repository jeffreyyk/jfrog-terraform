resource "xray_watch" "my_watch" { 
 name = "my-watch" 
 active = true 
 watch_resource { type = "all-repos" } 
 assigned_policy { 
 name = "my-security-policy" 
 type = "security" 
 }
}
