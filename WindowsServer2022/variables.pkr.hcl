variable "vsphere_server" {
    type    = string
    default = "poc25945-vc.wwtpoc.local"
  }
  variable "vm_name" {
  type    = string
  default = "ws2022"
  description = "The name of the VM when building"
}
  
  variable "vsphere_user" {
    type    = string
    default = "administrator@vsphere.local"
  }
  
  variable "vsphere_password" {
    type    = string
    default = "2Hs4yO2E2=eCO_y1"
  }
  
  variable "vsphere_template_name" {
    type    = string
    default = "Win2022clone_withupdates"
  }
  
  variable "vsphere_folder" {
    type    = string
    default = "Templates"
  }
  
  variable "vsphere_dc_name" {
    type    = string
    default = "poc25945"
  }
  
  variable "vsphere_compute_cluster" {
    type    = string
    default = "poc25945-cluster"
  }
   variable "vsphere_portgroup_name" {
    type    = string
    default = "DPortGroup"
  }
  
  variable "network" {
    type    = string
    default = "VDI-v75"
  }
   variable "host" {
    type    = string
    default = "fp6blade52.wwtpoc.local"
  }

  
 
  
  variable "vsphere_datastore" {
    type    = string
    default = "NFS-POC25945"
  }
  
  variable "winadmin_password" {
    type    = string
    default = "Secretpassword"
  }
  
  variable "cpu_num" {
    type    = number
    default = 4
  }
  
  variable "mem_size" {
    type    = number
    default = 4096
  }
  
  variable "disk_size" {
    type    = number
    default = 65536
  }
  variable "disk_type" {
  type    = string
  default = "thin"
}

variable "disk_controller_type" {
  type    = string
  default = "pvscsi"
}
  
  variable "os_iso_path" {
    type    = string
    default = "[NFS-POC25945] ISO/en_windows_server_2022_preview_x64_dvd_3bd1e657.iso"
  }
#   variable "iso_url" {
#   type    = string
#   default = "https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2022"
#   description = "The download url for the installation ISO"
# }
variable "iso_checksum" {
  type    = string
  default = "sha256:4f1457c4fe14ce48c9b2324924f33ca4f0470475e6da851b39ccbf98f44e7852"
  description = "The checksum for the ISO specified in `iso_url`"
}
  
  variable "vmtools_iso_path" {
    type    = string
    default = "[NFS-POC25945] /vmimages/tools-isoimages/windows.iso"
  }