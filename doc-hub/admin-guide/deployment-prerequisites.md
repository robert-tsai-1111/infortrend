
# Deployment Prerequisites


## A.Infrastructure Requirements

### 1.Appliance

- 1台 Management Server 
- 1台 24-port 1G Management Switch 
- 1台 48-port 25G Host Switch 
- 1台 48-port 100G Storage Switch 
- 1台 Witness Server (HA 部署適用)

### 2. Witness Server (HA 部署適用)

- Link to Management Switch
- Windows OS Installation (Windows 11, Windows Server 2019+)
- App Installatin Permission

### 3. Jumbo Frame

- Host Switch Port MTU: 9000
- Storage Switch Port MTU: 9000

### 4. IP Segment

- Management and IPMI Network
- Host and Application Network
- Storage and RDMA/RoCE Network


### 5. Link-Level Flow Control

- Host Switch LLFC: Enable
- Storage Switch LLFC: Enable


### 6. LACP

### 7. DHCP

- Host Switch LLFC: Enable

### 8. MLAG (Optional)



## B.Security Requirements


### 1.AD Authentication



### 2.Firewall 

- Inbound 

- Outbound



## C.Platform Requirements

### 1.Control Plane Node

### 2.Worker Node

### 3.Container Runtime Interface

### 4.Container Storage Interface

### 5.Container Network Interface

### 6.External Storage System

Infortrend GS NAS

