# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.auth_token}"
}

# Create a project
resource "packet_project" "Skybox" {
  name           = "SkyBox"
}

# Might need to have a shell script run after the project is spun up, to properly install Apache cloud
# cloudstack GUI that students can interact with
# Create a device and add it to tf_project_1
resource "packet_device" "web1" {
  hostname         = "tf.coreos2"
  plan             = "c1.small.x86"
  facility         = "ewr1"
  operating_system = "coreos_stable"
  billing_cycle    = "hourly"
  # Still need to work on getting the proper project ID down after break
  # Needs work regarding what resources we need
  project_id       = "${packet_project.cool_project.id}"
}

