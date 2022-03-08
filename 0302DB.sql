SQL 연습문제
1. 연봉이 120000 이상 되는 사원들의 이름 및 연봉을 출력하시오.

select last_name, salary*12 "Ann Sal"
from employees
where salary*12 >=120000

2. 사원번호가 176인 사원의 이름과 부서 번호를 출력하시오.

select last_name, department_id
from employees
where employee_id = 176

where employee_id in ‘176’

where employee_id like ‘%176%’


3. 연봉이 150,000에서 200,000의 범위 이외인 사원들의
이름 및 연봉을 출력하시오. 단 연봉은 AnnSal 로 출력하시오.
select last_name, salary*12 "AnnSal"
from employees
where salary*12 not between 150000 and 200000



where salary*12 <= 150000
or salary*12 >= 200000
비 효율적이다 !!


4. 2003/01/01 일부터 2005/05/30 일 사이에 고용된 사원들의 이름, 사번, 고용일자를 출력하시오.
고용일자를 역순으로 정렬하시오

select last_name, employee_id, hire_date
from employees
where hire_date between '03/01/01' and '05/05/30'
order by hire_date desc

5. 20번 및 50번 부서에서 근무하는 모든 사원들의 이름 및 부서 번호를 알파벳순으로 출력하시오

select last_name, department_id
from employees
where department_id in (20,50)
order by last_name asc

6. 20번 및 50번 부서에 근무하며, 연봉이 200,000 ~ 250,000 사이인 사원들의 이름 및 연봉을 출력하시오

select last_name, salary*12
from employees
where department_id in (20,50)
and salary*12 between 200000 and 250000
7. 2006년도에 고용된 모든 사람들의 이름 및 고용일을 조회한다
select last_name, hire_date
from employees
where hire_date like '06%'

where hire_date between ‘06/01/01’ and ‘06/12/31’

8. 매니저가 없는 사람들의 이름 및 업무를 출력하시오
	select last_name, job_id
from employees
where manager_id is null

9. 매니저가 있는 사람들의 이름 및 업무, 매니저 번호를 조회한다.
select last_name, job_id, manager_id
from employees
where manager_id is not null

10. 커미션을 받는 모든 사원들의 이름, 연봉 및 커미션을 출력하시오.
연봉을 역순으로 정렬하고, 연봉은 ANNSAL로 출력하시오

select last_name, salary*12 as annsal, commission_pct
from employees
where commission_pct is not null
order by annsal desc

	11. 이름의 네번째 글자가 a 인 사원의 이름을 조회하시오
select last_name
from employees
where last_name like '___a%'

12. 이름에 a 및 e 글자가 있는 사원의 이름을 조회하시오
select last_name
from employees
where last_name like '%a%'
and last_name like '%e%'

13. 급여가 2500, 350,, 7000 이 아니며 직업이 SA_REP 나 ST_CLERK 인 사원의 이름과, 급여, 직없을 출력하시오.

select last_name, salary, job_id
from employees
where salary not in (2500, 3500, 7000)
and job_id in ('SA_REP' ,'ST_CLERK')

* 오답*  
and job_id = SA_REP
or ST_CLERK
* 연산자 우선 순위에 의해서 값이 다르게 나온다*
*주의할것!!!!!!




14. 30번 부서내의 모든 직업들을 유일한 값으로 출력하시오. 90번 부서 도한 포함하고, 직업을 오름차순으로 출력하시오

select distinct job_id, department_id
from employees
where department_id in (30, 90)
order by job_id asc
