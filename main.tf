# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_api_key}"
}

# Create a project
resource "packet_project" "" {
  name           = "Sandbox Example"
}

# Create a device and add it to sandbox1
# This is just a test, still need to have proper tvars before setting up
resource "packet_device" "sandbox1" {
  hostname         = "tf.centos1"
  plan             = "c1.small.x86"
  facility         = "ewr1"
  operating_system = "centos7"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.cool_project.id}"
}
