# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "Security_watch_1"
resource "xray_watch" "Security_watch_1" {
  active           = true
  description      = "This is a new watch created using API V2"
  name             = "Security_watch_1"
  project_key      = null
  watch_recipients = null
  assigned_policy {
    name = "Security_policy_1"
    type = "security"
  }
  watch_resource {
    bin_mgr_id = "default"
    name       = null
    repo_type  = null
    type       = "all-repos"
  }
}

# __generated__ by Terraform from "jk-test"
resource "platform_group" "jk_test" {
  admin_privileges = true
  auto_join        = false
  description      = null
  external_id      = null
  manage_resources = true
  manage_webhook   = true
  name             = "jk-test"
  policy_manager   = true
  policy_viewer    = true
  reports_manager  = true
  watch_manager    = true
}

# __generated__ by Terraform from "Security_policy_1"
resource "xray_security_policy" "Security_policy_1" {
  description = ""
  name        = "Security_policy_1"
  project_key = null
  type        = "security"
  rule {
    name     = "Critical_CVEs"
    priority = 1
    actions {
      block_release_bundle_distribution  = false
      block_release_bundle_promotion     = false
      build_failure_grace_period_in_days = 0
      create_ticket_enabled              = false
      fail_build                         = false
      fail_pull_request                  = false
      mails                              = null
      notify_deployer                    = false
      notify_watch_recipients            = false
      webhooks                           = null
      block_download {
        active            = false
        grace_period_days = 0
        unscanned         = false
      }
    }
    criteria {
      applicable_cves_only  = true
      fix_version_dependant = true
      malicious_package     = null
      min_severity          = "Critical"
      package_name          = null
      package_type          = null
      package_versions      = null
      vulnerability_ids     = null
    }
  }
  rule {
    name     = "Malicious_packages"
    priority = 2
    actions {
      block_release_bundle_distribution  = false
      block_release_bundle_promotion     = false
      build_failure_grace_period_in_days = 0
      create_ticket_enabled              = false
      fail_build                         = false
      fail_pull_request                  = false
      mails                              = null
      notify_deployer                    = false
      notify_watch_recipients            = false
      webhooks                           = null
      block_download {
        active            = true
        grace_period_days = 0
        unscanned         = false
      }
    }
    criteria {
      applicable_cves_only  = null
      fix_version_dependant = null
      malicious_package     = true
      min_severity          = null
      package_name          = null
      package_type          = null
      package_versions      = null
      vulnerability_ids     = null
    }
  }
  rule {
    name     = "High_Exposures"
    priority = 3
    actions {
      block_release_bundle_distribution  = false
      block_release_bundle_promotion     = false
      build_failure_grace_period_in_days = 0
      create_ticket_enabled              = false
      fail_build                         = false
      fail_pull_request                  = false
      mails                              = null
      notify_deployer                    = false
      notify_watch_recipients            = false
      webhooks                           = null
      block_download {
        active            = false
        grace_period_days = 0
        unscanned         = false
      }
    }
    criteria {
      applicable_cves_only  = null
      fix_version_dependant = null
      malicious_package     = null
      min_severity          = null
      package_name          = null
      package_type          = null
      package_versions      = null
      vulnerability_ids     = null
      exposures {
        applications = true
        iac          = true
        min_severity = "High"
        secrets      = true
        services     = true
      }
    }
  }
}

# __generated__ by Terraform from "docker-trial"
resource "artifactory_local_docker_v2_repository" "docker_trial" {
  archive_browsing_enabled = false
  blacked_out              = false
  block_pushing_schema1    = true
  cdn_redirect             = false
  download_direct          = false
  includes_pattern         = "**/*"
  key                      = "docker-trial"
  max_unique_tags          = 0
  priority_resolution      = false
  project_environments     = []
  property_sets            = null
  repo_layout_ref          = "maven-2-default"
  tag_retention            = 1
  xray_index               = true
}

# __generated__ by Terraform from "Any Remote"
resource "platform_permission" "Any_Remote" {
  artifact = {
    actions = {
      groups = [
      ]
      users = [
      ]
    }
    targets = [
      {
        exclude_patterns = null
        include_patterns = ["**"]
        name             = "ANY REMOTE"
      },
    ]
  }
  build           = null
  destination     = null
  name            = "Any Remote"
  pipeline_source = null
  release_bundle  = null
}

# __generated__ by Terraform from "readers"
resource "platform_group" "readers" {
  admin_privileges = false
  auto_join        = true
  description      = "A group for read-only users"
  external_id      = null
  manage_resources = false
  manage_webhook   = false
  name             = "readers"
  policy_manager   = false
  policy_viewer    = false
  reports_manager  = false
  watch_manager    = false
}

# __generated__ by Terraform from "Anything"
resource "platform_permission" "Anything" {
  artifact = {
    actions = {
      groups = [
        {
          name        = "readers"
          permissions = ["READ"]
        },
      ]
      users = [
      ]
    }
    targets = [
      {
        exclude_patterns = null
        include_patterns = ["**"]
        name             = "ANY"
      },
    ]
  }
  build = {
    actions = {
      groups = [
        {
          name        = "readers"
          permissions = ["READ"]
        },
      ]
      users = [
      ]
    }
    targets = [
      {
        exclude_patterns = null
        include_patterns = ["**"]
        name             = "artifactory-build-info"
      },
    ]
  }
  destination     = null
  name            = "Anything"
  pipeline_source = null
  release_bundle  = null
}

# __generated__ by Terraform from "jk-test-permissiontarget"
resource "platform_permission" "jk_test_permissiontarget" {
  artifact = {
    actions = {
      groups = [
        {
          name        = "readers"
          permissions = ["ANNOTATE", "DELETE", "READ", "SCAN", "WRITE"]
        },
      ]
      users = [
      ]
    }
    targets = [
      {
        exclude_patterns = null
        include_patterns = ["**"]
        name             = "jk-project-mavn-dev-local"
      },
      {
        exclude_patterns = null
        include_patterns = ["**"]
        name             = "jk-project-mavn-dev-remote"
      },
    ]
  }
  build           = null
  destination     = null
  name            = "jk-test-permissiontarget"
  pipeline_source = null
  release_bundle  = null
}

# __generated__ by Terraform from "jk-project-mavn-dev-virtual"
resource "artifactory_virtual_maven_repository" "jk_project_mavn_dev_virtual" {
  artifactory_requests_can_retrieve_remote_artifacts = false
  default_deployment_repo                            = "jk-project-mavn-dev-local"
  description                                        = null
  excludes_pattern                                   = null
  force_maven_authentication                         = false
  includes_pattern                                   = "**/*"
  key                                                = "jk-project-mavn-dev-virtual"
  key_pair                                           = null
  notes                                              = null
  pom_repository_references_cleanup_policy           = "discard_active_reference"
  project_environments                               = ["DEV"]
  project_key                                        = "jk-project"
  repo_layout_ref                                    = "maven-2-default"
  repositories                                       = ["jk-project-mavn-dev-local", "jk-project-mavn-dev-remote"]
}

# __generated__ by Terraform from "tf-trial"
resource "artifactory_local_terraformbackend_repository" "tf_trial" {
  archive_browsing_enabled = false
  blacked_out              = false
  cdn_redirect             = false
  download_direct          = false
  includes_pattern         = "**/*"
  key                      = "tf-trial"
  priority_resolution      = false
  project_environments     = []
  property_sets            = null
  repo_layout_ref          = "maven-2-default"
  xray_index               = true
}

# __generated__ by Terraform from "example-repo-local"
resource "artifactory_local_generic_repository" "example_repo_local" {
  archive_browsing_enabled = false
  blacked_out              = false
  cdn_redirect             = false
  description              = "Example artifactory repository"
  download_direct          = false
  includes_pattern         = "**/*"
  key                      = "example-repo-local"
  priority_resolution      = false
  project_environments     = []
  property_sets            = null
  repo_layout_ref          = "simple-default"
  xray_index               = false
}

# __generated__ by Terraform from "jk-project-mavn-dev-remote"
resource "artifactory_remote_maven_repository" "jk_project_mavn_dev_remote" {
  allow_any_host_auth                   = false
  archive_browsing_enabled              = false
  assumed_offline_period_secs           = 300
  blacked_out                           = false
  block_mismatching_mime_types          = true
  bypass_head_requests                  = false
  cdn_redirect                          = false
  curated                               = false
  disable_proxy                         = false
  disable_url_normalization             = false
  download_direct                       = false
  enable_cookie_management              = false
  fetch_jars_eagerly                    = false
  fetch_sources_eagerly                 = false
  handle_releases                       = true
  handle_snapshots                      = true
  hard_fail                             = false
  includes_pattern                      = "**/*"
  key                                   = "jk-project-mavn-dev-remote"
  list_remote_folder_items              = false
  max_unique_snapshots                  = 0
  metadata_retrieval_timeout_secs       = 60
  missed_cache_period_seconds           = 1800
  offline                               = false
  pass_through                          = false
  password                              = null # sensitive
  priority_resolution                   = false
  project_environments                  = ["DEV"]
  project_key                           = "jk-project"
  property_sets                         = ["artifactory"]
  reject_invalid_jars                   = false
  remote_repo_checksum_policy_type      = "generate-if-absent"
  repo_layout_ref                       = "maven-2-default"
  retrieval_cache_period_seconds        = 7200
  socket_timeout_millis                 = 15000
  store_artifacts_locally               = true
  suppress_pom_consistency_checks       = false
  synchronize_properties                = false
  unused_artifacts_cleanup_period_hours = 0
  url                                   = "https://repo1.maven.org/maven2/"
  xray_index                            = true
}

# __generated__ by Terraform from "jeffreyyk@jfrog.com"
resource "artifactory_unmanaged_user" "jeffreyyk_jfrog_com" {
  admin                      = true
  disable_ui_access          = false
  email                      = "jeffreyyk@jfrog.com"
  groups                     = ["readers"]
  internal_password_disabled = false
  name                       = "jeffreyyk@jfrog.com"
  password_policy            = null
  profile_updatable          = true
}

# __generated__ by Terraform from "jk-test"
resource "artifactory_unmanaged_user" "jk_test" {
  admin                      = true
  disable_ui_access          = false
  email                      = "jeffreyyk@jfrog.com"
  groups                     = ["jk-test", "readers"]
  internal_password_disabled = false
  name                       = "jk-test"
  password_policy            = null
  profile_updatable          = true
}

# __generated__ by Terraform from "jk-project-mavn-dev-local"
resource "artifactory_local_maven_repository" "jk_project_mavn_dev_local" {
  archive_browsing_enabled        = false
  blacked_out                     = false
  cdn_redirect                    = false
  checksum_policy_type            = "client-checksums"
  download_direct                 = false
  handle_releases                 = true
  handle_snapshots                = true
  includes_pattern                = "**/*"
  key                             = "jk-project-mavn-dev-local"
  max_unique_snapshots            = 0
  priority_resolution             = false
  project_environments            = ["DEV"]
  project_key                     = "jk-project"
  property_sets                   = ["artifactory"]
  repo_layout_ref                 = "maven-2-default"
  snapshot_version_behavior       = "unique"
  suppress_pom_consistency_checks = false
  xray_index                      = true
}
