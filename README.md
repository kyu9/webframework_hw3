# 					웹프레임워크 과제 3

### 																								1692116	

### 																									심규도

1. 본인이 수강신청한 교과목을 MySQL에 저장한다.

---

subject 스키마에 mysubject table에 

수강년도(year) / 학기(semester) / 교과목명(subname) / 교과구분(subtype) / 담당교수(professor) / 학점(score) 형태로 저장해둠 -> subject로 등록한 총 데이터는 프로젝트의 src/main/subject.txt에도 따로 저장

![db1](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\db1.PNG)

2. 웹 페이지의 구성도

---

![tree](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\tree.png)



3. 단계별 설명

---

### /로 처음 웹페이지에 접속

**/ 에서 시작을 하게 되고 HomeController에서 home.jsp로 매핑해주고 있으며, security-context에서는 권한을 permitAll로 줘서 모두가 접근할 수 있도록 했다.  home.jsp에서는 /info로 통하는  a 태그가 있다.**

- /로 접속시 보이는 초기화면

![2-1](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\2-1.PNG)





 로그인되어있다면 로그아웃할 수 있도록 로그아웃 a 태그를 출력 조건문을 사용하기 위해서 JSTL-c:if태그를 사용

/info로 접근하기 전에 security-context에서 /info는 

```java
		<intercept-url pattern="/info"
			access="hasRole('ROLE_USER')" />
```

이렇게 ROLE_USER권한이 있는 사람만이 사용 가능하게 되어있다. 



그렇게 넘어온 곳은  /login이다. 

![2-2](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\2-2.PNG)

**/login은 loginController에서 login.jsp로 매핑해주고 있으며 security-context에서는 / 와 똑같이 permitAll 권한을 주었다.**

사용자를 테스트 하기 위해서 MySQL의 subject스키마의 users 테이블에 사용자 alice와 bob을 만들었다. 

![db2](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\db2.PNG)

그리고 사용자에 대한 권한을 subject스카마의 authorities에 저장해두었다.

![db3](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\db3.PNG)

**그리고 앞으로 /info, /assign, /detail, /info/s[n]등 db에 접속해서 정보를 읽어오는 페이지들은 모두 ROLE_USER권한을 가진 사용자가 접근할 수 있도록 해두었다.**

ROLE_ADMIN권한을 가지고 있는 alice는 로그인 하지 못하는 것을 알 수 있다.

![alice_login](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\alice_login.PNG)

![alice_fail](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\alice_fail.PNG)

logout이나 로그인 시도 정보가 db와 불일치되면 안내 메시지가 나타난다.

![alice_sad](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\alice_sad.PNG)



bob-bobpw를 이용해서 로그인을하게되면 메인페이지( / )로 돌아가게 된다.

그러면 정상적으로 로그인되었으니까 Logout태그가 나타나게 된다.

![login_succ](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\login_succ.PNG)

---

## 다시 /info(학점 조회 사이트로 이동)으로 넘어가면 

SubjectController에서 info.jsp로 매핑해주고 있으며,  어떤 년도, 어떤 학기에 수강했던 총 학점의 합계를 계산하기 위해서 

SubjectDao에 연도와 학기를 인자로 넣어주면 해당 연도, 해당 학기에 수강했던 과목들의 총 학점의 합계를 계산하는 sql을 가진 함수를 만들어 주었다.

```java
public int getYSscore(int year, int semester) {
			String sqlStatement = "select distinct sum(score) from mysubject where year=? && semester=?; ";
			return jdbcTemplate.queryForObject(sqlStatement, new Object[] {year, semester}, Integer.class);
		}
```

이후 SubjectService를 통해서 SubjectController에서 사용했다.

 **다시 SubjectController에서 [연도 + 학기] 로 짝을 지어서 위 함수를 이용해서 값을 db에서부터 가져왔고, addAttribute로 각 값들을 info.jsp로 넘겨주었다.**

그리고 마지막의 총계는 addAttribute로 넘겨준 값들을 모두 더해서 표현했다.

![info](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\info.PNG)

---

### 링크를 클릭하면 

해당 년도, 학기에 수강했던 모든 과목들을 볼 수 있게 한다.

링크를 클릭하게 되면 /info/s[숫자] 라는 링크로 넘어가게 되고, 이는 /info와 같은 SubjectController에서 detail.jsp 으로 매핑해준다. 

이번에도 SubjectDao에 연도와 학기를 넣어주면 해당 학기에 수강했던 과목들을 List형식으로 db에서 read해주는 함수를 생성했다.

```java
		public List<Subject> getYSsubjects(int year, int semester){
			String sqlStatement = "select * from mysubject where year=? && semester=?;";
			return jdbcTemplate.query(sqlStatement, new Object[] {year, semester}, new RowMapper<Subject>() {

				@Override
				public Subject mapRow(ResultSet rs, int rowNum) throws SQLException {
					Subject sub = new Subject();
					sub.setYear(rs.getInt("year"));
					sub.setSemester(rs.getInt("semester"));
					sub.setScore(rs.getInt("score"));
					sub.setSubname(rs.getString("subname"));
					sub.setSubtype(rs.getString("subtype"));
					sub.setProfessor(rs.getString("professor"));
				
					return sub;
				}
			});		
		}
```

**info와 같이 SubjectService를 통해서 Controller에서 연도와 학기를 넣어주면 해당 연도, 학기에 수강했던 과목들을 db에서 list형식으로 가져오고 그것을 detail.jsp에 넘겨주는 방식이다.** 

- detail.jsp는 수강 신청 조회 메뉴에서도 사용될 예정
- 순서대로 2020년 2학기, 2020년 1학기 링크를 클릭하게 되면 보이는 페이지

![details](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\details.PNG)

![details2](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\details2.PNG)

---

## 수강 신청하기 메뉴로 들어갔을때

**수강신청을 구현하기 앞서, 지금까지의 db에 접속은 read에 해당했지만 수강신청은 create에 해당하기 때문에 따로 AssignController와 AssignService를 생성해주었다.**

- assign.jsp에서는 form tag lib(sf:form, sf:input, sf:error)을 사용해서 csrf토큰을 사용하지 않아도 된다.

- AssignController에서는 hibernate-validater를 사용해서 검증 작업을 거치도록 했다.
  - model/subject에서 원하는 조건과 에러 메세지를 작성해주었다.

    - ```java
      public class Subject {
      	private int year;
      	private int semester;
      	@Size(min=2, max=20, message="과목이름은 2글자에서 20글자 사이로 입력해주세요!")
      	@NotEmpty(message="과목이름은 필수입력입니다!")
      	private String subname;
      	@Size(min=1, max=5, message="교과구분명은 줄인말로 2글자로 적어주세요!")
      	private String subtype;
      	@Size(min=2, max=20, message="교수님 성함은 2글자에서 20글자 사이로 입력해주세요!")
      	private String professor;
      	private int score;
      }
      
      ```

- assign.jsp에서 sf:form의 sf:input에 입력한 값들이 위에서 작성한 조건이 맞는다면 @Valid, 즉 유효한 Subject객체가 넘어오고, BindingResult에 결과값이 들어간다. 

  - 만약 유효하지 않은 Subject객체가 넘어온다면 (= 원하는 조건에 맞지 않는 값들이 나온다면) BindingResult에 에러가 작성되게 되고 그 에러를 print해준다. 그리고 assign.jsp에서도 sf:error작업이 들어가서 model/subject에서 설정해둔 에러들이 출력되게 된다.

- 처음 insert페이지일때

- ![insertb](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\insertb.PNG)

- model/subject에서 지정해둔 조건에 충족되지 않은상태에서 수강신청을 눌렀을때, sf:error에서 미리 설정해두었던 에러메세지가 출력
- ![insert](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\insert.PNG)

- 정상적으로 입력(정상적으로 입력되었을때 Controller에서 그냥 /info로 리턴해주면 총점 값들이 없었기 때문에 redirect: 방식을 사용)
- ![inserts](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\inserts.PNG)

**insert과정에서 한글은 깨져서 db에 들어가는 현상 -> web.xml에 encodingfilter(utf8)을 필터들의 맨 앞으로 빼줌으로써 해결했다.**

---

### 수강 신청 조회

/detail 을 SubjectController에서 매핑해주고 /info/s[숫자] (=detail)에서 사용했던  연도/학기을 넣어주면 해당 연도-학기에 수강하는 과목들을 List로 반환해주는 함수를 재사용했고, detail.jsp또한 재사용했다.

- crud중 read부분인 상세보기와 같은 read부분이기 때문에 재사용하는 방식을 사용해서 진행
- insert에서 입력했던 2021 / 1 / AWS에 대해서 / 전선 / 나는교수 / 3 데이터가 정상적으로 db에 입력되었고 

![as](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\as.PNG)

- 출력도 성공적으로 이루어짐

![signdetail](C:\Users\kyudo\OneDrive\바탕 화면\새 폴더\signdetail.PNG)