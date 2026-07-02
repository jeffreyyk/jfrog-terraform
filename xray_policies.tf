resource "xray_security_policy" "my_policy" { 
  name        = "my-security-policy" 
  description = "" 
  type        = "security" 
  
  rule { 
    name     = "high-severity-rule" 
    priority = 1 
    
    criteria { 
      min_severity = "High" 
    } 
    
    actions { 
      block_download { active = true } 
      fail_build = true 
      
      # Changed from notify_emails to mails
      mails = ["security@company.com"] 
    } 
  } 
}
