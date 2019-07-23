--Check row count for each table
select 'employees' as tablename, count(*) from employees
union
select 'departments' as tablename, count(*) from departments
union
select 'dept_emp' as tablename, count(*) from dept_emp
union
select 'dept_manager' as tablename, count(*) from dept_manager
union 
select 'salaries' as tablename, count(*) from salaries
union
select 'titles' as tablename, count(*) from titles
order by tablename;

