# KS HA System 常見問題（FAQ）

## 1. 硬體規格與相容性

### Q：建置 KS HA System 最少需要幾台 KS 主機？
**編號**：`FAQ-KS40-01`

建置一套 KS HA 高可用服務器系統，需要兩台 KS 主機，並透過 HA 架構建立雙節點高可用性服務。

---

### Q：建置 KS HA System 需要準備哪些硬體設備及必要配件？
**編號**：`FAQ-KS40-02`

每台 KS 專用主機需要配置以下硬體及配件：

- 1 張 Dual-Port SFP28 Network Adapter
- 1 張 Dual-Port SFP28 或 QSFP28 Network Adapter
- 4 顆、8 顆或 16 顆 U.2 NVMe SSD，依系統配置而定
- RJ45 網路線及 LC-LC 光纖線
- 與網路卡及交換器相容的 Transceiver 光纖模組

實際硬體配置應依 KS 機型、HA 架構規劃及專案需求確認。

---

### Q：建置 KS HA System 需要具備哪些企業基礎設施與 IT 服務？
**編號**：`FAQ-KS40-03`

建置 KS HA System 前，企業應準備必要的網路設備、管理設備、Witness Server，以及企業 IT 基礎服務：

- 1 台高速網路 Switch
- 1 台管理網路 Switch
- 1 台集群管理 Server
- 1 台集群 HA 見證 Server
- DNS 網域解析服務
- NTP 時間同步服務
- 電子郵件服務

---

### Q：KS HA System 對廠區電力供應有什麼要求？如何確保供電能力足以滿足集群尖峰用電需求？
**編號**：`FAQ-KS40-04`

以 KS 5016 為例，每台主機配置兩個 2700W 16A 電源供應器（PSU），採用 200–240VAC 雙迴路 PDU 供電。以兩台 KS 5016 組成 HA 集群時，兩台 KS 5016 PSU 額定功率合計 10,800W。

---

### Q：KS 與 GS 主機可以安裝在同一個機櫃嗎？
**編號**：`FAQ-KS40-05`

可以。在機櫃空間、電力供應及散熱條件均符合設備安裝規範的情況下，KS 與 GS 主機可以安裝於同一個機櫃內，GS 儲存設備安裝於 KS 主機下方。

---

### Q：KS HA System 為什麼需要配置 Witness Server？其主要功能與用途是什麼？
**編號**：`FAQ-KS40-06`

KS HA 採用雙節點高可用性架構，Witness Server 是 HA 架構中重要的見證及仲裁節點。

---

### Q：Witness Server 可以使用一般 PC 或 Notebook 代替嗎？
**編號**：`FAQ-KS40-07`

可以。Witness Server 主要執行 Infortrend HA Witness Node 輕量化服務，因此可以使用符合系統需求的消費級 PC 或 Notebook 作為 Witness Server。

---

### Q：Witness Server 是否可安裝於 Windows 11 作業系統？
**編號**：`FAQ-KS40-08`

可以。Infortrend HA Witness 應用程式可安裝並執行於 Windows 11 作業系統。

---

## 2. 軟體與授權

### Q：KS HA System 是否需要支付月費、年費或其他軟體授權費用？
**編號**：`FAQ-KS40-09`

不需要額外支付 HA 功能的月費或年費。

KS HA 專用機型已包含 HA 功能授權 Key。使用者購買 KS HA 專用設備後，即可依產品授權及服務條款使用 KS HA 功能。

---

## 3. 系統架構與設定

### Q：KS HA 與 KS Cluster 架構有什麼差異？
**編號**：`FAQ-KS40-10`

KS HA 與 KS Cluster 是 Infortrend KS 系列提供的不同系統架構方案，兩者採用不同的功能授權，可於專案配置階段選定。

---

### Q：KS HA 與 GS HA 是否可以共用同一台 Witness Server？
**編號**：`FAQ-KS40-11`

可以。

---

### Q：KS HA System 對 DNS Server 有哪些依賴？如果未設定 DNS 或無法連線至 DNS Server，可能造成哪些異常？
**編號**：`FAQ-KS40-12`

若未正確設定 DNS，或 KS 主機無法連線至 DNS Server，可能造成以下異常：

1. **EonKube 網域名稱解析失敗**：相關系統事件可能出現錯誤，使用者可能無法正常連線至 EonKube 內部服務，即無法動態進行 Service Discovery（無法建立解析 `<service-name>.<namespace>.svc.cluster.local`）與無法進行 Pod 網路身份識別（無法存取 `<pod-name>.<headless-svc>.<namespace>.svc.cluster.local`）。
2. **EonOne 網域名稱解析失敗**：相關系統事件可能出現錯誤，使用者可能無法正常連線至 EonOne 管理服務。
3. **Load Balancer App 網域名稱解析失敗**：使用者可能無法透過指定網域名稱連線至 Load Balancer App，快取與負載平衡功能失效。
4. **VM 網域名稱解析失敗**：使用者可能無法透過指定網域名稱連線至相關 VM 服務。
5. **EonKube 系統服務異常**：依賴 DNS 解析的系統服務可能發生錯誤，導致相關功能無法正常運作。例如查詢非集群內部網域（非 `cluster.local`）的網域名稱時，無法轉發（Forward）查詢送往上游 DNS 伺服器。
6. **EonOne 系統服務異常**：依賴 DNS 解析的管理服務可能發生錯誤，導致相關管理功能無法正常運作。例如使用外部 NTP 服務（例如 `time.google.com`）進行時間校正。

---

### Q：KS HA System 為什麼需要設定 NTP？如果未設定 NTP 或無法連線至 NTP Server，可能造成哪些影響？
**編號**：`FAQ-KS40-13`

若未正確設定 NTP，或 KS 主機無法連線至 NTP Server，可能造成以下問題：

1. **Event Timestamp 不正確**：系統事件紀錄的時間資訊可能與實際時間不一致。
2. **Log Timestamp 不正確**：系統 Log 的時間資訊可能出現偏差，增加問題追蹤及故障診斷的困難度。
3. **VM OS DateTime 不正確**：虛擬機器作業系統的日期與時間可能不正確。
4. **App Pod DateTime 不正確**：Kubernetes 應用程式 Pod 的日期與時間可能與實際時間不一致。
5. **跨系統事件比對困難**：當不同主機、VM 及應用服務的時間不一致時，可能影響事件追蹤、問題分析及系統維運。

---

## 4. 服務與支援

### Q：使用 KS HA 或 GS HA 產品時遇到問題，應如何聯絡技術支援？
**編號**：`FAQ-KS40-14`

Infortrend 提供全球技術支援服務，當使用 KS HA 或 GS HA 產品遇到問題時，可透過以下管道聯絡原廠技術支援團隊：

- **全球服務網站**：<https://support.infortrend.com>
- **技術服務信箱**：<support@infortrend.com>

---

### Q：KS HA System 運作期間發現系統異常時，應如何進行初步判斷、問題診斷及故障排除？
**編號**：`FAQ-KS40-15`

當 KS HA System 運作期間發生異常時，可參考《System Troubleshooting Guide》進行問題診斷及故障排除。

操作後仍無法排除異常，請透過以下全球技術支援管道聯絡 Infortrend 原廠：

- **全球服務網站**：<https://support.infortrend.com>
- **技術服務信箱**：<support@infortrend.com>

---

## 5. 系統使用與維運

### Q：KS HA System 的正常運作溫度範圍是多少？如何確認機箱溫度是否正常？
**編號**：`FAQ-KS40-16`

KS HA System 建議於適當的機房環境中運作，以確保設備具備穩定的散熱條件：

- **機房環境溫度**：26°C
- **機箱最高溫度**：35°C

若機箱溫度超過正常運作條件，請檢查以下項目：

1. 機房空調及環境溫度是否正常。
2. 機櫃前後方是否保留足夠散熱空間。
3. 機櫃內設備是否影響散熱氣流。
4. KS 主機風扇是否正常運作。
5. 系統是否出現溫度相關告警。

---

### Q：KS HA System 的正確關機程序為何？
**編號**：`FAQ-KS40-17`

為確保 KS HA 集群及相關系統服務能夠安全停止，建議於年度設備維護、廠區停電或其他需要關閉系統的情況下，依照以下程序執行：

1. 關閉應用服務與工作負載（Optional）
2. KS 伺服器管理 `EonOne > Cluster > Shutdown`
3. 關閉集群 Witness Server（Optional）
4. 關閉集群 Management Server（Optional）
5. 關閉集群 Switch（Optional）

---

### Q：KS HA System 的正確開機程序為何？
**編號**：`FAQ-KS40-18`

當廠區停電復電、年度設備維護完成或系統需要重新啟動時，建議依照以下順序恢復 KS HA System，以確保企業 IT 基礎服務、網路環境及儲存系統均已正常運作：

1. 網路基礎服務復原，埠口接頭燈號正常（綠燈），設定正常
2. 核心企業服務驗證，包括 DNS、NTP、Email
3. Infortrend GS 儲存系統復原
4. Infortrend KS 伺服器系統復原
5. 應用服務與工作負載復原

