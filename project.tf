provider "linode" {
  #this is from your account
  token = ""
}

resource "linode_instance" "terraform-web" {
        image = "linode/centos7"
        label = "SkyCloud"
        group = "Terraform"
        region = "us-east"
        type = "g6-standard-8"
	#generate a new authorized key here before you run this after March 6th
        root_pass = "P@ssw0rd!"
}
