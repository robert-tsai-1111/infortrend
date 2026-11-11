
My name is Robert Tsai, and I am a Technical Specialist at Infortrend. I will be assisting you with your inquiry regarding the NTP (Network Time Protocol) configuration.

Based on the information provided, the Chrony NTP server is currently running and serving on your local network, and you intend to apply the NTP configuration to the production cluster on October 15.

Yes, you can configure the NTP server settings through EonOne by following these steps:

1.Log in to EonOne
2.Navigate to Settings > Cluster > Time
3.Click Change
4.Under Automatically sync with NTP server, locate the Primary network time server option
5.Select Customize from the drop-down menu
6.Enter the IP address of your Chrony NTP server
7.Click OK to apply the configuration

Important Notes
1.Please ensure that the Chrony NTP server is accessible from the production cluster and that UDP port 123 is permitted by the relevant network and firewall policies.

2.Since this change is planned for the production cluster, we recommend verifying the NTP server connectivity and reviewing the configuration before applying the settings on October 15.

Please let us know if you encounter any issues during the configuration process or require further assistance.




To help us investigate the issue further, please provide the following information and confirm the details below.


System Information
1.Target System: A cluster consisting of nine KSi 5008 nodes and two GS 3016 nodes.
2.Firmware Version: 1.27A.26
3.Kubernetes Version: v1.30.14
4.Current NTP Configuration: No NTP server configured; NTP server connectivity is currently unavailable.
5.New NTP Configuration: Not yet configured / Pending confirmation.
6.Error Messages or Relevant Logs: Not available at this time.
7.Issue Start Time: Not yet determined. Please provide the date, time, and time zone if available.
8.Any relevant system logs, NTP configuration details, or diagnostic results would be helpful for our further investigation.
