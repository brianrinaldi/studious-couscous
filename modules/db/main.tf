# main.tf
resource "google_sql_database_instance" "master" {
  name             = "${var.db_name}"
  project          = "${var.project}"
  region           = "${var.region}"
  database_version = "${var.database_version}"

  settings {
    tier                        = "${var.tier}"
    ip_configuration {
        ipv4_enabled = "true"

        authorized_networks {
          value           = "0.0.0.0/0"
          name            = "all"
        }
    }
  }

  # replica_configuration = ["${var.replica_configuration}"]
}

resource "google_sql_database" "default" {
  name      = "${var.db_name}"
  project   = "${var.project}"
  instance  = "${google_sql_database_instance.master.name}"
  charset   = "${var.db_charset}"
  collation = "${var.db_collation}"
}

resource "google_sql_user" "default" {
  name     = "${var.user_name}"
  project  = "${var.project}"
  instance = "${google_sql_database_instance.master.name}"
  host     = "${var.user_host}"
  password = "${var.user_password}"
}
