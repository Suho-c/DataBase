우리 회사에 근무하는 사원의 이름과 그 사원이 근무하는 부서이름을 출력하시오.
	select e.last_name, d.department_name
	from employees e, departments d
	
	



조인  = > 여러개의 테이블에서 데이터를 검색
 시스템내부에서는 조인 대상 테이블의 행을 하나의 행으로 조합
 행이 조합이 될때 무결성이 보장이 되어야 함
조합할 행의 무결성을 보장하기 위해서 조건이 필요
		(did = did) -> 조인조건
 조인을 수행할때는 반드시 조인조건을 where 절에 n-1 개 만큼 작성을 해야 함(n -> 조인 대상 테이블의 개수)
조인 조건이 생략이 되거나 잘못 작성이 되었을때 카티션 프로덕트라는 현상이 발생

  	=> where 절에 조인조건을 n-1개 만큼 반드시 작성
=> 컬럼이름을 명시할때 그 컬럼이 조인테이블에 전부
     존재할때(조인테이블에 같은 이름을 가진 컬럼,
     department_id)
=> 반드시 그 컬럼의 소유중인 테이블 이름을 명시

select e.last_name, d.department_name, e.department_id
from employees e, departments d
where e.department_id = d.department_id


급여가 6000이상인 사원의 이름과 그 사원이 근무하는 부서이름을 출력하시오
select e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and e.salary >= 6000


연봉이 150000 이상인 사원의 이름과 연봉, 그 사원이 근무하는 부서이름과 부서가 위치한 지역번호를 출력하시오.
단, 연봉은 AnnSal 로 출력하시오
select e.last_name, e.salary*12 "AnnSal", d.department_name, d.location_id
from employees e, departments d
where e.department_id = d.department_id
and e.salary*12 >= 150000

이름에 e 가 들어있는 사원의 이름과 그 사원이 근무하는 부서이름을 출력하시오.
select e.last_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and e.last_name like '%e%'





IT 라는 부서에 근무하는 사원의 이름과 급여와 연봉을 출력하시오
 select e.last_name, e.salary, e.salary*12, d.department_name
 from employees e, departments d
 where e.department_id = d.department_id
and d.department_name in 'IT' ← 비효율!!! 하나씩 찾아야하니까
and d.department_name = ‘IT’   ← 이런 식으로 효율적으로

우리회사에 근무하는 사원의 번호와 사원이름, 사원을 관리하는 관리자 번호와 관리자 이름을 출력하시오

** 컬럼이름이 달라도 조인 수행이 가능하다 **


** self join 잘 쓰이지 않음 **
select e.employee_id, e.last_name, e.manager_id, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id

그룹함수 => null 무시


부서별 월급의 총합을 구하시오
select department_id, sum(salary)
from employees
group by department_id

** 처리 되는 순서**
5 select
1 from
2 where 
3 group by
4 having
6 order by



group by  rollup(총합)
		   cube



where 절에서 group 에 대한 조건을 줄수 없다


조건      where => 행에 대한 조건
having => 그룹에 대한 조건








rep가 포함되지 않은 직업들중 급여의 합이 13000 초과인 직업들과 급여의 합을 출력하시오. 단 급여의 합으로 내림차순으로 정렬하세요

select job_id, sum(salary) payroll
from employees
where job_id not like '%rep%'
group by job_id
having sum(salary) > 13000
order by sum(salary);


회사 전체의 최대 급여, 최소 급여, 급여 총 합 및 평균 급여를 출력하시오

select max(salary), min(salary), sum(salary), avg(salary)
from employees

각 직업별, 최대 급여, 최소 급여, 급여 총 합 및 평균 급여를 출력하시오. 단, 최대급여는 MAX, 최소 급여는 MIN, 급여 총 합은 SUM 및 평균 급여는 AVG로 출력하고, 직업을 오름차순으로 정렬하시오

select job_id, max(salary) as max, min(salary) as min, sum(salary) sum, avg(salary) as avg
from employees
group by job_id
order by job_id

동일한 직업을 가진 사원들의 총 수를 출력하시오
!! 잘 안풀렸음 !!
!! 머리글을 보고 데이터를 파악할수 있게 정확한 컬럼이름이 필요함!!!

select job_id, count(employee_id)
from employees
group by job_id



매니저로 근무하는 사원들의 총 수를 출력하시오
select count(distinct manager_id)
from employees

사내의 최대 급여 및 최소 급여의 차이를 출력하시오
select max(salary) - min(salary)
from employees



매니저의 사번 및 그 매니저 밑 사원들 중 최소 급여를 받는 사원의 급여를 출력하시오
매니저가 없는 사람들은 제외한다.
최소 급여가 5000 미만인 경우는 제외한다.
급여 기준 역순으로 조회한다.



select manager_id, min(salary)
from employees
where manager_id is not null ← 생각이 안났음
group by manager_id
having min(salary) >= 5000
order by min(salary) desc



< 틀린것 찾기>
select salary, distinct last_name, sum(salary) Ann Sal
틀린곳 distinct ← select 뒤 “Ann Sal”

from departments → employees
having sum(salary) > 1000 → 그룹바이 밑으로
where last_name in ‘%e%’ and avg(salary) > 2000
→ in → like       avg(salary) > 2000 → having 절으로
group by salary, job_id
order by salary, 4
4 는 없음

부서명, 부서위치ID, 각 부서별 사원 총 수, 각 부서 별 평균 급여를 출력하되, 부서위치를 오름차순으로 출력하시오.
select d.department_name, d.location_id, count(e.employee_id), avg(e.salary)
from departments d, employees e
where e.department_id = d.department_id
group by d.department_name, d.location_id
order by d.location_id asc
서브 쿼리
먼저 실행 결과 넘겨줌

select last_name, salary
from employees
where salary > (select salary 
		from employees 
		where last_name = 'Abel')



group by 제외 모든 절에서 서브 쿼리 사용가능


서브쿼리 작성할때 고려해야 할 것
 내가 뭘 모르는지 찾자(able의 급여??)
 모르는 값을 서브쿼리를 통해 찾자
 모르는 값을 서브쿼리의 select list 절에 어떤 컬럼으로 찾을 것인지 결정(abel의 급여 -> salary)
 서브쿼리가 넘겨준 값을 누가 받는지 결정
메인 쿼리의 where, having 절의 조건식의 컬럼이 받는다
where salary > (salary)
메인쿼리에서 받는 컬럼을 결정
(서브쿼리의 컬럼과 메인쿼리의 컬럼은 반드시 데이터 타입이 같아야 함, 대부분의 컬럼이름 같은경우가 대부분)
 서브쿼리의 결과가 하나냐 또는 여러개냐에 따라 사용하는 연산자가 달라져야 한다(1 → 단일연산자, 복수 → 복수연산자)
select last_name, job_id, salary
from employees
where job_id =  (select job_id
            from employees
            where employee_id = 141)
and salary > (select salary
            from employees
            where employee_id = 143)


 select last_name, job_id, salary
 from employees
 where salary = (select min(salary)
           from employees)

select last_name, salary
from employees
where department_id = (select department_id
			from departments
			where department_name = 'IT')





서브 쿼리의 결과 30, 40

10,20,30,40,50,60

in (30, 40) → 30, 40

> all (결과 전부보다(최대값 40) 큰 값 ⇒ 50, 60

< all (결과 전부보다(최소값 30)  보다 작은 값 ⇒ 10, 20

> any(최소값(30)보다 큰 값 ⇒ 40,50,60

< any(최소값(40)보다 작 은 값 ⇒ 10,20,30

