data vsphere_datacenter dc {
  name = "${var.datacenter}"
}

data vsphere_datastore datastore {
  name = "${var.datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data vsphere_network network {
  name = "${var.network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data vsphere_resource_pool resource-pool {
  name = "${var.resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data vsphere_host host {
  name = "${var.host}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data vsphere_virtual_machine "template" {
  name = "${var.template_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  count = "${var.instance_count}"
  name =  "${var.name}"
  resource_pool_id = "${data.vsphere_resource_pool.resource-pool.id}"
  datastore_id = "${data.vsphere_datastore.datastore.id}"
  folder = "${var.folder}"
  host_system_id = "${data.vsphere_host.host.id}"
  annotation = "${var.annotation}"

  num_cpus = "${var.cpu}"
  memory = "${var.memory}"
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label = "${var.disk_label}"

    datastore_id = "${data.vsphere_datastore.datastore.id}"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
    linked_clone = false

    customize {
      linux_options {
        host_name = "${var.name}"
        domain    = "${var.domain}"
      }

      network_interface {}
    }
  }
}
