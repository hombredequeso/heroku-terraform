# Configure the Heroku provider
# set api_key as an environment variable:
# > set HEROKU_API_KEY=***********

provider "heroku" {
    #email = "${var.heroku_account}"
    #api_key = "${var.heroku_api_key}"
}

# Create a new application
resource "heroku_app" "example" {
    name = "heroku-app-proto"
    region = "${var.region}"

    config_vars {
        TEST_PROTO_CV = "abc"
        TEST_PROTO_CV2= "xyz"
    }
}

output "git" {
    value =  "${heroku_app.example.git_url}"
}
output "app_id" {
    value =  "${heroku_app.example.id}"
}
output "app_name" {
    value =  "${heroku_app.example.name}"
}
output "app_url" {
    value =  "${heroku_app.example.web_url}"
}
output "app_hostname" {
    value =  "${heroku_app.example.heroku_hostname}"
}

# Create a database, and configure the app to use it
# hobby-dev : that is the free one
resource "heroku_addon" "database" {
  app = "${heroku_app.example.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon" "monitoring" {
  app = "${heroku_app.example.name}"
  plan = "newrelic:wayne"
}

resource "heroku_addon" "logging" {
  app = "${heroku_app.example.name}"
  plan = "papertrail:choklad"
}
