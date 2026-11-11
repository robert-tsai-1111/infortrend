
### Solution Architecture

KS product series is a cloud platform designed specifically for enterprise users. The solution’s architecture consists of the following elements.

* KS Cluster: A group of KS systems, also known as “nodes”, form a cluster that works as a single, integrated system. The nodes are connected via the storage network to communicate with one another.
* Clients: Clients access the data stored on the cluster nodes and use the service. The nodes and the clients are connected via the host network.
* Administrator’s management server: The system administrator manages the nodes in a cluster from an dedicated server by using a centralized, web-based interface called EonOne. The nodes and the management PC are connected via the management network.
* External storage: To provide high-speed data access and additional storage space, the IEC platform can integrate with storage products including EonStor GS series.
* Host network switch: For connecting the server host and transmitting jumbo-frame data between memory of nodes
* Storage network switch: For connecting the server host and transmitting persistent, jumbo-frame data between disks of nodes
* Management network switch: For connecting the server host and transmitting management command payloads, monitoring data and system-managed data between nodes



Server Network Topology Diagram

This architecture illustrates an enterprise-grade topology in which three servers are simultaneously connected to both a "server switch" (for data transmission) and a "management switch" (for out-of-band management via IPMI/iLO/iDRAC).

```mermaid
graph TB
    subgraph Management_Network ["Management Network"]
        MgmtSwitch["Management Switch"]
    end

    subgraph Data_Network ["Production Network"]
        ServerSwitch["Server Switch"]
    end

    subgraph Server_Rack ["Server Farm (Cluster)"]
        subgraph Server1 ["Server 01"]
            S1_Data["Host Port"]
            S1_Mgmt["IPMI Port"]
        end

        subgraph Server2 ["Server 02"]
            S2_Data["Host Port"]
            S2_Mgmt["IPMI Port"]
        end

        subgraph Server3 ["Server 03"]
            S3_Data["Host Port"]
            S3_Mgmt["IPMI Port"]
        end
    end

    %% 連結至資料交換器
    S1_Data --- ServerSwitch
    S2_Data --- ServerSwitch
    S3_Data --- ServerSwitch

    %% 連結至管理交換器
    S1_Mgmt --- MgmtSwitch
    S2_Mgmt --- MgmtSwitch
    S3_Mgmt --- MgmtSwitch

    style MgmtSwitch fill:#000000,stroke:#333,stroke-width:2px,color:#ffffff
    style ServerSwitch fill:#000000,stroke:#333,stroke-width:2px,color:#ffffff
```

