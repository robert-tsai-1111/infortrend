
### Cluster Architecture

Before you install your KS systems and deploy a cluster, please plan your cluster topology and network IP assignment based on the requirements of your operating environment.

#### Factors to Consider

When planning your expected cluster topology, there are several factors to consider, including:

* How many nodes will the cluster contain?

* How many worker nodes of the cluster?

* How many network switches are used in the cluster?

* How many clients can the cluster serve simultaneously during peak hours?

* What container or VM workloads will the cluster run?

* What are the resource requirements of those workloads?

* How much storage capacity does the cluster need?

Design the cluster architecture based on the operation, fault tolerance, performance and disaster recovery requirements.

#### Cluster Architecture

In a multi-node cluster architecture, system availability and quorum mechanisms depend on the Control Plane (CP) nodes. Please keep the following maintenance principles in mind:

**Worker Node Failures** (Automatic Rescheduling): If a Worker node fails, the system automatically reschedules affected workloads and virtual machines to healthy nodes (provided sufficient aggregate resources remain), without impacting overall cluster availability.

**Control Plane Fault Tolerance Limit**: For multi-node systems, a maximum of only 1 Control Plane node failure is allowed. Simultaneous failure of 2 or more CP nodes results in a Loss of Quorum and renders the entire cluster inoperable.

Note: Fault tolerance is determined by the fixed quorum node count (maximum 1 failure allowed), rather than a proportional percentage of total nodes.

#### 2-Node HA Architecture

In a 2-node HA cluster architecture, system availability and quorum mechanisms depend on the Witness Server nodes. Please keep the following maintenance principles in mind:

**Worker Node Failures** (Automatic Rescheduling): If a Worker node fails, the system automatically reschedules affected workloads and virtual machines to healthy nodes (provided sufficient aggregate resources remain), without impacting overall cluster availability.

**Control Plane Fault Tolerance Limit**: For 2-node HA systems, a maximum of only 1 Control Plane node failure is allowed. Simultaneous failure of 2 or more CP nodes results in a Loss of Quorum and renders the entire cluster inoperable.

**Witness Node Failures**: For 2-node HA systems, a maximum of 1 Witness Node node failure is allowed. Simultaneous failure of CP nodes and Witness Node results in a Loss of Quorum and renders the entire cluster inoperable.

