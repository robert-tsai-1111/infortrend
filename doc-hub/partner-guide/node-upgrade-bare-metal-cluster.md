
## KS Upgrade Bare Metal to Cluster System


### 1. Overview

This document describes the procedure for upgrading KS bare metal server(s) to a Cluster system and applying the required license entitlement to each server.

The upgrade process must be performed individually for each machine/server/node and its corresponding serial number. Prepare a Cluster system license file and a USB installation image for each node, as required.

Important: Complete the upgrade on one node before proceeding to the next node. Do not upgrade multiple nodes simultaneously.

> **⚠️ Warning!**
> 
> The KS machine upgrade process may modify or erase data on the target M.2 drive and the USB device. Verify the target device before starting the upgrade.


### 2. Prerequisites and Required Materials

Before starting the upgrade, prepare the following:

* **Workstation**: A working machine running Windows or Linux, with a supported web browser installed, such as Microsoft Edge or Google Chrome.
* **Network access**: Network connectivity to the Infortrend support and product activation websites to obtain the required files.
* **USB flash drive**: A USB flash drive with at least 32 GB of usable capacity.
* **Bootable USB creation tool**: A supported tool such as Ventoy, Rufus, or another bootable USB creation utility for writing the provided .iso image to the USB flash drive. Refer to the selected tool's documentation for detailed instructions.
* **Machine information**: The Serial Number (SN) and Part Number (PN) of each KS machine/node.
* **License information**: The License Serial Number provided by Infortrend.

> **⚠️ Warning!**
>
> The KS machine upgrade process may modify or erase data on the target M.2 drive and the USB flash drive. Verify the target machine, M.2 drive, and USB device before starting the upgrade. Back up any required data before proceeding.


### 3. Upgrade Flow

Complete the following steps to upgrade each bare metal server (node) to a Cluster system.

#### 3.1 Prepare the Required Information

Prepare the following information for each KS node:

* Serial Number (SN) and Part Number (PN) from the KS machine label.
* License Serial Number, which is provided in the PDF document included with the invoice.

> **Important!**
> 
> The license information is associated with the specific KS node. Verify that the SN, PN, and License Serial Number correspond to the same node before proceeding.


#### 3.2 Generate the License Key and System Image

From a workstation connected to the Internet, open the Infortrend Product Activation page, navigate to: 
Support > Product Service > License Service > KS > Bare Metal License Activation

Enter the following information in the required fields and submit the activation request.

* Serial Number (SN)
* Part Number (PN)
* License Serial Number

The system generates the following files:

* License Key file (.zip) — contains the software license entitlement for the KS node.
* System image file (.iso) — contains the bootable installation image used to prepare the node.

#### 3.3 Download the License Key File

The License Key file (.zip) contains the software license entitlement for the corresponding KS node. Download and retain the generated License Key file for use during the firmware installation.

If the License Key file needs to be retrieved later, navigate to:
Support > Product Service > License Service > KS > Bare Metal License Reactivation

Use this page to locate previously generated license files.

> **Important!**
>
> The License Key file must correspond to the KS node being upgraded. Verify that the SN and PN in the license information match the target node.

#### 3.4 Create a Bootable USB Device with system image file

The system image file (.iso) contains the bootable installation program required to prepare the node. Download the .iso image file and use a supported USB creation tool to write the .iso image to the USB device. Refer to the documentation provided by the selected tool for detailed instructions.

> **⚠️ Warning!**
>
> The USB creation process may erase all existing data on the USB device. Back up any required data before writing the .iso image.

> ℹ️ Information
> 
> The exact procedure and options may vary depending on the USB creation tool and operating system. Always refer to the tool's official documentation for the applicable procedure and recommended settings.

The bootable USB device is used in the next step to boot the KS node and automatically prepare the host drives.


#### 3.5 Boot the Node from the USB Device

Connect the bootable USB device to the KS node. Power on the machine and boot the node from the USB device. 

The system automatically sets up the drives of the node.


#### 3.6 Boot the Node Without the USB Device

Remove the USB device from the KS node.

Power on the node. The system automatically selects the appropriate boot SSD and enters setup mode.

Wait for the process to complete.


#### 3.7 Import the License 

From a workstation connected to the same network switch, open a web browser and access the Firmware Installation page:

Firmware Installation Url: http://10.10.100.2:8886

The workstation must be configured with an IP address in the same subnet as the KS node to access the Firmware Installation page. If the workstation is connected to a network with DHCP, ensure that the assigned IP address is compatible with the KS node's network configuration.

Follow the instructions displayed on the Firmware Installation page.

Import the License Key file (.zip) generated for the corresponding KS node.

Start the firmware installation and wait for the installation to complete.

> **Important!**
>
> The License Key file must match the SN and PN of the KS node. Using a license file generated for a different node will cause the installation to fail.


#### 3.8 Verify the Firmware Installation

After the firmware installation completes, the system automatically redirects to the Cluster Deployment page.

Please close the Firmware Installation to complete the upgrade, or access the Node Overview page to verify the installed firmware information.

Node Overview Url: http://<mgmt_ip>:8816

Replace <mgmt_ip> with the management IP address of the KS node.


#### 3.9 Upgrade the Remaining Nodes

Repeat Steps 3.2 through 3.8 for each remaining KS node(s).

> **Important**
> 
> After completing the Firmware Installation on a node, power off that node before upgrading the next node. This prevents IP address conflicts during the upgrade process.

After all nodes have completed the Firmware Installation, proceed to **Cluster Deployment**.


### Troubleshooting Guide

If the upgrade procedure cannot proceed, verify the following:

**Symptom or Error: Recommended Action**

License Application file cannot be exported: Verify that you are operating on the correct node and that the required management functions are available.

License file not found: Go to Bare Metal License Reactivation url, use SN and PN as the search criteria to download license files.

System image file not found: Go to Technical Service > KS Model > Downloads, go to
Firmware tab, follow the instructions to find the image file and download again.

License file import fails: Verify that the license belongs to the target node/serial number and that the entitlement is valid

Node does not boot from USB: Verify USB boot support, boot order, and that the USB device was created correctly.

USB Boot but setup does not complete: Record the displayed error and contact Infortrend Service.

USB unplugged but node does not start: Verify that the USB device has been removed and reboot the node according to the platform procedure. Contact the Infortrend Service if the issue still exists.

URL cannot be accessed: Verify network connectivity and confirm that the node is using the expected management IP address.


