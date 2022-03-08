연산자
의미
BETWEEN
…AND…
두 값 사이(지정한 값 포함)
IN(set)
값 목록 중의 값과 일치
LIKE
문자 패턴 일치, 일부만 알고 있을 때
IS NULL
널 값




급여가 2500 이상이고 2500 이하
select last_name, salary
from employees
where salary between 2500 and 3500


select last_name, salary
from employees
where hire_date between '2015/01/01' and '2015/12/31'

select last_name, salary
from employees
where last_name between 'A' and 'Z'

between 모든 data type에 대해 적용가능, 주로 숫자, 날짜에 사용

IN :  복수 연산자, 중복 데이터가 많으면 성능적으로 떨어진다

100번 다 찾고 101번 다 찾고  201번 찾는다

select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201)


 06년도에 입사한 사원을 찾으세요
select last_name, hire_date
from employees
where hire_date like '06%'
 column의 데이터 형식을 따라서 입력해줘야 찾을 수 있다!!


앞에서 두번째 알파벳 o 인 이름을 가진 사원을 찾으세요
select last_name
from employees
where last_name like '_o%'

 like % _  연산자 안에서만 기능을 수행

 매니저 아이디 null 값 찾아라
select last_name, manager_id
from employees
where manager_id is null


보너스를 받지 않는 사원
select last_name, job_id, commission_pct
from employees
where commission_pct is null



연산자
의미
AND
모두 TRUE 면 TRUE 반환
OR
하나라도 TRUE 면 TRUE
NOT
뒤에오는 조건이 FALSE면
TRUE 반환


select last_name, salary
from employees
where department_id = 90
and salary >= 5000


select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
and job_id like '%MAN%'




select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
or job_id like '%MAN%'

where job_id not in
where salary not between
where last_name not like
where commission_pct is not null


 이렇게 쓰는 방법도 있지만 좋은 방법은 아니다
select employee_id, last_name, job_id, salary
from employees
where not salary >= 10000

급여가 15000 이상이고 job_id가 ad_pres 이거나 job_id가
sa_rep 인 사람

AND 와 OR 같이 실행되면 AND 먼저 실행!!
() 모든 연산에서 우선순위




select employee_id, last_name, salary*12 annsal
from employees
order by annsal


컬럼이름 default 가 대문자 이니까 select 에서 바꾸면
order by 에서도 함께 바꿔줘야 한다.
select employee_id, last_name, salary*12 "annsal"
from employees
order by "annsal"


두번째 컬럼을 기준으로 오름차순 정렬
!! 안좋은 방법!!
select last_name, salary, hire_date
from employees
order by 2



 같은 dep_id 중에서 내림차순으로 정렬

select last_name, department_id, salary
from employees
order by department_id, salary desc



!!! 정렬은 되도록 안하는게 좋다!!!
!!! 시스템 성능 저하시키는 가장 큰 원인 !!!


