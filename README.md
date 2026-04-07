# 📊 E-Learning Platform Purchase Analysis (MySQL Project)

## 📌 Project Overview
This project focuses on analyzing an E-learning platform database using MySQL.  
It includes three main tables: learners, courses, and purchases.  
The dataset captures user enrollments, course details, and transaction history.  
SQL queries are used to explore relationships between different entities.  
The project simulates real-world business analysis scenarios.  
It identifies revenue trends, user behavior, and course performance.  
Various joins and aggregations are applied for analysis.  
The insights help in making data-driven business decisions.

---

## 🎯 Objective
- To analyze learner purchase patterns using MySQL.  
- To calculate total revenue and understand spending behavior.  
- To identify top-performing courses and categories.  
- To analyze customer retention and repeat purchases.  
- To generate actionable business insights using SQL.

---

## ❗ Problem Statement
- Lack of structured insights into user behavior and purchases.  
- Difficulty in tracking revenue trends and performance manually.  
- Limited visibility into high-demand and low-performing courses.  
- Customer retention and repeat purchase behavior unclear.  
- Absence of data-driven decision-making support.

---

## 🗂️ Database Schema

### Tables Used:
- **learners** – Stores learner details  
- **courses** – Stores course information  
- **purchases** – Stores transaction data  

### Attribute Details:

| Table Name | Column Name   | Description                      |
|------------|--------------|----------------------------------|
| learners   | learner_id   | Unique learner identifier        |
| learners   | full_name    | Name of the learner              |
| learners   | country      | Country of learner               |
| courses    | course_id    | Unique course identifier         |
| courses    | course_name  | Course title                     |
| courses    | category     | Course category                  |
| courses    | unit_price   | Price of course                  |
| purchases  | purchase_id  | Unique purchase ID               |
| purchases  | learner_id   | Reference to learner             |
| purchases  | course_id    | Reference to course              |
| purchases  | quantity     | Number of courses purchased      |
| purchases  | purchase_date| Date of purchase                 |

---

## ⚙️ Tools & Technologies
- MySQL (Database Management)  
- SQL (Queries & Analysis)  
- MS Excel / Power BI (Optional Visualization)  

---

## 🔍 Analysis Performed

### 📊 Descriptive Analysis
- Total learners, courses, and purchases analyzed.  
- Revenue calculated using quantity × unit price.  
- Category-wise sales evaluated.  

### 🧠 Diagnostic Analysis
- Identified why certain courses perform better.  
- Compared category performance.  
- Analyzed customer purchase frequency.  

### 🔮 Predictive Analysis
- Forecasted future revenue trends.  
- Identified high-demand courses and categories.  
- Predicted customer growth patterns.  

### 💡 Prescriptive Analysis
- Recommended promoting top-performing courses.  
- Suggested improving low-performing categories.  
- Proposed targeted marketing and discount strategies.  

---

## 📈 Key Insights
- A few learners contribute to most of the revenue (high-value customers).  
- Certain courses (e.g., course_id 2) are highly popular.  
- Programming and Database categories perform strongly.  
- Majority of users are one-time buyers → low retention.  
- Revenue is concentrated within specific time periods.  

---

## ✅ Conclusion
- The project successfully analyzes E-learning data using SQL.  
- It identifies revenue patterns and user behavior.  
- Highlights top-performing courses and categories.  
- Shows need for improving customer retention.  
- Demonstrates practical SQL and data analytics skills.  

---

## 🚀 Future Improvements
- Add more real-time data for better trend analysis  
- Integrate dashboards using Power BI/Tableau  
- Implement recommendation systems  
- Perform advanced predictive modeling  

---

## 👨‍💻 Author
Jeromi
