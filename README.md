# 🛒 Olist E-commerce Business Intelligence Platform

> An end-to-end Business Intelligence project built using PostgreSQL, SQL, Power BI, and DAX to analyze the Brazilian Olist E-commerce dataset.

![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Analytics-blue)
![DAX](https://img.shields.io/badge/DAX-Measures-green)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📌 Project Overview

This project analyzes the Brazilian Olist E-commerce dataset to generate business insights across sales, customers, products, sellers, operations, and customer experience.

The solution was developed as a complete Business Intelligence platform using PostgreSQL for data storage and SQL analysis, and Power BI for interactive dashboards and advanced analytics.

The project includes:

- Executive Business Dashboard
- Sales Analytics
- Customer Analytics
- Product Analytics
- Seller Analytics
- Operations Dashboard
- Customer Experience Dashboard
- RFM Customer Segmentation
- Cohort Analysis

---

## 🎯 Business Objectives

This project answers business questions such as:

- Which product categories generate the highest revenue?
- Which states contribute the most sales?
- Who are the most valuable customers?
- Which sellers perform the best?
- How efficiently are orders delivered?
- How satisfied are customers?
- Which customer segments should marketing target?
- How well are customers retained over time?


## 🛠️ Tech Stack

| Category | Technologies |
|----------|--------------|
| Database | PostgreSQL |
| Query Language | SQL |
| Data Visualization | Power BI |
| Data Modeling | Star Schema |
| Analytics | DAX |
| Version Control | Git & GitHub |

---

## 📂 Dataset

**Dataset:** Brazilian Olist E-commerce Dataset

The dataset contains approximately **100,000 orders** placed between **2016 and 2018** on the Olist marketplace in Brazil.

### Tables Used

| Table | Description |
|-------|-------------|
| customers | Customer information |
| orders | Order details |
| order_items | Product-level order information |
| payments | Payment information |
| products | Product details |
| sellers | Seller information |
| reviews | Customer reviews |
| category_translation | Product category translation |

📌 Dataset Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## 🏗️ Data Model

The project follows a relational data model built in PostgreSQL and imported into Power BI using a Star Schema approach.

### Data Model

![Data Model](documentation/Data_Model.png)

---

## 📈 Key Features

- Interactive Power BI dashboards
- SQL-based business analysis
- PostgreSQL relational database
- Star Schema data model
- DAX measures and KPIs
- RFM Customer Segmentation
- Cohort Analysis
- Business-focused insights and recommendations
