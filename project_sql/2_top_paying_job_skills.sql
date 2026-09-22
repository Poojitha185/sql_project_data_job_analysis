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
/*
Skill Insights: 
SQL emerged as the most frequently demanded skill, appearing in 6 of the 9 job postings. 
Python was the next major analytical skill, while database technologies such as Oracle and MongoDB were also highly represented. 
Cloud and big-data technologies such as AWS, Azure and Spark were mainly associated with technical Data Architect roles, whereas Power BI, Tableau and Excel were more relevant to business-focused analyst positions.
[
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "sql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "python"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "nosql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "scala"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "shell"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "databricks"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "aws"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "oracle"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "snowflake"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "spark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "pandas"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "pyspark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "airflow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "kafka"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "unix"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "linux"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "power bi"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "jenkins"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "flow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10 22:18:20",
    "company_name": "Srijan Technologies",
    "skills": "gitlab"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-06 20:30:35",
    "company_name": "Bosch Group",
    "skills": "oracle"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-06 20:30:35",
    "company_name": "Bosch Group",
    "skills": "sap"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "mongo"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "mysql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "postgresql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "sql server"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "azure"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "aws"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "redshift"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "oracle"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "hadoop"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12 13:14:51",
    "company_name": "Bosch Group",
    "skills": "power bi"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-06 21:12:14",
    "company_name": "Eagle Genomics Ltd",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "python"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "scala"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "go"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "no-sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "neo4j"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "azure"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "databricks"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "aws"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "oracle"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "spark"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "hadoop"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07 11:12:39",
    "company_name": "Eagle Genomics Ltd",
    "skills": "power bi"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "flow"
  },
  {
    "job_id": 309885,
    "job_title": "Senior Analyst , Product Revenue (Data Analyst / Analytics)",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-24 14:34:38",
    "company_name": "Zscaler",
    "skills": "snowflake"
  },
  {
    "job_id": 309885,
    "job_title": "Senior Analyst , Product Revenue (Data Analyst / Analytics)",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-24 14:34:38",
    "company_name": "Zscaler",
    "skills": "excel"
  },
  {
    "job_id": 309885,
    "job_title": "Senior Analyst , Product Revenue (Data Analyst / Analytics)",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-02-24 14:34:38",
    "company_name": "Zscaler",
    "skills": "tableau"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-31 17:13:36",
    "company_name": "NielsenIQ",
    "skills": "python"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-31 17:13:36",
    "company_name": "NielsenIQ",
    "skills": "r"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-31 17:13:36",
    "company_name": "NielsenIQ",
    "skills": "bash"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-31 17:13:36",
    "company_name": "NielsenIQ",
    "skills": "azure"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-31 17:13:36",
    "company_name": "NielsenIQ",
    "skills": "spark"
  },
  {
    "job_id": 494523,
    "job_title": "Methods and Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-05-31 17:13:36",
    "company_name": "NielsenIQ",
    "skills": "pandas"
  }
]
*/