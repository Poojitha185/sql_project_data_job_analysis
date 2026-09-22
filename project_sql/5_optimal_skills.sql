/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on positions in India with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
  offering strategic insights for career development in data analysis
*/

with skills_demand as (select 
  skills_dim.skill_id,
  skills_dim.skills,
  count(skills_job_dim.job_id) as demand_skills_count
from  job_postings_fact
  inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
  inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
  job_title_short='Data Analyst'
  and salary_year_avg is not null
  and job_location like '%India'
group by
skills_dim.skill_id)

,average_salary as (select 
  skills_job_dim.skill_id,
  round(avg(salary_year_avg),0) as avg_salary
from  job_postings_fact
  inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
  inner join skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where 
  job_title_short='Data Analyst' 
  and salary_year_avg is not null
  and job_location like '%India'
group by
  skills_job_dim.skill_id
)
select 
  skills_demand.skill_id,
  skills_demand.skills,
  demand_skills_count,
  avg_salary
from
  skills_demand
inner join average_salary on skills_demand.skill_id=average_salary.skill_id
where
  demand_skills_count>10
order by
  avg_salary desc,
  demand_skills_count desc
limit 25;

--same as above query but in concise way
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


