# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.auth_token}"
}

# Create a project
resource "packet_project" "cool_project" {
  name           = "My First Terraform Project"
}

# Create a device and add it to tf_project_1
resource "packet_device" "web1" {
  hostname         = "tf.coreos2"
  plan             = "c1.small.x86"
  facility         = "ewr1"
  operating_system = "coreos_stable"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.cool_project.id}"
}

