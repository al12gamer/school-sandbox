# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.packet_api_key}"
}

# Create a project
resource "packet_project" "" {
  name           = "Sandbox Example"
  payment_method = "${var.packet_payment_id}"          # Only required for a non-default payment method
}

# Create a device and add it to sandbox1
resource "packet_device" "sandbox1" {
  hostname         = "tf.centos1"
  plan             = "c1.small.x86"
  facility         = "ewr1"
  operating_system = "centos7"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.cool_project.id}"
}
