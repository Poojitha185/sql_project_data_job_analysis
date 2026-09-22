/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available in India.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employer
*/

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




