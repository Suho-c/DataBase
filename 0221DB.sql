무결성 1. 컬럼의 구조에 맞는 데이터 저장
          2. 기본키, 외부키 -> 제약조건


니디
테이블 -  단위. 표와 구조, 열과 행구성

컬럼 - 열,

기본키 : 컬럼들 중에 테이블을 대표하는 컬럼에 설치, 학번, Not null + Unique

외부키 : 다른 테이블의 컬럼(데이터)을 참조할때, 테이블과 테이블의 관계 설정



SQL(Structured Query Language) : 관계형 데이터베이스를 사용하기 위한
                                              ANSI(American National Standrards Institute) 표준어



1. 정보처리기사

2. SQLD
   (15~20장) 고급기능

* SQL Plus -> SQ 명령 입력 => 결과 출력(편집기)
★ conn hr/hr 수업전 항상 미리 접속 !!! ★

desc(테이블 구조 확인) departments (부서들의 데이터)
DEPARTMENT_ID  -> 부서번호(PK)
DEPARTMENT)NAME -> 부서이름
MANAGER_ID -> 부서를 관리하는 부서장의 사원번호
LOCATION_ID -> 부서가 위치한 지역의 번호(FK)-> Location table 
                                                          Location column 참조

EMPLOYEES -> 부서에 근무하는 사원들의 data
Employee_ID -> 사원번호(PK)
Hire_date -> 입사한 날짜
JOB_ID-> 현재 수행하고 있는 업무
SALARY -> 월 급여
COMISSION_PCT-> 보너스 값
MANAGER_ID -> 나를 관리하는 관리자(사수)의 사원번호
DEPARTMENT_ID -> 내가 근무하고 있는 부서번호(FK) ->  
                                                         DEPARTMENT TABLE					         DEPARTMENT_ID COLUMNS 참조

SELECT =>  데이터 가져와서 활용
             	   테이블에 접근해서 해당 데이터 가져와서 결과를 확인

selection -> all column data 검색
projection -> 특정 column data 검색
join -> 여러개의 table data 검색




select  column_name              -> select list절 
 => 내가 보고자 하는 data를 소유한 c_name =>        
 => ★ 명시가된 column data가 결과 출력 ★
from  table_name


지켜야 할 것!!

1. code 작성. 실행x
2. code 해석
3. 결과 예측
4. code 실행
5. 결과 비교/분석

select *(all columns)
from departments;

*수정할 때* 
ed


column_name => 열머리글


type => 구조
number(4) => 숫자로 저장하고 최대 4글자



column (SQL Plus 편집명령어 => 출력이 되는 화면 수정
데이터자체 수정이 아니고 보이는 것 보기좋게 화면 조정


column dapartment_name format a20(최대 20자까지 줄이겠다)
format a(문자/날짜만 사용)
format 9(갯수만큼 숫자자리수표현)

column deparment_name clear(초기화)

테이블에서 데이터 관리단위 => 행 단위

27개 행 => 27개 부서



select list 절에 어떤 컬럼을 작성 결정


원하는 것만 나열

select last_name, salary
  2* from employees;

column last_name format a20

27개의 부서
직원수가 107명

parse 1. 검증
        2. 실행계획 => table 로부터 data 가져오는 방법
        3. 실행 => 출력


select last_name, hire_date, salary
from employees;


열머리글 => 항상 대문자 출력




select last_name, salary, salary*12
from employees
/

select 트랜잭션에 영향을 주는 언어가 아니다


select last_name, salary, salary*12, salary+salary
from employees


산술연산을 쓸 때
숫자 = O
문자 = X
날짜 = △(일수 +, -)



null 에 대한 산술연산은 무조건 null 값이다 !



select last_name, salary, salary*12* nvl(commission_pct,1)
from employees
/
nvl(null value language)

nvl(column, 대체값)
column에 null 값이 존재하면 대체값 출력

select * column
from table_name


