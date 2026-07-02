resource "xray_custom_curation_condition" "high_severity" { 
 name = "high-severity-vulnerabilities" 
 condition_template_id = "CVECVSSRange" 
 param_values = jsonencode([ 
  { param_id = "vulnerability_cvss_score_range", value = [7.0, 10.0] },
  { param_id = "apply_only_if_fix_is_available", value = true }
 ]) 
}
