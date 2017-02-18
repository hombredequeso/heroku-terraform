# heroku-terraform

A [Terraform](https://www.terraform.io) project for managing the infrastructure of a [Heroku](https://www.heroku.com/) application.
The infrastructure created is a single application, with a Postgres database, and 'New Relic' and 'Papertrail' add-ons.
The project definition allows for it to be created using a free Heroku account, although for the 'New Relic' and 'Papertrail' add-ons it is necessary to confirm the account by registering a credit card (which will incur a 1c transaction).

## Usage 

* Set the environment variable HEROKU_EMAIL to the heroku account name.
  e.g. on windows:
  set HEROKU_EMAIL=abc@gmail.com
* Set the environment variable HEROKU_API_KEY to the account api key.
  e.g. on windows:
  set HEROKU_API_KEY=1234567890
* In variables.tf set the region.
'''
terraform plan
terraform apply
'''

## Notes
### Overview
This project originally existed as a way to learn terraform in a low cost and relatively simple infrastructure.
### Terraform state
The terraform state is no committed to the repository for security reasons. Given the critical nature of the terraform state file (terraform.tfstate), it is important to take care of it. The 'backup.state.bat' file copies the terraform.tfstate file to backed-up folder. Clearly this is not intended to be commercial solution to the problem, but is merely to highlight the need to attend to this detail.


