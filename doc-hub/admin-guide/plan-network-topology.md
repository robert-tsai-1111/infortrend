
### Network Topology

#### Make a Topology Diagram

Make a topology diagram based on your expected topology of the cluster.

For example, the following is a basic topology of a three-node cluster that includes network design.

(3-node cluster diagram.png)

For example, the following is a two-node HA cluster that includes network design.

(2-node HA diagram.png)

#### Determine the HBA Combination

Each KS system has four built-in Host Bus Adapter (HBA) slots, and one or two HBAs are used as the network interface for cluster operation, depending on the deployment method.

The image below shows the network ports on the HBA cards and the corresponding channel numbers.

HBA 1: 100GbE QSFP56 adapter (channel 0, channel 1)
HBA 2: 100GbE QSFP56 adapter (channel 2, channel 3)
HBA 3: 25GbE SFP28 OCP NIC 3.0 adapter (channel 4, channel 5)
HBA 4: 25GbE SFP28 OCP NIC 3.0 adapter (channel 6, channel 7)

(images/ks-5000-hba-channel.png)
(images/ks-3000-hba-channel.png)


For a single-node configuration, select HBA 1 slot or HBA 3 slot to insert the HBA.

For a 2-node HA or multiple-node configuration, select only two HBA slots from one of the following combinations.

| HBA Combination | Storage Network Ports | Host Network Ports |
| --- | --- | --- |
| HBA 1 + HBA 4 * | CH0 and CH1 | CH6 and CH7 |
| HBA 1 + HBA 2 | CH0 and CH1 | CH2 and CH3 |
| HBA 3 + HBA 2 | CH2 and CH3 | CH4 and CH5 |
| HBA 3 + HBA 4 | CH4 and CH5 | CH6 and CH7 |

`* Recommended`

> **⚠️ Important!**
> 
> You must use one of the HBA combinations in the table above and the corresponding port configuration.
> 
> Each node in the same cluster must have the same HBA configurations.

Taking a 3-node cluster architecture as an example, we plan to use HBA 1 and HBA 4 slots to build the following network configuration.

* Host network: 25GbE x 2 ports (CH6 + CH7)
* Storage network: 100GbE x 2 ports (CH0 + CH1)

(images/ks-5000-hba-ch0-ch6-example.png)

