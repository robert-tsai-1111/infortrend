

## 金屬製品生產系統的 VM 替代方案 降本增效

### 專案背景

客戶使用VMware 8.0 運行企業資訊系統的後端資料庫: MSSQL, 因為VMware授權費用漲價, 故尋找替代方案, 需要將既有MSSQL資料從VMware搬移到新系統平台, 當時還評估公有雲的PaaS 服務 (微軟Azure MSSQL, 阿里雲), 考量因素有: 資料在地化, 運行效能, 用戶認證, 生態系統整合等, 降低軟體成本是最大考量.


### Challenge

#### 1. 原有 VMware 環境： 

(1)客戶原本使用哪個 VMware 產品或版本？大約有多少台主機及 VM？
Robert: VMware vSphere 8.0 (約3台VM) 

(2)這套環境主要承載哪些業務或生產系統？
Robert: MSSQL Server 2019, Winodws Server 2016

#### 2. 替代原因： 

(1)這次尋找 VMware 替代方案的主要原因是什麼？
Robert: VMware 軟體授權費漲價 

(2)是否有相關數據可供參考，例如 VMware 授權費用的調整幅度、預期成本節省目標，或原方案與替代方案的成本差異？
Robert: VMware 軟體授權費漲價, 實際金額未知

#### 3. 替代需求： 

(1)實際需要移轉哪些應用程式？ (例：Windows VM、企業網域服務、MS SQL 資料庫…等)  
Robert: MSSQL Server 2019, Winodws Server 2016 

(2)需滿足哪些應用需求？ (例：VM 管理、叢集管理、Active-Active HA、高可用性及故障切換…等) 
Robert: MSSQL VM維持運行, Winodws Server VM維持運行

### Solution

#### 4. KSi 替代方案：

(1)KSi 5008 實際搭配哪一套虛擬化平台、叢集管理或高可用性軟體？
Robert: KS 虛擬化為基於K8s架構的KubeVirt 容器VM技術 

(2)新方案如何承接原有 VMware 環境中的 VM 與應用程式？哪些原有功能需要保留？
Robert: KS 虛擬化支持新建立VM, 需增加VMware VM移轉功能 

(3)相較於原有方案，新方案在管理方式、軟體授權或系統整合上有哪些差異？
Robert: KS 虛擬化為一次性授權, 買KS即可完整使用無隠藏費用

#### 5. POC： 

(1) POC 執行多久？測試了哪些項目？
Robert: POC包括建立VMware環境, 內部演練, 向客戶展示VMDK移轉等 

(2)是否有明確的測試目標或驗收標準？(例： VM 移轉、MS SQL 資料庫運作、叢集功能、故障切換或應用程式相容性) 
Robert: POC目標為: 移轉KS的VM可運行MSSQL 2019, 且資料庫, 資料表, 與資料筆數與VMware VM資料一致 (無缺值, 筆數完整) 

(3) POC 的結果如何？是否有成功通過的測試項目或其他值得強調的成果？(例：讓客戶在正式採購前，確認替代方案能滿足需求、降低移轉風險) 
Robert: POC成功展示我方KS VM可移轉且正常運行VM應用服務 

(4)Infortrend Presales 技術支援或POC 服務是否為客戶選擇 Infortrend的重要因素？(印象中會議上有提到公司有  POC 是一個優勢) 
Robert: 技術服務水準為客戶決定採購的關鍵評估因素之一

#### 6. 移轉方法：

(1)原有 VM 與 SQL 資料庫分別透過什麼方式移轉？
Robert: 在VMware管理工具將VM的VMDK檔案匯出, 後即可匯入(Import)至KS集群 

(2)移轉過程是否需要停機？若有，停機時間大約多久？
Robert: 從VMware匯出到匯入KS完成運行為停機時間 (一台VM的作業時間約1~2小時)

#### 7. 驗收結果： 

(1)移轉後是否完成資料完整性、應用程式功能及生產系統驗證？ 
Robert: 驗證Windows認證資料OK, 運行MSSQL 2019 OK, 資料庫健康, 資料表完整, 資料筆數與原始VM資料一致 

(2)呈上，若有驗證，是客戶自行驗證？或是由  Infortrend presales 協助驗證？
Robert: 由Presales進行實機操作與展示POC結果(客戶不熟悉無法自行操作)


### Results & Benefits

#### 8. 成本與維運： 
(1)導入後實際降低了哪些授權或軟體成本？(例： VMware 授權費、虛擬化軟體授權費或額外管理工具費用) 
Robert: 將VM移轉至KS後即降低VMware VM數量
           
(2)呈上，是否有替代前後的成本比較或預估節省比例？
Robert: 將VM全數轉移至KS後即可免除100% VMware授權費

(3)新方案是否簡化叢集與節點管理、減少額外工具需求，或降低日常維運的複雜度？ 
Robert: 相同的VM管理方式, 且KS集群包含備份還原功能, 不需第三方工具

#### 9. 選擇 Infortrend 的原因：

(1)客戶最終選擇 KSi 的主要考量是什麼？(例：成本最低、有提供 MS SQL DB 遷移的技術支援、有做 POC…等) 
Robert: KS提供VM遷移功能, 且包含資料備份, 保護功能, 確實減少VMware授權
           
(2)是否有客戶回饋、採購考量或其他具體資訊，可以說明 Infortrend 相較於其他替代方案的優勢？
Robert: KS搭配軟體降低軟體授權費, 希望軟體可安裝於既有機器以實現更多效益



