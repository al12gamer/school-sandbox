provider "packet" {
  auth_token = "${var.packet_api_key}"
}

resource "packet_project" "kvm-lab" {
  name           = "Compute Hosts"
}

# this was copied from https://medium.com/@jmarhee/creating-a-kvm-virtualization-environment-on-packet-net-with-terraform-b29ed69fe6a5 for instructional purposes
# this is being modified to spin up an environment
resource "packet_device" "kvm-node" {
  hostname = "${format("compute-%02d.kvm", count.index)}"
  count = "${var.count}"
  operating_system = "ubuntu_16_04"
  billing_cycle    = "hourly"
  project_id       = "${packet_project.kvm-lab.id}"
  plan             = "baremetal_0"
  facility      = "${var.packet_facility}"
