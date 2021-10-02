---a
select avg(salary)
from db_lab.public.instructor,department
where department.dept_name=instructor.dept_name
group by department
order by avg(salary) asc;
--b
select avg(salary)
from db_lab.public.instructor,department
where department.dept_name=instructor.dept_name
group by department
order by avg(salary) asc;
--c
select dept_name
from (
         select dept_name, count(course_id) as number
         from course
         group by dept_name
) sub
where number in (
    select min(number)
    from (
         select dept_name, count(course_id) as number
         from course
         group by dept_name
) sub
    )
---d
with ids as(
    select id,count(course_id) as number
    from takes
    group by id
)
select student.id,name,number
from student,ids
where student.id=ids.id and dept_name='Comp. Sci.' and number>3
---e
select name
from db_lab.public.instructor
where dept_name='Biology' or dept_name='Philosophy' or dept_name='Music'
---f
with years_2018 as(
    select distinct id,year
    from teaches
    where year=2018
)
select distinct instructor.id,name,years_2018.year
from db_lab.public.instructor,years_2018
where instructor.id=years_2018.id and instructor.id not in (
    select distinct id
    from teaches
    where year=2017
    )