packer {
  required_plugins {
    vsphere = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/vsphere"
    }
  }
}

source "vsphere-iso" "win2022" {
  vcenter_server       = var.vsphere_server
  username             = var.vsphere_user
  password             = var.vsphere_password
  insecure_connection  = true
  datacenter           = var.vsphere_dc_name
  cluster              = var.vsphere_compute_cluster
  # network              = var.network
  host                 = var.host
  datastore            = var.vsphere_datastore
  folder               = var.vsphere_folder
  vm_name              = var.vsphere_template_name
  guest_os_type        = "windows9Server64Guest"
  CPUs                 = var.cpu_num
  RAM                  = var.mem_size
  RAM_reserve_all      = false
  
 storage{
    disk_size = var.disk_size
    disk_thin_provisioned = true
  }
  disk_controller_type = ["pvscsi"]
  
  network_adapters {
    network            = var.vsphere_portgroup_name
    network_card       = "vmxnet3"
  }
  iso_paths            = [var.os_iso_path]
  # iso_url               =  var.iso_url
   iso_checksum =         var.iso_checksum
  floppy_files         = ["autounattend.xml"]
  communicator         = "winrm"
  winrm_username       = "Administrator"
  winrm_password       = var.winadmin_password
  winrm_insecure       = true
  winrm_timeout        = "6h"
}

build {
  sources = ["source.vsphere-iso.win2022"]

  provisioner "windows-shell" {
    inline = [
      "powershell -Command \"Mount-DiskImage -ImagePath 'D:\\windows.iso'\"",
      "Start-Process -FilePath 'D:\\setup.exe' -ArgumentList '/S /v\"/qn REBOOT=R\"' -Wait"
    ]
  }

  provisioner "windows-shell" {
    inline = ["dir c:\\"]
  }

  provisioner "windows-shell" {
    inline = [
      "powershell -Command \"Mount-DiskImage -ImagePath 'D:\\vmtools.iso'\"",
      "Start-Process -FilePath 'D:\\setup.exe' -ArgumentList '/S /v\"/qn REBOOT=R\"' -Wait"
    ]
  }

  }
