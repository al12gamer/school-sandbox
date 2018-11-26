# Example Usage
# Configure the Packet Provider
provider "packet" {
  auth_token = "${var.auth_token}" #need to change this when account approved
}

# Create a project
resource "packet_project" "portsandbox-proj" {
  name           = "Portable Sandbox Project"
  payment_method = "PAYMENT_METHOD_ID"          # use Alex Personal while still testing
}

# Create a device and add it to tf_project_1
resource "packet_device" "web1" {
  hostname         = "c2.medium.x8" #change this to support AMD EPYC 
  plan             = "baremetal_1"  #spot instances on-demand would be cheaper
  facility         = "ewr1"	    #have this tie into the UI to change depending on location of school
  operating_system = "coreos_stable"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.cool_project.id}"
}
