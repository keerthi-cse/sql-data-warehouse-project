# SQL Data Warehouse Project (Data Engineering)

## Overview

This project demonstrates the development of a modern data warehouse using SQL Server. It focuses on building an end-to-end ETL pipeline, improving data quality, integrating multiple data sources, and designing a scalable data model for analytical workloads.

---

## Objective

Develop a modern data warehouse using SQL Server by integrating sales data from multiple source systems to create a clean, consistent, and analysis-ready data repository.

---

## Project Requirements

### Data Sources
- Import data from two source systems (ERP and CRM) provided as CSV files.

### Data Quality
- Clean and standardize the data by resolving missing values, duplicates, and inconsistencies.

### Data Integration
- Combine ERP and CRM datasets into a unified data model optimized for analytical queries.

### Data Modeling
- Design Bronze, Silver, and Gold layers following the Medallion Architecture.
- Build fact and dimension tables using a Star Schema.

### ETL Pipeline
- Extract data from source files.
- Transform and validate the data.
- Load the processed data into the data warehouse.

### Scope
- Process only the latest available dataset.
- Historical data tracking is not included.

### Documentation
- Document the database architecture, data model, ETL workflow, and naming conventions.

---

## Technologies Used

- SQL Server Express
- SQL Server Management Studio (SSMS)
- T-SQL
- CSV Files
- Git & GitHub

---

## Project Architecture

Source Systems (ERP & CRM CSV Files)
        ↓
Bronze Layer (Raw Data)
        ↓
Silver Layer (Clean & Standardized Data)
        ↓
Gold Layer (Business-Ready Data Warehouse)



