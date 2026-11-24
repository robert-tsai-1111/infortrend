

## KS 3000 Server Performance Report

### Index
1. Summary
   Takeaway
   Product Highlights
2. Applicable Models
3. Audience
4. Terminology
5. Performance Results
   Storage System Performance
   Server Application Performance
   (x) AI Application Performance
6. Topology
   RAID
   Host Network
   Storage Network
   Container Workloads
7. System Configurations and Benchmarks
   Configuration 1: 3-Node Cluster System with RAID - Replica2/3 RWX
   Configuration 1 Benchmark Result
   Configuration 2: 1-Node Cluster System with RAID - Replica1 RWX
   Configuration 2 Benchmark Result
   Configuration 3: 3-Node Cluster System with RAID - VM Replica2 RWX
   Configuration 3 Benchmark Result
   Configuration 4: 3-Node Cluster System with RAID - VM Coremark
   Configuration 4 Benchmark Result
   Configuration 5: 3-Node Cluster System with RAID - PostgreSQL Chart
   Configuration 5 Benchmark Result
   Configuration 6: 3-Node Cluster System with RAID - Kafka Chart
   Configuration 6 Benchmark Results
   (x) Configuration 7: 1-Node Cluster System with RAID - vLLM Chart
8. Conclusion
   Key Performance Highlights
   Business Implications



### 1. Summary

#### Takeaway

“Infortrend KS, the Strong Performance Foundation with Promising Enterprise Workload Readiness”

The platform is showing strong performance potential, with a clear path toward enterprise infrastructure readiness.

The benchmark results establish a promising foundation for container storage, virtualization, and cloud-native workloads. Storage read performance and compute scalability are key strengths, while VM write performance and application latency represent the main optimization opportunities.

Recommendation: Move forward with product optimization and production-readiness validation before committing to external performance SLAs or final market positioning.


#### Product Highlights

Infortrend KS Family is a server product with storage RAID features which can provide excellent compute power and high-performance storage capacity for Enterprise AI applications. 

KS 3000 models are one of the product series used in branch offices, factory plants, server rooms, the “edge environments” rather than datacenters.

KS 3000 models support 1 or 2 dual-slot GPUs, suitable for local hosted AI workloads, such as Large-Language Models (LLM), Text-to-Image, Text-to-Voice, Text-to-Video model applications.


### 2. Applicable Models

Below are the applicable models in this performance report:

| Series | Applicable Models |
| :--- | :--- |
| KS 3000 | KSa 3004U<br>KSa 3004UE |



### 3. Audience
This performance report is intended for the Infortrend partners, customers, and employees who deploy and run KS 3000 server(s).


### 4. Terminology

KS, a product family name of Infortrend server products.

KS 3000, a shortened model name for Infortrend KS product series.

EonOne – Management software for KS and other storage product families.

EonKube - the management tools for KS to manage app charts, virtual machines and container workloads.


### 5. Performance Results

The following section demonstrates the highest performance of each system. 

Please also check the corresponding configurations in the System Configuration section to see how we run the tests. 

There are also some descriptions of the results in the Conclusion section.


#### Storage System Performance

Please refer to the Benchmark Result sections.

#### Server Application Performance

Please refer to the Benchmark Result sections.

#### (x) AI Application Performance

Please refer to the Benchmark Result sections.


### 6. Topology

本章節說明 System Configurations 共用的拓撲架構等.


#### RAID

RAID0 used by User Volume(s).
RAID1 used by User Volume(s).
RAID5 used by Docker Volume.
RAID5 used by Kubernetes metadata volume.
RAID1 used by OS volume.

#### Host Network 

在 Clients, Switch 與 Cluster (Nodes) 之間的資料傳輸通道, 依 System Configuration 配置可為 10G, 25G 


#### Storage Network 

在 Switch 與 Nodes 之間的 RAID, File Storage protocols, Remote Direct Memory Access over Converged Ethernet (RoCE) 等資料傳輸通道, 依 System Configuration 配置可為 25G, 100G 


#### Container Workloads

Below workloads are created and deployed to Default namespace.

There are a variety of workloads created for different test purposes.

* Virtual Machines: Linux VM
* Application Charts: MySQL, Kafka
* Container Applications: N/A


### 7. System Configurations and Benchmarks


### 8. Conclusion

The benchmark results demonstrate that the KSa3004UE 3-node platform, powered by AMD EPYC 8324P processors and NVMe storage, provides a solid performance foundation for enterprise virtualization, containerized workloads, and cloud-native applications.

Across six benchmark scenarios, the platform demonstrated strong storage throughput, scalable compute performance, and the ability to support representative enterprise workloads, including PostgreSQL and Kafka.

#### Key Performance Highlights

6.48M Peak Random Read IOPS (Replica2 · 8K · Host-based)

83.3 GB/s Peak Random Read Bandwidth (Replica2 · 1M · Host-based)

98.5K PostgreSQL Transactions/min (Local Default Storage)

27.6K Kafka Producer Records/sec (Peak single-client result)

112,847 CoreMark Score (4 vCPU VM)

98% CPU Utilization (Replica1 · Random Read · 4K)

The 3-node cluster demonstrated strong storage performance under multi-node RWX workloads.

| Workload | Replica2 | Replica3 | Diff (Replica3 vs. Replica2) |
| :--- | :---: | :---: | :---: |
| Sequential Read 8K | 3.35M IOPS | 2.97M IOPS | -0.38M IOPS (-11.34%) |
| Sequential Write 8K | 1.16M IOPS | 0.62M IOPS | -0.54M IOPS (-46.55%) |
| Random Read 8K | 6.48M IOPS | 6.30M IOPS | -0.18M IOPS (-2.78%) |
| Random Write 4K | 3.10M IOPS | 1.75M IOPS | -1.35M IOPS (-43.55%) |


#### Business Implications

The platform has potential to address enterprise container storage use cases, including shared persistent volumes, cloud-native applications, and high-concurrency workloads.
























