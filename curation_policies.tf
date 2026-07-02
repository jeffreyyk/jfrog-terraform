resource "xray_curation_policy" "block_malicious" { 
  name                  = "block-malicious" 
  condition_id          = "1" 
#  scope                 = "pkg_types"
#  pkg_types_include     = ["npm", "PyPI"]
  scope                 = "all_repos"
  policy_action         = "block" 
  waiver_request_config = "forbidden" 
}

resource "xray_curation_policy" "example_dry_run" {
  name                  = "dry-run-test-policy"
  condition_id          = "7"
  scope                 = "specific_repos"
  
  # Change this to an actual repository key found in your Artifactory platform
  repo_include          = ["maven-dev-remote"] 
  
  policy_action         = "block"
  waiver_request_config = "forbidden"
  
  notify_emails         = ["audit@company.com"]
}

resource "xray_curation_policy" "dev_audit" { 
 name = "dev-audit-policy" 
 condition_id = "3" 
 scope = "all_repos" 
 repo_exclude = ["maven-dev-remote"] 
 policy_action = "dry_run" 
 waiver_request_config = "auto_approved" 
 notify_emails = ["dev-team@company.com"] 
}

resource "xray_curation_policy" "docker_block" { 
 name = "non-official-docker-block" 
 condition_id = "17" 
 scope = "all_repos"
# scope = "pkg_types" 
# pkg_types_include = ["docker"] 
 policy_action = "block" 
 waiver_request_config = "manual" 
 decision_owners = ["curation-admin-group"] 
} 

resource "xray_curation_policy" "adnovum_nolicense_restrictions" {
 name = "sum_adnovum_nolicense-compliance-policy"
 condition_id = "8" 
 scope = "all_repos" 
 policy_action = "dry_run" 
 waiver_request_config = "manual" 
 decision_owners = ["terraform_curation_admin_group"] 
 notify_emails = ["security@company.com"] 
 waivers = [{ 
 pkg_type = "npm" 
 pkg_name = "lodash" 
 all_versions = false
 pkg_versions = ["4.18.1"] 
 justification = "Patched version - security team approved"  }] 
 label_waivers = [{ 
 label = "jk-project-banned-label" 
 justification = "Packages with approved open source licenses"  }] 
} 

resource "xray_curation_policy" "adnovum_immature_dry_run" { 
 name = "sum_adnovum_immature-audit-policy" 
 condition_id = "14" 
 scope = "all_repos" 
 policy_action = "dry_run" # test mode — logs violations without blocking 
 waiver_request_config = "forbidden" 
 notify_emails = ["security@company.com"] 
} 

resource "xray_curation_policy" "adnovum_aged_dry_run" { 
 name = "sum_adnovum_aged-audit-policy" 
 condition_id = "12" 
 scope = "all_repos" 
 policy_action = "dry_run" # test mode — logs violations without blocking 
 waiver_request_config = "forbidden" 
 notify_emails = ["security@company.com"] 
} 

resource "xray_curation_policy" "adnovum_multi_ecosystem_dry_run" { 
 name = "sum_adnovum_multi-ecosystem-audit-policy" 
 condition_id = "3" 
 scope = "pkg_types" 
 pkg_types_include = ["npm"] 
 policy_action = "dry_run" # test mode — logs violations without blocking 
 waiver_request_config = "forbidden" 
 notify_emails = ["security@company.com"] 
} 

resource "xray_curation_policy" "adnovum_nodockerhub_official_block" { 
 name = "sum_adnovum_nodockerhub_official_block"
 condition_id = "17" 
 scope = "all_repos"
# scope = "pkg_types" 
# pkg_types_include = ["docker"] 
 policy_action = "block" 
 waiver_request_config = "manual" 
 decision_owners = ["terraform_curation_admin_group"] 
 notify_emails = ["security@company.com"] 
} 

#resource "xray_curation_policy" "docker_block_new" {  
#  name                  = "non-official-docker-block_new"  
#  condition_id          = "17"  
  
  # Use specific_repos and pass the exact key of your docker remote repo
#  scope                 = "specific_repos"  
#  repo_include          = ["docker-dev-remote"]  
  
#  policy_action         = "block"  
#  waiver_request_config = "manual"  
#  decision_owners       = ["curation-admin-group"]  
#} 

#resource "xray_curation_policy" "adnovum_nodockerhub_official_block_new" {  
#  name                  = "sum_adnovum_nodockerhub_official_block_new"
#  condition_id          = "17"  
  
  # Match the specific repo scope here too
#  scope                 = "specific_repos"  
#  repo_include          = ["docker-dev-remote"]  
  
#  policy_action         = "block"  
#  waiver_request_config = "manual"  
#  decision_owners       = ["terraform_curation_admin_group"]  
#  notify_emails         = ["security@company.com"]  
#}

resource "xray_custom_curation_condition" "high_severity_vulns_new" { 
 name = "high-severity-vulnerabilities_new" 
 condition_template_id = "CVECVSSRange" 
 param_values = jsonencode([ 
 { param_id = "vulnerability_cvss_score_range", value = [7.0, 10.0] }, 
 { param_id = "apply_only_if_fix_is_available", value = true }, 
 { param_id = "do_not_apply_for_already_existing_vulnerabilities", value = false }, 
 { param_id = "epss", value = { percentile = 90.0 } } 
 ]) 
}

resource "xray_custom_curation_condition" "license_compliance" { 
 name = "license-compliance" 
 condition_template_id = "BannedLicenses" 
 param_values = jsonencode([ 
 { param_id = "list_of_package_licenses", value = ["GPL-3.0"] },
 { param_id = "multiple_license_permissive_approach", value = false } 
 ]) 
}

resource "xray_custom_curation_condition" "unmaintained_packages" { 
 name = "unmaintained-packages" 
 condition_template_id = "OpenSSF" 
 param_values = jsonencode([ 
 { param_id = "list_of_scorecard_checks", value = { maintained = 5 } }, 
 { param_id = "block_in_case_check_value_is_missing", value = true } 
 ]) 
}

