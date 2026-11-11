Infortrend is an original manufacturer (OEM) of AI computing and enterprise storage solutions, with a strong focus on sustainable innovation. With over 30 years of experience in R&D, manufacturing, sales, and global technical services, Infortrend has established a strong track record with more than 1 million systems deployed worldwide, providing customers with reliable products and long-term relationship.
(Infortrend 為 AI 運算與儲存設備原廠供應商, 以永續創新為理念, 累積超過30年研發製造銷售與服務, 全球部署超過1M集群, 信用優良, 用戶信賴.)

Infortrend’s computing server solutions can be deployed in enterprise data centers to run customers’ own AI software stacks, or integrated with the Infortrend software platform to support innovative AI and VM workloads. Common use cases include LLM inference, image generation, and other enterprise AI applications.
(Infortrend 運算伺服器產品, 經過機構電力與散熱設計優化, 可部署於企業機櫃運行自有AI系統, 或搭配Infortrend 軟體平台, 以創新架構運行企業 AI 或 VM 工作負載, 常見如 LLM 模型推理,  Image Gen 等應用)

We would be happy to arrange a one-hour online meeting to introduce our solutions and product advantages based on the use cases, and to explore how Infortrend can support further requirements.
(我方很樂意安排1小時線上會議針對提到的使用案例介紹我方產品優勢)



Infortrend IEC (KS硬體搭配軟體層）為容器原生整合平台，並加入包括虛擬化,開源應用市場特色的產品, 以供應企業AI專案需求 

KS硬體搭配軟體層 (EonKube K8s, EonOne NAS, BMC) 對應 Dell Server 搭配 VMware 或 Red Hat, 做為K8s 底座可以TCO (一次性授權,硬體保固,原廠服務), 助力維運 (運算儲存整合, 工作負載集中管理, 整合備份, AI輔助維運, 人員技能轉型, 現有 VM 移轉相容性) 與資料保護 (RAID, Replica)等維度來做比較與強調我方優勢

EonKube K8s相容產業標準可安裝運行容器應用 (ex: Kube Ray), 與其他業者的差異例如 vGPU, VM GPU Passthrough, VM HA, Data RAID/Replica, Data Backup/Restore, AI Marketplace等.

VM營運附屬功能如 vMotion/HA、DRS、FT 在產品藍圖階段 (具體時程應參考官方最新公告).
K8s營運附屬功能如 Multi-teannt Logging, Multi-teannt AI DevOps, AI Big Data, AI Data Insight 等亦在產品藍圖階段 (具體時程應參考官方最新公告).

1. 產品架構
IEC = 運算 + 儲存 + Kubernetes（基於 Rancher）的整合式私有雲平台
管理層：EonKube（K8s + VM 管理）/ EonOne（硬體監控 + 備份／還原）
VM 透過 Kubernetes Virtualization 為執行基礎 (不同於 KVM 技術)

2. 部署模式（SMB 架構設計時需特別確認）
Standalone（1 節點）：無 Failover / 無法 Scale-Out
HA Edge（2 節點）：自動 Failover / 無法 Scale-Out
Advanced Edge（3～5 節點）/ Enterprise Cloud（3～20 節點）：支援 Failover + Scale-Out
※ 各模式之間沒有直接的升級路徑，因此如果預期未來需要擴充，建議一開始即以 Cluster 架構進行規劃。

3. Infortrend 官方 VMware 比較
資料為截稿日前所彙總之資訊，如有任何變動，請以最新公告為準。

主要功能
...

※ 上述比較表為 Infortrend 自行提供的比較資料，基本上屬於 Vendor 觀點的比較內容。例如，vSphere 的 Native Backup API 被標示為「不支援」，因此部分項目的比較方式可能會因定義及比較基準不同而有所差異。

4. 從 VM 營運角度來看實際運作方式（技術檢視）
Infortrend 的比較資料中並未列出 vMotion、DRS、HA（VM 無中斷運作）、FT 等項目。另外，依據官方營運資料，目前可確認以下內容：
- Rolling Firmware Update 期間，部分 VM 可能因 I/O 中斷而暫時停止，之後可能需要手動重新啟動
- 移除節點時，需要事先將 Workload Migration 至其他節點，或先停止相關 Workload (有啟用 VM Load Balancer 的 Workload 則不影响)

因此，就個別 VM 的維護方式而言，其運作模式與 VMware vSphere 透過 vMotion 所提供的無中斷 VM Migration 有所不同 ( 使用應用層 L7  Load Balancer 實現).

5. 綜合檢視

- 主要優勢：運算儲存整合硬體保固, 一次性永久軟件授權、整合式備份（VM + App + K8s）、資料安全機制,  整合管理（EonKube + EonOne）、Container-Native/AI-Ready 運作
- 主要考量： 個別 VM 的無中斷運作及維護方式，與 VMware 的 vMotion／DRS／FT 架構有所不同
- 適用方向： 若環境以 Container 為主，或成本、授權及整合管理為主要考量，IEC 可作為其中一項替代方案進行評估。但若 VM 的無中斷運作是核心需求，則需要進一步確認 IEC 是否能滿足相關需求，再評估其與 VMware 的替代關係。



