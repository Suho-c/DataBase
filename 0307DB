-----------------------------------
-- 1. DQL(Data Query Languege)
select *, distinct, 컬럼명, (first_name ||' ' || last_name) 'name', "",  서브쿼리
from : table, data set: (서브 쿼리)가 가능
where : 조건절, 서브쿼리
group by : 집계
having : 집계의 조건, 서브쿼리
order by : 순서, 정렬


select (first_name ||' '|| last_name) "Name"
from employees

-------------------
-- select 절에서 서브쿼리의 사용
select last_name, job_id,
	(select department_name 
		from departments
		where e.department_id = department_id) as depName
from employees e

-- from 절에서 서브쿼리의 사용
select *
from (select department_id, sum(salary) 
       from employees
	  group by department_id ) s

--
-- 단일 연산자 : =, >, <, >=, <=, <>
-- 다중 연산자 : in, any, all
select last_name, job_id, department_id
from employees 
where job_id in (select distinct job_id from employees)
;

select department_id, min(salary)
from employees
group by department_id
having min(salary) > (select min(salary)
                        from employees
					where department_id = '50')
;					

-- having절의 서브쿼리 사용...
-- 평균 급여가 가장 적은(2780) 업무(PU_CLERK)은 어떤것이가?

select job_id, avg(salary) avg_sal
from employees
group by job_id
having avg(salary) = (select min(avg(salary))
                       from employees
					   group by job_id)


-- 다중행의 반환 서브쿼리
-- 직원의 최소 급여를 받는 직원의이름, 직종, 급여들은 조회하시오..
select last_name, job_id, salary
from employees
where job_id in (select distinct job_id from employees where salary > 5000)
;
 
-- in(or), any(or), all(and)
-- any(or), all(and)
-- <any(or): 최대값보다 적은거, >any 최소값보다 큰거
    salary <any (5000,6000,7000,8000) -> 8000보다 적은것
    salary >any (5000,6000,7000,8000) -> 5000보다 큰것
	
-- <all(and): 최대값보다 적은거, >all 최소값보다 큰거
    salary <all (5000,6000,7000,8000) -> 5000보다 적은것
    salary >all (5000,6000,7000,8000) -> 8000보다 큰것
	
--
--9000,6000,4800,4800,4200
-- 급여가 4200보다 많이받는 직원의 이름
select department_id, last_name, salary
from employees
where salary >any (select salary 
				from employees 
				where job_id = 'IT_PROG')

-- 급여가 9000보다 적게받는 직원의 이름
select department_id, last_name, salary
from employees
where salary >any (select salary 
				from employees 
				where job_id = 'IT_PROG')

select department_id, last_name, salary
from employees
where salary >all (select salary 
				from employees 
				where job_id = 'IT_PROG')

-- null 값을 리턴하는 서브쿼리 -> no rows
select last_name, salary	
from employees	
where salary > (select salary 
				from employees where salary > 50000) 

-- where 여러컬럼을 사용.
select last_name, job_id, salary
from employees
where (department_id, job_id) in  (select department_id, job_id 
						from employees
						group by department_id, job_id
						having  avg(salary) > 5000);

-- 문제 풀이
--26			
select avg(salary) from employees;
--28
select employee_id, last_name
from employees
where department_id in (select distinct department_id
						from employees
						where last_name like  '%u%')
where last_name not like '%u%'
;
--29
select  e.last_name, d.department_name, d.location_id
from employees e, departments d
where e.department_id = d.department_id
  and d.location_id =(select location_id from locations WHERE CITY = 'Seattle')
  and e.commission_pct is null;  

-- 32
select employee_id, last_name, salary
from employees
where department_id in (select distinct department_id
			from employees
			where last_name like '%u%'
			and salary > (select avg(salary) from employees)
		);

-- with 사용
with samp as (
	select department_id, job_id, 
	    sum(salary) sumsal, 
		avg(salary) avgsal, 
		max(salary) maxsal, 
		min(salary) minsal
     from employees
    group by department_id, job_id	 
)		
select * from samp;


-----------------------------------
-- 2. DML(Data Manipulation Languege)
-- 삽입(inert), 수정(update), 삭제(delete)
-- rollback, commit, savepoint

-- insert 문
-- -. 행단위의 작업이 진행 된다.		
-- -. 한 행의 모든 항목이 삽입된다.
-- insert 문법규칙..
--  insert into 테이블 명 [(col1, col2...)] values ('aa', 'bb'...) 		
--  insert into 테이블 명  values ('aa', 'bb'...) 		
--  insert into 테이블 명 [(name, tel...)] values ('010-1234-2568', '신인호'...) 		
--  기술된 컬럼의 수와 value 값의 갯 수는 같아야 한다.
--  컬럼의 속성이 서로 같아야 한다.
--  컬럼과 값은 1:1로 매칭 된다.
--  문자와 날짜는 홑타옴표로 묶어준다.
--  insert into 테이블 명  values ('aa', 'bb'...) 		
--  컬럼이름 생략시 value 값에 테이블에 생성된 모든 컬럼값의 속성에 맞게 순서적으로 기술한다.
-- pk : not null, unique

--- insert 
insert into departments (DEPARTMENT_ID,DEPARTMENT_NAME, MANAGER_ID,LOCATION_ID)   
 values (310,'big data', 100, 1700);

insert into departments 
 values (320,'big data', null, null);
 
insert into departments (DEPARTMENT_ID,DEPARTMENT_NAME) 
 values (330,'big data');
 
insert into departments 
 values (340,'big data', null, null);
  
--- update
-- 열 단위의 작업이 진행
update 테이블명 
  set 컬럼1 = 수정하고자 하는 값(서브쿼리),
      컬럼2 = 수정하고자 하는 값,
      컬럼3 = 수정하고자 하는 값,
      컬럼4 = 수정하고자 하는 값
where 조건식 	  
  
select * from departments
where DEPARTMENT_ID = 310
; 
update departments
  set department_name = 'AI'
where DEPARTMENT_ID = 310
; 
  
--- delete
-- 행 단위의 작업이 진행
delete [from]departments
where DEPARTMENT_ID = 310;

delete departments
where DEPARTMENT_ID = 50

-- commit, rollback
-- savepoint aa1
-- rollback to aa1  

-- 3. DDL(Data Define Languege)
-- create, alter, drop, truncate
-- 트랜젹션의 완성시기: commit, rollback, savepoint
--        ddl의 작업이 이루어지면 이전의 트랜젹션은 commit. 

create table dept (
   dept_id number(4),
   dept_nm varchar2(30), 
   dept_mgr number(6), 
   dept_loc number(4)
);
-- table layout + data
create table dept50 as
select * from departments
;
create table dept60 as
select * from departments where 1 <> 1
