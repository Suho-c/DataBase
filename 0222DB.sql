select * column
from table_name

<null 값 계산>
select last_name,  salary*12*nvl(commission_pct, 1) as annual
from employees
/

<컬럼이름 변경>
select last_name “Name”

<중복제거> distinct
select distinct department_id
from employees




테이블 구조 살피기
desc table_name


select distinct  *  column alias


부서 90의 모든 사원 검색
select last_name, salary
  2  from employees
  3  where department_id=90;

from 절
where 절
select

where 절 뒤에
반드시 조건문이 명시 => col 연산자 값
값을 명시할때 문자, 날짜 값은 반드시 ‘ ’ 구분
값을 명시할때 반드시 table에 저장된 data 형식 그대로 사용

연산자
의미
=
같다
>
크다
>=
크거나 같다
<
작다
<=
작거나 같다
<>, !=
다르다




select last_name, salary
  2  from employees
  3  where salary <= 3000;
월급이 3000 보다 작거나 같은 직원의 이름과 월급을 출력해라.


연봉이 150000 이상인 사원의 이름과 연봉을 구하시오.

select last_name, salary*12
  2  from employees
  3  where salary*12 >= 150000;


