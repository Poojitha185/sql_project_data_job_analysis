
# Introduction
📊 Dive into the data job market! This project explores the data analyst job market using SQL, focusing on 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary.

🔍 The goal of this project is to identify the skills and job opportunities that are valuable in the data analytics field.

🔎 SQL queries? Check them out here: [project_sql_folder](/project_sql/)

# Background

I created this project to explore the Data Analyst job market using SQL. 
The goal was to understand the salary trends, identify the skills that are 
most in demand, and find skills that are associated with higher-paying 
Data Analyst roles.

Data hails from my [SQL Course](https://www.lukebarousse.com/sql)
by Luke Barousse. It's packed with insights on job titles, salaries, locations, and essential skills.

### Questions I wanted to answer through my SQL analysis:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher avearge salaries?
5. What are the most optimal skills to learn?

# Tools I used

For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis

Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:


### 1. Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on jobs that are available in india. This query highlights the high paying opportunities in the field.

```sql
select
    job_id,
    job_title, 
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from
    job_postings_fact
left join
    company_dim on job_postings_fact.company_id=company_dim.company_id
where
    job_title_short='Data Analyst' and
    job_location like '%India' and
    salary_year_avg is not NULL
order by
    salary_year_avg desc
limit 10;

```
### Insights

Here are some key insights from the top-paying Data Analyst jobs in India in 2023:

- **💰 Salary Range:** The top 10 jobs have average yearly salaries ranging from **$111,175 to $177,283**, showing a wide salary range among high-paying roles.

- **🏢 Diverse Employers:** The results include companies such as **ServiceNow, Bosch Group, Eagle Genomics Ltd, Deutsche Bank, Freshworks, and Upstox**, showing that high-paying data-related opportunities exist across different organizations.

- **💼 Variety of Roles:** The top-paying results include roles such as **Staff Applied Research Engineer, Data Architect, Senior Business & Data Analyst, Enterprise Data Analyst, and Data Analyst**, showing that data-related careers extend beyond the traditional Data Analyst title.

- **📍 Location:** The jobs are located across major Indian cities including **Hyderabad, Bengaluru, Gurugram, Chennai, and Mumbai**, along with some roles listed simply as **India**.

- **📊 Data Architect Roles:** Several of the highest-paying positions are Data Architect roles, with salaries of **$163,782–$165,000** per year.

- **🏆 Highest-Paying Role:** The highest-paying position in the results is **Staff Applied Research Engineer at ServiceNow**, with an average yearly salary of **$177,283**.

![Top paying roles](assets\1_top_paying_roles.png)

*Bar graph visualizing the salary for the Top 10 salaries for data analysts in india; Chatgpt generated this graph from my SQL Query results*

### 2. Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
with top_paying_jobs as(
select
    job_id,
    job_title, 
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name as company_name
from
    job_postings_fact
left join
    company_dim on job_postings_fact.company_id=company_dim.company_id
where
    job_title_short='Data Analyst' and
    job_location like '%India' and
    salary_year_avg is not NULL
order by
    salary_year_avg desc
limit 10
)
select 
top_paying_jobs.*,skills 
from top_paying_jobs
inner join skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
order by salary_year_avg desc;
```
### Insights

- **🧑‍💻 SQL is the most common skill:** SQL appears in **7 of the top-paying jobs**, making it the most frequently required skill in this group.

- **📊 Power BI is highly represented:** Power BI appears in **6 of the top-paying jobs**, showing its presence across several high-paying roles.

- **🐍 Python is also in high demand:** Python is required by **5 of the top-paying jobs**.

- **☁️ Cloud and database skills:** Azure and Oracle each appear in **4 jobs**, while AWS and MongoDB appear in **3 jobs**.

- **⚡ Big-data technologies:** Spark appears in **3 jobs**, while Scala and Databricks appear in **2 jobs**.

- **🔧 Wide range of technical skills:** The results include programming languages, databases, cloud platforms, BI tools, and data-engineering technologies. For example, the Technical Data Architect role requires SQL, Python, NoSQL, Scala, Databricks, AWS, Spark, Power BI, and several other technologies.

- **📈 Different roles require different skill combinations:** The Data Analyst positions include combinations of SQL, Python, R, Tableau, Power BI, Azure, and other tools.

![Top paying job skills](assets\2_top_paying_job_skills.png)

*Bar graph visualizing the count of skills for the top 10 paying jobs for data analysts; ChatGPT generated this graph from my SQL query results*


### 3. In-Demand Skills for Data Analysts

This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demand.

```sql
select 
  skills,
  count(skills_job_dim.job_id) as demand_skills_count
from  job_postings_fact
  inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
  inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
  job_title_short='Data Analyst'
group by
  skills
order by
  demand_skills_count desc
limit 5
```
### Insights

- **🥇 SQL is the most in-demand skill:** SQL has the highest demand with **92,628 job postings**, making it the most frequently requested skill in the dataset.

- **📊 Excel remains highly demanded:** Excel appears in **67,031 job postings**, making it the second most in-demand skill.

- **🐍 Python is widely requested:** Python appears in **57,326 job postings**, showing strong demand for programming skills in Data Analyst roles.

- **📈 Tableau is also popular:** Tableau appears in **46,554 job postings**, highlighting the importance of data visualization skills.

- **📊 Power BI has strong demand:** Power BI appears in **39,468 job postings**, showing significant demand for business intelligence and visualization skills.

- **🔍 Overall trend:** SQL, Excel, Python, Tableau, and Power BI are the five most frequently requested skills among Data Analyst job postings in this dataset.

### Top 5 In-Demand Skills

| Rank | Skill    | Demand Count  |
|------|----------|---------------|
| 1    | SQL      | 92,628        |
| 2    | Excel    | 67,031        |
| 3    | Python   | 57,326        |
| 4    | Tableau  | 46,554        |
| 5    | Power BI | 39,468        |

*Table of the demand for the top 5 skills in data analyst job postings*

### 4. Highest-Paying Skills for Data Analysts in India

Exploring the average salaries associated with different skills revealed which skills are the highest paying.
```sql

select 
  skills,
  round(avg(salary_year_avg),0) as avg_salary
from  job_postings_fact
  inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
  inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
  job_title_short='Data Analyst' 
  and salary_year_avg is not null
  and job_location like '%India'
group by
  skills
order by
  avg_salary desc
limit 25
```

### Insights

- **💰 Highest-paying skills:** PySpark, GitLab, PostgreSQL, Linux, and MySQL are tied for the highest average salary at **$165,000**.

- **🗄️ Database and data-platform skills:** Neo4j has an average salary of **$163,782**, while MongoDB averages **$135,994** and PostgreSQL and MySQL reach **$165,000**.

- **⚡ Data engineering skills:** Airflow, Kafka, Spark, Databricks, Hadoop, and PySpark appear among the top-paying skills, with PySpark reaching **$165,000**.

- **🐍 Python ecosystem:** Pandas has an average salary of **$122,463**, while PySpark reaches **$165,000**, showing different salary levels across Python-related data tools.

- **☁️ Modern data technologies:** Databricks, Snowflake, Kafka, Spark, and Airflow are among the skills associated with higher average salaries in the results.

- **📊 Analytics and visualization skills:** Pandas, Matplotlib, DAX, and related tools also appear in the top 25, with Matplotlib and DAX averaging **$111,175**.

- **📈 Salary range:** The top 25 skills in this analysis have average salaries ranging from **$111,175 to $165,000**.


| Rank | Skill | Average Salary |
|------|-------|---------------:|
| 1 | PySpark | $165,000 |
| 2 | GitLab | $165,000 |
| 3 | PostgreSQL | $165,000 |
| 4 | Linux | $165,000 |
| 5 | MySQL | $165,000 |
| 6 | Neo4j | $163,782 |
| 7 | GDPR | $163,782 |
| 8 | Airflow | $138,088 |
| 9 | MongoDB | $135,994 |
| 10 | Scala | $135,994 |

*Table of the average salary for the top 10 paying skills for data analysts*

### 5. Most Optimal Skills to Learn

Combining insights from demand and salary data, this query aimed to pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

```sql
select 
  skills_dim.skill_id,
  skills_dim.skills,
  count(skills_job_dim.job_id) as demand_skills_count,
  round(avg(salary_year_avg),0) as avg_salary
from
  job_postings_fact
  inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
  inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where
  job_title_short='Data Analyst' 
  and salary_year_avg is not null
  and job_location like '%India'
group by
  skills_dim.skill_id
having
   count(skills_job_dim.job_id) > 10
order by
  avg_salary desc,
  demand_skills_count desc
limit 25;
```
### Insights

- **Spark has the highest average salary** at **$118,332**, although it appears in only 11 job postings.
- **Power BI** has an average salary of **$109,832** and appears in **17 job postings**.
- **SQL is the most in-demand skill** among the results, appearing in **46 job postings**, with an average salary of **$92,984**.
- **Python** appears in **36 job postings** and has an average salary of **$95,933**.
- **Excel** is also highly demanded, appearing in **39 job postings**, with an average salary of **$88,519**.
- Cloud skills such as **Azure and AWS** show relatively strong average salaries of **$98,570** and **$95,333** respectively.
- Overall, the results show a trade-off between **skill demand and average salary**, with some highly demanded skills such as SQL and Excel having lower average salaries than less frequently requested skills such as Spark and Oracle.

### Top 10 Skills by Demand and Average Salary

| Rank | Skill | Demand Count | Average Salary |
|------|-------|-------------:|---------------:|
| 1 | Spark | 11 | $118,332 |
| 2 | Power BI | 17 | $109,832 |
| 3 | Oracle | 11 | $104,260 |
| 4 | Azure | 15 | $98,570 |
| 5 | Python | 36 | $95,933 |
| 6 | AWS | 12 | $95,333 |
| 7 | Tableau | 20 | $95,103 |
| 8 | SQL | 46 | $92,984 |
| 9 | Excel | 39 | $88,519 |
| 10 | R | 18 | $86,609 |

*Table of the most optimal skills for data analyst sorted by salary*

# What I learnt

Working on this project helped me strengthen my SQL skills and understand how SQL can be used to analyze real-world job market data.

- **🔗 Working with Multiple Tables:** Learned how to combine data from different tables using `INNER JOIN` and `LEFT JOIN` to connect job postings, companies, and skills.

- **📊 Data Aggregation:** Improved my understanding of `GROUP BY`, `COUNT()`, and `AVG()` to summarize job demand and salary information.

- **🧩 CTEs and Complex Queries:** Learned how to use Common Table Expressions (CTEs) to break complex queries into smaller and more manageable steps.

- **🔍 Data Analysis:** Used SQL to identify the highest-paying Data Analyst jobs, the most in-demand skills, and skills associated with higher average salaries.

- **💡 Turning Data into Insights:** Learned how to interpret SQL results and turn them into meaningful insights about Data Analyst jobs, salaries, and required skills.

# Conclusions

### Insights

From the analysis, several key insights emerged:

1. **Top-Paying Data Analyst Jobs**: The highest-paying Data Analyst job in the India-filtered results had an average annual salary of **$177,283**, with other high-paying roles reaching around **$165,000**.

2. **Skills for Top-Paying Jobs**: The highest-paying Data Analyst roles required a diverse range of technical skills, with **SQL, Power BI, Python, Azure, and Oracle** appearing frequently among the skills associated with these jobs.

3. **Most In-Demand Skills**: **SQL** was the most in-demand skill among Data Analyst job postings, followed by **Excel, Python, Tableau, and Power BI**, highlighting the importance of strong SQL and analytical skills.

4. **Skills with Higher Average Salaries**: Among skills appearing in more than 10 India-based Data Analyst job postings, **Spark** had the highest average salary at **$118,332**, followed by **Power BI at $109,832** and **Oracle at $104,260**.

5. **Balancing Demand and Salary**: The analysis shows that highly demanded skills such as **SQL, Python, and Excel** are associated with a wide range of salaries, while skills such as **Spark, Power BI, Oracle, and Azure** combine relatively strong demand with higher average salaries.

### Closing Thoughts

This project helped me strengthen my SQL skills while exploring real-world Data Analyst job market data. Through the analysis, I gained a better understanding of salary trends, skill demand, and the skills commonly associated with higher-paying Data Analyst roles in India.

The project also helped me practice writing SQL queries, joining multiple tables, using aggregations and CTEs, and turning query results into meaningful insights. Overall, this analysis showed me how SQL can be used to explore job market trends and support data-driven career research.