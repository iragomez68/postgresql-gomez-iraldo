--Check row count for each table
select 'employees' as tablename, count(*) as rowcount, 2 as orderby from employees
union
select 'departments' as tablename, count(*) as rowcount, 1 as orderby from departments
union
select 'dept_emp' as tablename, count(*) as rowcount, 4 as orderby  from dept_emp
union
select 'dept_manager' as tablename, count(*)  as rowcount, 3 as orderby  from dept_manager
union 
select 'salaries' as tablename, count(*)  as rowcount, 6 as orderby from salaries
union
select 'titles' as tablename, count(*) as rowcount, 7 as orderby  from titles
order by orderby;

