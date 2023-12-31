resource "databricks_secret_acl" "spectators" {
  principal  = databricks_group.spectators.display_name
  scope      = databricks_secret_scope.this.name
  permission = "READ"
}

resource "databricks_group" "spectators" {
  display_name = "Spectators (by ${data.databricks_current_user.me.alphanumeric})"
}

resource "databricks_user" "dummy" {
  user_name    = "dummy+${data.databricks_current_user.me.alphanumeric}@example.com"
  display_name = "Dummy ${data.databricks_current_user.me.alphanumeric}"
}

resource "databricks_group_member" "a" {
  group_id  = databricks_group.spectators.id
  member_id = databricks_user.dummy.id
}

resource "databricks_permissions" "notebook" {
  notebook_path = databricks_notebook.this.id
  access_control {
    user_name        = databricks_user.dummy.user_name
    permission_level = "CAN_RUN"
  }
  access_control {
    group_name       = databricks_group.spectators.display_name
    permission_level = "CAN_READ"
  }
}

resource "databricks_permissions" "job" {
  job_id = databricks_job.this.id
  access_control {
    user_name        = databricks_user.dummy.user_name
    permission_level = "IS_OWNER"
  }
  access_control {
    group_name       = databricks_group.spectators.display_name
    permission_level = "CAN_MANAGE_RUN"
  }
}

resource "databricks_permissions" "cluster" {
  cluster_id = databricks_cluster.this.id
  access_control {
    user_name        = databricks_user.dummy.user_name
    permission_level = "CAN_RESTART"
  }
  access_control {
    group_name       = databricks_group.spectators.display_name
    permission_level = "CAN_ATTACH_TO"
  }
}

resource "databricks_permissions" "policy" {
  cluster_policy_id = databricks_cluster_policy.this.id
  access_control {
    group_name       = databricks_group.spectators.display_name
    permission_level = "CAN_USE"
  }
}

resource "databricks_permissions" "pool" {
  instance_pool_id = databricks_instance_pool.smallest_nodes.id
  access_control {
    group_name       = databricks_group.spectators.display_name
    permission_level = "CAN_ATTACH_TO"
  }
}