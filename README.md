# 🏗️ Data Warehouse & Analytics Project (PostgreSQL)

### 🚀 Overview
This project demonstrates the design and implementation of a **Modern Data Warehouse and Analytics Solution** using **SQL Server**, following the **Medallion Architecture** (Bronze → Silver → Gold).  
It showcases practical **data engineering**, **data modeling**, and **analytics** skills using SQL end-to-end — from **raw data ingestion** to **business insights**.

---

## 📖 Table of Contents
- [🎯 Project Purpose](#-project-purpose)
- [🏗️ Architecture Overview](#️-architecture-overview)
- [🧭 Project Goals](#-project-goals)
- [📂 Project Structure](#-project-structure)
- [⚙️ Tools & Technologies](#️-tools--technologies)
- [🧾 Datasets](#-datasets)
- [🪶 Implementation Steps](#-implementation-steps)
- [📊 Analytics & Insights](#-analytics--insights)
- [✅ Success Criteria](#-success-criteria)
- [📚 Documentation](#-documentation)
- [💡 Future Enhancements](#-future-enhancements)

---

## 🎯 Project Purpose

The purpose of this project is to **build a centralized data warehouse** for business analytics by integrating data from multiple sources (ERP and CRM).  
The project aims to:

- **Integrate** data from source systems into SQL Server.  
- **Cleanse** and **transform** data into a unified, high-quality dataset.  
- **Model** business-ready tables using a **Star Schema** for analytics.  
- **Deliver** actionable insights on **sales performance**, **customer behavior**, and **product effectiveness**.

---

## 🏗️ Architecture Overview

The project follows the **Medallion Architecture**, organizing data into three layers:

| Layer | Purpose | Description |
|:------|:---------|:-------------|
| 🥉 **Bronze (Raw)** | Data Ingestion | Store raw CSV data as-is from ERP and CRM sources. |
| 🥈 **Silver (Cleansed)** | Data Transformation | Standardize and clean data; fix duplicates, nulls, and mismatches. |
| 🥇 **Gold (Analytics)** | Business Modeling | Star schema (fact + dimension tables) optimized for reporting and BI. |

**Architecture Diagram:**  
<img width="1975" height="1033" alt="image" src="https://github.com/user-attachments/assets/d1aa3be3-0827-44cb-9457-980688a47434" />



---

## 🧭 Project Goals

1. **Data Integration:** Merge ERP (sales) and CRM (customers) data.  
2. **Data Cleansing:** Resolve inconsistencies and ensure data integrity.  
3. **Data Modeling:** Build analytical models (Star Schema).  
4. **Analytics & Reporting:** Generate SQL-based insights.  
5. **Documentation:** Deliver clear, reproducible documentation for all steps.

---

## 📂 Project Structure

📦 DataWarehouse-Analytics-SQL
│
├── SQL/
│ ├── 01_bronze_ingest.sql
│ ├── 02_silver_clean.sql
│ ├── 03_gold_model.sql
│ ├── 04_analysis_queries.sql
│
├── Documentation/
│ ├── architecture.drawio
│ ├── data_dictionary.md
│ ├── etl_process.md
│
├── Datasets/
│ ├── ERP_Sales.csv
│ ├── CRM_Customers.csv
│
└── README.md

---

## ⚙️ Tools & Technologies

| Category | Tool / Technology |
|:----------|:------------------|
| Database | **Microsoft SQL Server Express / SSMS** |
| Data Modeling | **Draw.io**, **Lucidchart** |
| Version Control | **Git / GitHub** |
| Documentation | **Markdown (README)**, **Notion** |
| Visualization | *(Optional)* **Power BI**, **Tableau** |

---

## 🧾 Datasets

- **ERP Dataset:** Product sales transactions (ProductID, Date, Revenue, Quantity).  
- **CRM Dataset:** Customer information (CustomerID, Region, Segment).  

These CSV files are imported into the **Bronze layer** and processed through ETL pipelines to form the Gold analytical model.

---

## 🪶 Implementation Steps

### 🥉 **1. Bronze Layer – Data Ingestion**
- Import ERP and CRM CSV files into SQL Server using `BULK INSERT`.
- Store data in raw format for traceability.
- Validate row counts and column data types.

### 🥈 **2. Silver Layer – Data Cleansing**
- Clean duplicates, handle nulls, standardize naming conventions.
- Merge ERP and CRM data using primary/foreign key logic.
- Create unified datasets ready for analytics.

### 🥇 **3. Gold Layer – Data Modeling**
- Build **Star Schema** with:
  - `FactSales`
  - `DimCustomer`
  - `DimProduct`
  - `DimRegion`
  - `DimDate`
- Add surrogate keys and relationships.
- Create SQL views for reporting:  
  `vw_SalesPerformance`, `vw_CustomerTrends`

### 📈 **4. Analytics & Insights**
- Generate SQL reports for:
  - Monthly revenue trends
  - Top 10 products and customers
  - Regional sales performance
- *(Optional)* Visualize insights in Power BI dashboard.

---

## 📊 Analytics & Insights

| Insight | Example SQL Query |
|----------|------------------|
| Top 10 Customers | `SELECT TOP 10 CustomerName, SUM(SalesAmount) AS TotalRevenue FROM FactSales JOIN DimCustomer ... GROUP BY CustomerName ORDER BY TotalRevenue DESC;` |
| Monthly Sales Trends | `SELECT FORMAT(SaleDate, 'yyyy-MM') AS Month, SUM(SalesAmount) AS Revenue FROM FactSales GROUP BY FORMAT(SaleDate, 'yyyy-MM');` |
| Product Performance | `SELECT ProductName, AVG(SalesAmount) AS AvgRevenue FROM FactSales JOIN DimProduct ...` |

---

## ✅ Success Criteria

| Area | Success Measure |
|------|-----------------|
| **Data Integration** | ERP & CRM data combined successfully |
| **Data Quality** | 0 duplicates, 100% valid foreign keys |
| **Model Design** | Star schema implemented with relationships |
| **Analytics** | Reports generate accurate metrics |
| **Documentation** | Complete README, ETL notes, and diagrams |
| **Reproducibility** | All SQL scripts can be executed end-to-end |

---

## 📚 Documentation

- 🗂️ `architecture.drawio` → Data flow and Medallion Architecture  
- 📄 `data_dictionary.md` → Table definitions and column meanings  
- ⚙️ `etl_process.md` → ETL logic, transformation rules, and pipeline design  
- 🧾 `README.md` → Project overview and guide  

---

## 💡 Future Enhancements

- 🔁 Automate ETL using SQL Agent Jobs or Python  
- 📊 Create interactive dashboards in Power BI  
- ⏱️ Implement incremental loading for real-time updates  
- 🔒 Add Row-Level Security (RLS) for user-based access  
- 📈 Extend model for multi-year sales forecasting  



