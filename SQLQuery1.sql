--project status
with project_status as(  
SELECT 
project_id,
project_name,
project_budget,
'upcoming'as status --will add this new column to know which projects are completed or in progress
FROM upcoming_projects
UNION all
SELECT 
project_id,
project_name,
project_budget,
'completed' as status --will add this new column to know which projects are completed or in progress
FROM completed_projects)




-- big main table - shortended with important info
SELECT 
e.employee_id,
e.first_name,
e.last_name,
e.job_title,
e.salary,
d.Department_Name,
pa.project_id,
p.project_name,
p.status
FROM employees as e
JOIN departments as d 
ON e.department_id = d.Department_ID
join project_assignments as pa
ON pa.employee_id = e.employee_id
JOIN project_status p
on p.project_id = pa.project_id