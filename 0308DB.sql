-- 회사의 평균급여보다 더 많은 급여를 받는 사원의 이름과 급여를 출력하시오.

회사의 평균급여  더 많은 급여 비교

서브쿼리 먼저 작성!!


select last_name, job_id, salary
from employees
where job_id = (select job_id
					from employees
					where employee_id = 141)
and salary > (select salary
				from employees
				where employee_id = 143)
/

-- 회사의 평균급여보다 더 많은 급여를 받는 사원의 이름과 급여를 출력하시오
select last_name, salary
from employees
where salary >  (select avg(salary)
					from employees)
					
					
select employee_id, last_name, job_id, salary
from employees
where salary > any(select salary
						from employees
						where job_id = 'IT_PROG')
and job_id <> 'IT_PROG';

> any 최대보다 작다
< any 최소보다 크다

--  DML(Data Manipulation Languege)
-- 삽입(inert), 수정(update), 삭제(delete)
-- rollback, commit, savepoint

1. insert into
	values
	
	into 명시된 column 순서, 개수, datatype
	values 명시된 값 1:1 매칭!!
	
	무결성	-- column 무결성
		-- 제약조건 무결성
	** 한 번에 한 행만 추가된다 **
	
2. update
	set
	
	update employees
	set department_id = 70
	where employee_id = 113;


3. delete
	
	delete from departments
	where department_name = 'Finance';
	



프라이머리키(PK)는 중복을 허용하지 않는다


트랜잭션 테이블에서 실행되는 작업


병행제어 --> 동시의 하나의 테이블에 여러 트렌젝션이 일어났을때 보호해주는 역할
		전 작업이 끝날때 까지 lock 이 걸리고
		전 작업이 끝나기 전까지는  뒤에 작업이 실행 되지 않는다
		전 작업이 끝나야 뒤에 작업이 실행된다.
		
		
		
		
-- 테이블 생성
1. table_name
2. col_name
3. datatype
4. data 길이


create table dept(
				  deptno number(2),
				  dname varchar2(14),
				  loc varchar2(13));


-- DB 구현
1. table 생성
	create table

2. insert
	data 삽입

3. commit
	data 저장













-- 데이터 타입

varchar2(size) : 가변 길이 문자 데이터 (자리수 신중히 사용해야함, 
				실제 데이터 사이즈보다 20% 정도 크게 잡아서 사용)
char(size) : 고정 길이 문자 데이터 (자리수 신중히 사용해야함)
number : 가변 길이 숫자 데이터
date : 날짜 및 시간 값


hire_date timestamp(소수점 이하 초까지 있는 날짜로 저장)




table
view 
구조 ⇒ 저장공간 활용
가짜, 논리 table

⇒ 물리적 구조 x


Data Dictionary
⇒ table 구조 정보 저장
Data Dictionary
⇒ text 문장만 재실행






