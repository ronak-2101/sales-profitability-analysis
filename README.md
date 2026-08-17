# 📊 Sales & Profitability Performance

![Python](https://img.shields.io/badge/Python-Data%20Analysis-blue?logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-SQL-blue?logo=postgresql)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-purple?logo=pandas)
![NumPy](https://img.shields.io/badge/NumPy-Analysis-blue?logo=numpy)
![Status](https://img.shields.io/badge/Project-Completed-success)

## 🚀 Project Overview

**Sales & Profitability Performance** is an end-to-end data analytics project completed as the **final project of a BeeSkilled virtual internship**.

The project focuses on analyzing sales and profitability data to identify key business trends, product performance, market performance, customer-segment contribution, discount impact, and time-based patterns.

The analysis combines **Python, PostgreSQL, SQL, and Power BI** to transform raw data into actionable business insights.

---

## 🎯 Project Objectives

The main objectives of this project were to:

* 🧹 Clean and prepare the dataset using Python
* 🔍 Perform exploratory data analysis (EDA)
* 📊 Analyze sales and profitability using SQL
* 🏆 Identify high-performing products and markets
* 👥 Analyze customer-segment performance
* 💰 Evaluate the relationship between discounts, sales, and profitability
* 📅 Identify monthly and yearly performance patterns
* 📈 Build an interactive Power BI dashboard
* 🤖 Apply Linear Regression for sales prediction
* 💡 Translate analytical results into business findings and recommendations

---

## 📁 Dataset Overview

* **Records:** 700
* **Columns:** 16
* **Data Type:** Sales and profitability data
* **Key business dimensions:** Product, Country, Segment, Discount Band, Date/Year
* **Key measures:** Sales, Profit, Discounts, Units Sold, COGS

The raw dataset is **not included in this repository**.

---

## 🛠️ Tools & Technologies

| Tool                | Purpose                                  |
| ------------------- | ---------------------------------------- |
| 🐍 Python           | Data cleaning, EDA & predictive analysis |
| 🐼 Pandas           | Data manipulation and analysis           |
| 🔢 NumPy            | Numerical operations                     |
| 🐘 PostgreSQL       | SQL-based business analysis              |
| 🖥️ pgAdmin 4       | PostgreSQL database management           |
| 📊 Power BI         | Interactive dashboard & visualization    |
| 📄 Jupyter Notebook | Python analysis workflow                 |

---

# 🔄 Project Workflow

```text
Raw Dataset
     ↓
Python Data Cleaning
     ↓
Exploratory Data Analysis
     ↓
PostgreSQL Database
     ↓
SQL Business Analysis
     ↓
Power BI Data Visualization
     ↓
Business Insights
     ↓
Recommendations
```

---

# 🐍 1. Python — Data Cleaning & EDA

The dataset was first explored and prepared using Python.

### 🔧 Data Preparation

The following activities were performed:

* Checked dataset structure and dimensions
* Checked and handled missing/null values
* Verified and corrected data types
* Checked for duplicate records
* Performed outlier analysis
* Used descriptive statistics to understand numerical variables
* Created histograms to examine data distributions

### 📊 Exploratory Data Analysis

EDA was performed to understand:

* Sales distribution
* Profit distribution
* Units Sold
* Product performance
* Sales and profitability patterns

### 🤖 Predictive Analysis

A **Linear Regression model** was also developed as part of the Python analysis to explore sales prediction.

Model evaluation included:

* Mean Squared Error (MSE)
* R² Score

---

# 🐘 2. SQL — Business Analysis

The cleaned data was analyzed using **PostgreSQL and pgAdmin 4**.

Approximately **30 SQL queries** were developed to answer business questions.

### 🔎 SQL Concepts Used

* `SELECT`
* `WHERE`
* `GROUP BY`
* `HAVING`
* Aggregate Functions
* `JOIN`
* Subqueries
* CTEs
* `CASE`
* Window Functions
* `DENSE_RANK()`
* `LAG()`
* Percentage calculations
* Profit-margin calculations

### 💼 Key Business Questions

The SQL analysis explored questions such as:

* Which product generates the highest Sales?
* Which product generates the highest Profit?
* Which products have the highest/lowest Units Sold?
* Which products have high Sales but relatively low Profit?
* Which products contribute the highest percentage of total Sales?
* Which country generates the highest Sales and Profit?
* Which country has the highest Profit Margin?
* Which customer segment contributes the most Sales?
* Which country–segment combination generates the highest Profit?
* How do Sales, Units Sold, and Profit differ across Discount Bands?
* Does a higher Discount Band lead to higher Sales but lower Profit Margin?
* What are the yearly Sales and Profit trends?
* Which months generate the highest Sales and Profit?
* What are the Top 3 products by Sales in each year?

The SQL scripts include CTEs and window functions for product ranking and contribution analysis.

---

# 📊 3. Power BI — Interactive Dashboard

An interactive Power BI dashboard was developed to present the analytical results in a business-friendly format.

### 📌 Dashboard Features

* 🎯 KPI Cards
* 🎚️ Interactive Slicers
* 📊 Bar & Column Charts
* 📈 Line & Clustered Column Charts
* 🔻 Funnel Visual
* 💬 Custom Tooltips
* 🧮 DAX Measures

### 📌 Key KPIs

| KPI                         |   Value |
| --------------------------- | ------: |
| 💰 Total Sales              | 118.73M |
| 📈 Total Profit             |  16.89M |
| 🏷️ Total Discounts         |   9.21M |
| 📦 Units Sold               |   1.13M |
| 💵 Average Sales per Record | 169.61K |

> **Note:** The average figure represents the average Sales value per record based on the SQL analysis, rather than a true Average Order Value.

---

# 🔍 Key Business Findings

## 🏆 1. Product Performance

**Finding:** Paseo is the strongest-performing product.

**Evidence:** Paseo contributes approximately **27.80% of total Sales** and also generates the highest Profit.

**Business Implication:** Paseo is a key revenue and profitability driver, making inventory availability and targeted marketing important for sustaining performance.

---

## 🌎 2. Country Performance

**Finding:** The United States is the largest sales-generating market, but it is not the most profitable market.

**Evidence:** The **United States** generates the highest Sales, while **France** generates the highest Profit and **Germany** has the strongest Profit Margin.

**Business Implication:** Market performance should be evaluated using both revenue and profitability rather than Sales alone.

---

## 👥 3. Segment Performance

**Finding:** Government is the dominant customer segment.

**Evidence:** Government contributes approximately **44.22% of total Sales**, while the **France–Government combination** generates the highest Profit.

**Business Implication:** Retention and expansion within the Government segment should be prioritized, while the France–Government combination can provide a benchmark for improving other markets.

---

## 💸 4. Discount Analysis

**Finding:** Higher discounts do not necessarily result in higher profitability.

**Evidence:** The **Medium Discount Band** generates the highest Sales, while Low/No Discount provides a relatively stronger balance between Sales and Profit. The High Discount Band shows weaker profitability.

**Business Implication:** Discount strategies should be optimized based on their impact on both revenue and Profit Margin rather than using discounts only to increase Sales.

---

## 📅 5. Time-Based Performance

**Finding:** Sales and Profit vary across months and years.

**Evidence:** **October 2014** recorded the highest Sales, while **December 2014** generated the highest Profit.

**Business Implication:** Historical performance patterns can support better inventory planning, promotional campaigns, and resource allocation.

---

# 💡 Recommendations

### 1. 🏆 Prioritize High-Performing Products

Focus inventory availability and marketing efforts on products such as **Paseo** that demonstrate strong Sales and Profit performance.

### 2. 🌎 Focus on Profitable Markets

Continue strengthening the United States as a major revenue market while studying the factors contributing to stronger profitability in France and Germany.

### 3. 👥 Strengthen the Government Segment

Given its **44.22% contribution to total Sales**, prioritize customer retention and expansion strategies within the Government segment.

### 4. 💰 Optimize Discount Strategy

Avoid excessive discounting where it significantly affects profitability. Evaluate discount decisions using both Sales growth and Profit Margin.

### 5. 📅 Use Seasonal Trends for Planning

Use historical monthly Sales and Profit patterns to improve inventory planning, promotional timing, and resource allocation.

### 6. 📈 Focus on Profitable Growth

Evaluate products, markets, and segments using **Sales, Profit, and Profit Margin together** rather than relying solely on Sales volume.

---

# 📸 Dashboard Preview

Add your best Power BI dashboard screenshot here:

```markdown
[Sales & Profitability Dashboard](dashboard.png)
```

The dashboard provides an interactive view of Sales, Profit, Products, Countries, Segments, Discount Bands, and monthly performance.

---

# 🎥 Dashboard Demonstration

A short video demonstration of the interactive Power BI dashboard is included in the repository.

```text
Dashboard/dashboard-demo.mp4
```

---

# 📄 Project Report

The complete analysis, findings, and recommendations are available in:

📑 `Report/Report.pdf`

---

# 🎓 Internship Context

This project was completed as the **final project of a BeeSkilled virtual internship**, applying practical data analytics techniques across Python, SQL, and Power BI.

The project demonstrates an end-to-end workflow from **data preparation and analysis to visualization and business recommendations**.

---

# 📌 Skills Demonstrated

### Technical Skills

* 🐍 Python
* 🐼 Pandas
* 🔢 NumPy
* 🐘 PostgreSQL
* 🧮 SQL
* 📊 Power BI
* 📈 Data Visualization
* 🤖 Linear Regression
* 📉 Statistical Analysis

### Analytical Skills

* Data Cleaning
* Exploratory Data Analysis
* Business Question Formulation
* Sales Analysis
* Profitability Analysis
* Product Analysis
* Market Analysis
* Customer Segment Analysis
* Discount Analysis
* Trend Analysis
* Business Recommendations

---

# ⭐ Key Takeaway

This project demonstrates how raw business data can be transformed into actionable insights through a structured analytics workflow:

**Clean → Explore → Analyze → Visualize → Interpret → Recommend**

The analysis highlights that **strong Sales performance does not always translate into strong profitability**, making it important to evaluate business performance through multiple metrics such as **Sales, Profit, Profit Margin, Product, Market, Segment, and Discount Strategy**.

---

## 👤 Project

**Sales & Profitability Performance**
Final Project — BeeSkilled Virtual Internship

---

⭐ If you found this project useful, feel free to explore the SQL analysis, Python notebook, Power BI dashboard, and final report included in this repository.
