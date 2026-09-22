/*
Answer: What are the top skills based on salary?

-Look at the average salary associated with each skill for Data Analyst positions
-Focuses on roles with specified salaries in India
-Why? It reveals how different skills impact salary levels for Data Analysts and
-helps identify the most financially rewarding skills to acquire or improve
*/
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
/*
Quick Insights — Top-Paying Data Analyst Skills
->Big Data & distributed processing dominate the top: Skills like PySpark ($165K), Spark ($118K), Hadoop ($113K), Kafka ($122K), and Databricks ($136K) indicate that higher-paying analyst roles increasingly involve handling large-scale datasets and data pipelines.
->Strong demand for databases & data platforms: PostgreSQL and MySQL ($165K each) rank among the highest, while MongoDB ($136K), Snowflake ($111K), and Neo4j ($164K) show that database expertise is strongly associated with higher-paying roles.
->Data engineering skills are valuable: Airflow ($138K), Databricks ($136K), Kafka ($122K), and Shell/Bash ($119K/$111K) suggest that analysts with some data engineering and automation capabilities can access higher-paying opportunities.
->Python ecosystem remains important: Pandas ($122K) and Matplotlib ($111K) appear in the top 25, showing that Python-based data analysis and visualization remain relevant even among higher-paying positions.
->Cloud/data-warehouse technology appears: Snowflake ($111K) and Databricks ($136K) point toward the importance of modern data platforms in better-paid roles.
->BI expertise is also represented: DAX ($111K) indicates that business intelligence and analytical reporting skills still appear in higher-paying analyst positions.

📊 Overall Trend

The biggest pattern is that the highest-paying Data Analyst roles are not limited to traditional analysis tools. They increasingly combine:

SQL/Databases + Python + Big Data + Data Engineering + Cloud/Data Warehousing

“Higher-paying Data Analyst roles increasingly combine traditional analytical skills with big-data, database, automation, and data-engineering technologies.”

[
  {
    "skills": "pyspark",
    "avg_salary": "165000"
  },
  {
    "skills": "gitlab",
    "avg_salary": "165000"
  },
  {
    "skills": "postgresql",
    "avg_salary": "165000"
  },
  {
    "skills": "linux",
    "avg_salary": "165000"
  },
  {
    "skills": "mysql",
    "avg_salary": "165000"
  },
  {
    "skills": "neo4j",
    "avg_salary": "163782"
  },
  {
    "skills": "gdpr",
    "avg_salary": "163782"
  },
  {
    "skills": "airflow",
    "avg_salary": "138088"
  },
  {
    "skills": "mongodb",
    "avg_salary": "135994"
  },
  {
    "skills": "scala",
    "avg_salary": "135994"
  },
  {
    "skills": "databricks",
    "avg_salary": "135994"
  },
  {
    "skills": "pandas",
    "avg_salary": "122463"
  },
  {
    "skills": "kafka",
    "avg_salary": "122100"
  },
  {
    "skills": "confluence",
    "avg_salary": "119250"
  },
  {
    "skills": "visio",
    "avg_salary": "119250"
  },
  {
    "skills": "shell",
    "avg_salary": "118500"
  },
  {
    "skills": "spark",
    "avg_salary": "118332"
  },
  {
    "skills": "jira",
    "avg_salary": "115213"
  },
  {
    "skills": "no-sql",
    "avg_salary": "114291"
  },
  {
    "skills": "hadoop",
    "avg_salary": "113276"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111213"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "111175"
  },
  {
    "skills": "dax",
    "avg_salary": "111175"
  },
  {
    "skills": "bash",
    "avg_salary": "111175"
  },
  {
    "skills": "electron",
    "avg_salary": "111175"
  }
]
*/