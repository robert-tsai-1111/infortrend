

## System Health Checking Guide

Purpose: To identify potential system problems using traffic lights.

Summary: System health check procedures are performed sequentially.


### 1. Physical Health Check

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **Front Panel LEDs** | **Control Panel LEDs**<br>- Power LED is green<br>- UID LED is off<br>- System fault LED is off | ⃞ |
| **SSD Tray LEDs** | **Drive Tray LEDs**<br>- Drive status LED is off<br>- Drive busy is green (No IO) or flash green (R/W IO) | ⃞ |
| **RJ45 LEDs** | **1GbE Management Port (RJ-45) LEDs**<br>- Speed LED is green<br>- Link/Active LED is steady green or flashing green | ⃞ |
| **HBA PCIe LEDs** | - Speed LED is green<br>- Active LED is flashing green | ⃞ |
| **OCP LEDs** | - Speed LED is green<br>- Active LED is flashing green | ⃞ |
| **PSU LED** | - LED is green | ⃞ |
| **Temperature** | Operating Temperature between 10°C to 35°C (without GPU) | ⃞ |



### 2. Server Health Check via BMC

When physical health check results are abnormal, overheating of components (CPU, GPU) is detected, or sensor device failure (LED) is detected, potential problems are investigated through the BMC console of each node.

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **Logs - IPMI Event Log** | Set **Filter by severity** to **Critical**, review the recent event log to ensure there are no Critical Severity of events that require attention | ⃞ |
| **Logs - System Log** | Set **Event Category** to **Critical**, review the recent event log to ensure there are no Critical events that require attention | ⃞ |
| **Logs - Audit Log (optional)** | Review the recent event log to ensure there are no events that require attention | ⃞ |


### 3. General Health Check 

**System Status**

Go to EonOne > Dashboard

Check the information on the dashboard of each block.

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **General** | Ensure status icon is **Healthy**, click on **Details**, the Firmware version is new version, node status are all green (**Connected**) | ⃞ |
| **Overview - Node** | Click links to **Nodes > Drives**, ensure Status is **On-Line**, Health is **Good** | ⃞ |

**Resource Usage**

Go to EonOne > Monitor

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **Node** | Ensure that the total capacity used and the total unused capacity does not exceed 70% of the total cluster capacity | ⃞ |
| **Node** | Ensure that the total capacity used and the total unused capacity does not exceed 90% of the total cluster capacity | ⃞ |


**System Events**

Go to EonOne > Event log

Check the information on the UI.

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **Event log - Error** | Ensure no errors | ⃞ |
| **Event log - Warning (Optional)** | Ensure no warnings | ⃞ |

### 4. Storage System Health Check

Go to EonOne > General

Check the information on the UI.

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **General** | Ensure status icon is **Healthy**, click on **Details**, the Firmware version is new version, node status are all green (**Connected**) | ⃞ |
| **Overview - Node** | Click links to **Nodes > Drives**, ensure Status is **On-Line**, Health is **Good** | ⃞ |
| **Overview - Persistent Volumes** | Click links to **Persistent Volumes**, ensure no unhealthy volumes was found | ⃞ |
| **Overview - Persistent Volumes** | Click links to **System reserved volumes**, find **Docker volume**, ensure no unhealthy volumes was found | ⃞ |
| **Overview - Persistent Volumes** | Click links to **System reserved volumes**, find **Kubernetes metadata volume**, ensure no unhealthy volumes was found | ⃞ |
| **Overview - Persistent Volumes** | Click links to **System reserved volumes**, find **OS volume**, ensure no unhealthy volumes was found | ⃞ |
| **Overview - Persistent Volumes (Optional)** | Click links to **External storage**, ensure the connection status is healthy | ⃞ |

### 5. Server System Health Check

Go to EonKube > Admin > Dashboard.

Check the information on the dashboard of each block.

| Item | Checking Criteria | Healthy |
| :--- | :--- | :---: |
| **General** | Ensure node status indicator is **Healthy** (no show error icon) | ⃞ |
| **Capacity** | Ensure that the resource usage (Pod, CPU, memory, GPU) is green (orange indicates that the safety threshold has been exceeded and expansion is recommended) | ⃞ |
| **Events** | Review the recent event log to ensure there are no events that require attention | ⃞ |
| **Alerts** | Go to the **Alerts** page and make sure no Error or Critical alerts are detected | ⃞ |
| **Certificates (90 Days)** | Go to the **Certificates** page and ensure that all certificates have not expired within 90 days | ⃞ |
| **Certificates (60 Days)** | Go to the **Certificates** page and ensure that all certificates have not expired within 60 days | ⃞ |
| **Certificates (30 Days)** | Go to the **Certificates** page and ensure that all certificates have not expired within 30 days | ⃞ |

