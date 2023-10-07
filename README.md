# 💚nctminiproject💚

# 🚩 Overview
> NCT가 누구야? 유명한 사람들이지~
> 
엔시티를 소개하고 회원들끼리 서로 의견을 나눌 수 있는 사이트를 만들었습니다.

# 👀 Project
## 프로젝트 아키텍쳐

## 기술스택
#### FE
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">

#### BE
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

#### TOOLS
Flow <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> 

IDE <img src="https://img.shields.io/badge/eclipse ide-2C2255?style=for-the-badge&logo=eclipse ide&logoColor=white">

Design <img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white">

## ERD
![image](https://github.com/simidot/nctminiproject/assets/114278754/54fcc3d5-afed-4b27-9762-2b14da8abea9)

## 와이어 프레임
![image](https://github.com/simidot/nctminiproject/assets/114278754/806cf5d0-b14e-47bc-96bd-64e00adb88f5)
![image](https://github.com/simidot/nctminiproject/assets/114278754/d9302fe2-c899-4055-8f0c-1d96dac8d6fb)
![image](https://github.com/simidot/nctminiproject/assets/114278754/078e685d-b0c2-4dee-bcb7-00fe2c6c8527)


## 📍 주요 기능
### 유저(회원) 권한
로그인 기능

회원가입 기능

멤버 정보 조회

멤버 검색

멤버별 댓글 조회 및 작성/수정/삭제 

### 관리자 권한
전체 멤버 조회 및 관리

전체 회원 조회 및 관리

멤버 등록


## 💊 트러블 슈팅

1. 삽입 SQL 시퀀스 데이터 무결성 제약조건 위반
  1) 문제발생 상황 : nct 멤버 insert 삽입 SQL문에 두 개의 컬럼에 시퀀스 값을 넣어야 함. 그래서 value값에 시퀀스.nextval과 currval을 각각 넣었다.
	```
<!-- nctmembers 기본 정보 추가 -->
	<insert id="insertMember" useGeneratedKeys="true" keyProperty="memberId" keyColumn="memberId">
	   INSERT INTO nctmembers (memberId, name, birthdate, nationality, position, mbti, image, regdate)
	   VALUES (NCTMEMBERS_SEQ.NEXTVAL, #{name}, #{birthdate}, #{nationality}, #{position}, #{mbti}, #{image}, SYSDATE)
	</insert>
	<!-- nctgroups 그룹 정보 추가 -->
	<insert id = "insertGroupsForMember" parameterType = "java.util.List">
	INSERT INTO nctgroups (groupId, memberRefId, groupName) 
		SELECT NCTGROUPS_SEQ.NEXTVAL, #{memberId}, A.* FROM (
			<foreach collection = "groupList" item = "group" separator = "UNION ALL">
			SELECT #{group} FROM DUAL
			</foreach>) A
	</insert>
   ```
  3) 
2. 
3. 

| 단계  | 설명                                    |
| ---------- | ---------------------------------------------- |
| **문제발생 상황** |nct 멤버 insert 삽입 SQL문에 두 개의 컬럼에 시퀀스 값을 넣어야 함. 그래서 value값에 시퀀스.nextval과 currval을 각각 넣었다.<br><!-- Insert member --><br><insert id="insertMember">
     INSERT INTO nctmembers (memberId, name, birthdate, nationality, position, mbti, image, regdate)
     VALUES (NCTMEMBERS_SEQ.NEXTVAL, #{name}, #{birthdate}, #{nationality}, #{position}, #{mbti}, #{image}, SYSDATE)
   </insert>

<!-- Insert groups for member -->
   <insert id="insertGroupsForMember">
      <foreach collection="groupList" item="group" index="index" separator=",">
          INSERT INTO nctgroups (groupId, groupName, memberRefId)
          VALUES (NCTGROUPS_SEQ.NEXTVAL, #{group}, NCTMEMBERS_SEQ.CURRVAL)
       </foreach>
   </insert>
> 그러나, 지속적으로 DataIntegrityViolationException 혹은 DuplicateKeyException 발생              |
|**문제발생 원인**   | Show file differences that haven't been staged |
