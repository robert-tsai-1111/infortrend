

## System Troubleshooting Guide


Purpose: To resolve system problems by following the suggested steps.

Summary: System troubleshooting steps are performed sequentially.

### 1. Server Overall Troubleshooting

Troubleshooting Guide

| Symptom | Actions |
| :--- | :--- |
| **Control Panel**<br>Power LED is off | 1. Press Power button to power on the node<br>2. Ensure power system is healthy<br>3. Refer to Replace PSU guide |
| **Control Panel**<br>System fault LED is on | 1. Check node status via EonOne, turn-off the LED if no issues found |
| **Control Panel**<br>UID LED is on | 1. Press UID button to turn-off the LED |
| **Drive status LED is orange** | 1. Ensure drive is connected securely<br>2. Complete the actions of Recover SSD Drive |
| **Drive status LED remains amber** | 1. Remove the drive tray from the system and re-install it<br>2. Complete the actions of Recover SSD Drive |
| **RJ45 Port**<br>Speed LED is off | 1. Disconnect and reconnect the cable<br>2. Replace the cable with a new one<br>3. Complete the actions of Network Connection Status |
| **HBA PCIe Port**<br>Speed LED is off | 1. Disconnect and reconnect the cable<br>2. Replace the cable with a new one<br>3. Complete the actions of Network Connection Status |
| **HBA PCIe Port**<br>Speed LED is orange | 1. Confirm less than 100Gb/s connection is established (both switch end and server end)<br>2. Replace the link (cable, transceiver) to 100Gb/s<br>3. Complete the actions of Network Connection Status |
| **HBA OCP Port**<br>Speed LED is off | 1. Disconnect and reconnect the cable<br>2. Replace the cable with a new one<br>3. Complete the actions of Network Connection Status |
| **HBA OCP Port**<br>Speed LED is orange | 1. Confirm less than 25Gb/s connection is established (both switch end and server end)<br>2. Complete the actions of Network Connection Status<br>3. Complete the actions of Recover OCP Network Card |
| **Fan stopped** | 1. Complete the actions of Recover Cooling Fan |
| **PSU**<br>LED is off | 1. Connect the power cable<br>2. Confirm the power is on<br>3. Complete the actions of Recover Power Supply |
| **PSU**<br>LED is amber | 1. Confirm the cooling system abnormality (> 35°C)<br>2. Follow enterprise datacenter procedure or create Service Request for assistance |
| **PSU**<br>LED is orange or yellow | 1. Confirm power system abnormality (overload, fan failure, overheating, or abnormal output voltage) or loss of power redundancy<br>2. Follow enterprise datacenter procedure or create Service Request for assistance |


### 2. Server Component Troubleshooting

**Abnormal Component Status from BMC**

| Symptom | Actions |
| :--- | :--- |
| **IPMI Event Log**<br>Critical Severity of events were found | 1. Confirm server component physical state, resolve the issues if found<br>2. Complete the actions of A2. Server Health Check via BMC<br>3. Follow enterprise procedure or create Service Request for assistance |
| **BMC System Log**<br>Critical events were found | 1. Confirm server component physical state, resolve the issues if found<br>2. Complete the actions of A2. Server Health Check via BMC<br>3. Follow enterprise procedure or create Service Request for assistance |
| **BMC Audit Log**<br>Error logs were found | 1. Follow enterprise auditing procedure or create Service Request for assistance |

**Network Connection Status**

| Symptom | Actions |
| :--- | :--- |
| **Network Card Port LED is not green** | 1. Confirm cabling state and bandwidth speed between server and switch, resolve the issues if found<br>2. Follow enterprise network procedure or create Service Request for assistance |
| **Management Console show warning(s) or error(s)** | 1. Confirm network component physical state between server and switch, resolve the issues if found<br>2. Confirm network cabling state and bandwidth speed, resolve the issues if found<br>3. Confirm network uplink state and bandwidth speed, resolve the issues if found<br>4. Follow enterprise network procedure or create Service Request for assistance |
| **Cluster Management Console show warning(s) or error(s)** | 1. Confirm network component physical state between server(s) and switch(s), resolve the issues if found<br>2. Confirm network cabling state and bandwidth speed, resolve the issues if found<br>3. Confirm network uplink state and bandwidth speed, resolve the issues if found<br>4. Follow enterprise network procedure or create Service Request for assistance |
| **NTP service connection checking** | 1. Confirm network component physical state between server(s) and switch(s), resolve the issues if found<br>2. Confirm network cabling state and bandwidth speed, resolve the issues if found<br>3. Confirm network uplink state and bandwidth speed, resolve the issues if found<br>4. Login to host via SSH (`ssh root@<host_ip_address>`) and execute NTP connection check (`chronyd -Q "server time.google.com iburst" -t 30`), keep notes and findings<br>5. Follow enterprise network procedure to resolve the issues if found, or create Service Request for assistance |

**Recover SSD Drive**

| Symptom | Actions |
| :--- | :--- |
| **SSD LED is not healthy** | 1. Confirm SSD physical state<br>2. Click **Node > Drive > Remove Drive**<br>3. Physically take out the SSD from node<br>4. Physically Install new SSD to the node<br>5. Click **Node > Drive > Add Drive** |

**Recover Power Supply**

| Symptom | Actions |
| :--- | :--- |
| **PSU LED is not healthy** | 1. Confirm PSU physical state<br>2. Physically take out the PSU from node<br>3. Physically install new PSU to the node |

**Recover OCP Network Card**

| Symptom | Actions |
| :--- | :--- |
| **OCP LED is not healthy** | 1. Confirm OCP physical state<br>2. Confirm LC cable and transceiver state<br>3. Replace with a new transceiver<br>4. Replace with a new cable<br>5. Physically take out the OCP from node<br>6. Physically install new OCP to the node<br>7. Wire the transceiver and cable(s) to the OCP |

**Recover Cooling Fan**

| Symptom | Actions |
| :--- | :--- |
| **Fan is not working** | 1. Confirm fan physical state<br>2. Physically take out the fan from node<br>3. Physically install new fan to the node |


### 3. Storage System Troubleshooting 

**Management Tool Unavailable**

| Symptom | Actions |
| :--- | :--- |
| **Cannot access EonOne endpoint**<br>`Error: ERR_ADDRESS_UNREACHABLE` | 1. Complete the actions of Network Connection Status<br>2. Create Service Request for assistance |
| **Cannot access EonKube endpoint**<br>`Error: ERR_ADDRESS_UNREACHABLE` | 1. Complete the actions of Network Connection Status<br>2. Complete the actions of B2. Server Component Health Troubleshooting<br>3. Create Service Request for assistance |



**System Log Collection**

Go to EonOne > Event Log

| Symptom | Actions |
| :--- | :--- |
| **Cannot identify system issues from UI or due to limited information** | 1. Go to **Event Log**, click **Export Logs**<br>2. Create Service Request for assistance |
| **EonOne - General**<br>Node status are not all green / Connected (Warnings or Errors detected) | 1. Click on the node(s) that is not green, click **Details** link to review detail information of the node<br>2. Find the **Status** block and check the error message, keep notes and findings<br>3. Go to **Event Log**, click **Export** |
| **EonOne - General**<br>Warning: App IPAM settings have been changed. A cluster restart is required | 1. Go to **Settings > Cluster**, click **Reboot the cluster**<br>2. Wait for the node shutdown and start, keep notes and findings<br>3. Go to **Event Log**, click **Export** |



**Multiple-node Cluster System Unhealthy**

Go to EonOne > Dashboard > General

| Symptom | Actions |
| :--- | :--- |
| **EonOne - Overview**<br>Warning: Two Control planes in the cluster | 1. Click on **Details** to review detail error from Status block, keep notes and findings<br>2. Complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>3. Complete actions of System Log Collection<br>4. Complete actions of Service Request |
| **EonOne - Overview**<br>Error: Only one Control Plane in the cluster | 1. Click on **Details** to review detail error from Status block, keep notes and findings<br>2. Follow and complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>3. Complete actions of System Log Collection<br>4. Complete actions of Service Request |
| **EonOne - Overview**<br>Warning: Multiple GPU models detected | 1. Click on **Details** to review detail error from Status block, keep notes and findings<br>2. Move the inconsistent GPU model to another nodes |
| **EonOne - Overview**<br>Node status icon is not Healthy<br>Management network warning | 1. Complete the actions of B2. Server Component Health Troubleshooting<br>2. Complete the actions of Network Connection Status, keep notes and findings<br>3. Complete actions of Service Request |
| **EonOne - Overview**<br>Node status icon is not Healthy<br>IPMI network warning | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete the actions of Network Connection Status, keep notes and findings<br>3. Complete actions of Service Request |
| **EonOne - Overview - Node**<br>Node status icon is not Healthy<br>Docker volume error | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete the actions of Network Connection Status, keep notes and findings<br>3. Complete actions of Service Request |
| **EonOne - Overview - Node**<br>Node status icon is not Healthy<br>Kubernetes metadata volume error | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete the actions of Network Connection Status, keep notes and findings<br>3. Complete actions of Service Request |
| **EonOne - Overview - Node**<br>Node status icon is not Healthy<br>OS volume error | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete the actions of Network Connection Status, keep notes and findings<br>3. Complete actions of Service Request |
| **EonOne - Overview - Node**<br>Node status icon is not Healthy<br>Drive status warning | 1. Click on **Details** to review, keep notes and findings<br>2. Complete the actions of Recover SSD section |
| **EonOne - Overview - Node**<br>Node status icon is not Healthy<br>Storage network warning | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete the actions of Network Connection Status, keep notes and findings<br>3. Complete actions of Service Request |


**Two-node HA System Unhealthy**

| Symptom | Actions |
| :--- | :--- |
| **EonOne - Overview**<br>Warning: The status of etcd volume is degraded | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete actions of System Log Collection<br>3. Complete actions of Service Request |
| **EonOne - Overview**<br>Warning: The etcd volume has been unmounted | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete actions of System Log Collection<br>3. Complete actions of Service Request |
| **EonOne - Overview**<br>Warning: The status of etc volume is bad | 1. Complete the actions of Server Component Health Troubleshooting<br>2. Complete actions of System Log Collection<br>3. Complete actions of Service Request |
| **EonOne - Overview**<br>Error: Management interface inaccessible | 1. Complete actions of Network Connection Status<br>2. Complete actions of System Log Collection<br>3. Complete actions of Service Request |
| **EonOne - Overview**<br>Error: Management interface Disconnected | 1. Complete actions of Network Connection Status<br>2. Complete actions of System Log Collection<br>3. Complete actions of Service Request |


**Resource Usage Unhealthy**

| Symptom | Actions |
| :--- | :--- |
| **EonOne - Resource Usage**<br>capacity used and the total unused capacity does not exceed 70% of the total cluster capacity | 1. Complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>2. Complete actions of Server Component Health Troubleshooting<br>3. Complete actions of System Log Collection<br>4. Complete actions of Service Request |
| **EonOne - Resource Usage**<br>capacity used and the total unused capacity does not exceed 90% of the total cluster capacity | 1. Complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>2. Complete actions of Server Component Health Troubleshooting<br>3. Complete actions of System Log Collection<br>4. Complete actions of Service Request |



**Event Log Unhealthy**

| Symptom | Actions |
| :--- | :--- |
| **EonOne - Event log**<br>Error events were found | 1. Complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>2. Complete actions of Server Component Health Troubleshooting<br>3. Complete actions of System Log Collection<br>4. Follow enterprise auditing and security procedure or create Service Request for assistance |

### 4. Server System Troubleshooting 

Go to EonKube > Admin > Dashboard

**Kubernetes Cluster**

| Symptom | Actions |
| :--- | :--- |
| **EonKube - Dashboard**<br>Total number of Nodes is expected<br>No errors displayed | 1. Complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>2. Complete actions of B2. Server Component Health Troubleshooting<br>3. Complete actions of System Log Collection<br>4. Follow enterprise auditing and security procedure or create Service Request for assistance |
| **EonKube - Dashboard**<br>Etcd state is not green<br>Scheduler state is not green<br>Controller Manager state is not green | 1. Complete actions of A. System Health Check Guide to resolve, keep notes and findings if met exception<br>2. Complete actions of B2. Server Component Health Troubleshooting<br>3. Complete actions of System Log Collection<br>4. Follow enterprise auditing and security procedure or create Service Request for assistance |
| **EonKube - Dashboard - Events**<br>Found Failed reason(s)<br>Found Error message(s) | 1. Follow system operation and security procedure or create Service Request for assistance |
| **EonKube - Dashboard - Alerts**<br>Found Critical severity alert(s)<br>Found Error severity alert(s) | 1. Follow system operation and security procedure or create Service Request for assistance |
| **EonKube - Dashboard - Certificates**<br>State is not Active | 1. Follow system operation and security procedure or create Service Request for assistance |


**Cluster Node**

Go to EonKube > Cluster > Nodes

| Symptom | Actions |
| :--- | :--- |
| **EonKube - Cluster - Nodes**<br>State is not Active | 1. Complete actions of System Health Checking to resolve, keep notes and findings if met exception<br>2. Complete actions of Server Component Health Troubleshooting<br>3. Complete actions of System Log Collection<br>4. Follow enterprise auditing and security procedure or create Service Request for assistance |

