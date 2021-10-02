---3
-----a
with comp_stud as(
    select id,name
    from student
    where dept_name='Comp. Sci.'
)
select distinct name
from comp_stud,takes
where (grade='A' or grade='A-') and takes.id in (comp_stud.id)
---b
select distinct i_id
from advisor
where s_id not in (
    select distinct id
    from takes
    where grade!='A' and grade!='A-' and grade!='B+' and grade!='B'
    )
----c
select dept_name
from department
where dept_name not in (
    select distinct dept_name
    from student
    where id in (
        select distinct id
        from takes
        where grade='F' or grade='C'
        )
    )
---d
select name
from instructor
where id not in (
    select distinct id
    from teaches
    where course_id in (
        select distinct course_id
        from takes
        where grade = 'A'
        )
    )
---e
select title
from course
where course_id not in (
    select distinct course_id
    from section
    where time_slot_id in (
        select distinct time_slot_id
        from time_slot
        where end_hr>13 or (end_hr=13 and end_min>1)
        )
    )