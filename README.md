#  🍳Overview

> 💚nctminiproject💚 NCT 맴버를 좋아하는 사람들의 커뮤니티

아이돌 NCT 그룹의 멤버의 정보를 확인 가능 하고 👀

회원들끼리 서로 의견을 나눌 수 있는 커뮤니티 사이트 입니다~❤

#  🚩Project

### SKILL
**[Front-end]**  
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white" /> 

**[Back-end]**   
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white"> <img src="https://img.shields.io/badge/MyBatis-%232BA9E1.svg?style=for-the-badge&logoColor=white" /> 

**[Tool & Environment]**  
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/eclipse ide-2C2255?style=for-the-badge&logo=eclipse ide&logoColor=white"> <img src="https://img.shields.io/badge/figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white"> <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white" />

### ERD
![image](https://github.com/simidot/nctminiproject/assets/74632395/873f2013-46bb-42d4-809b-f65e0355cbe8)


### WIRE FRAME
![image](https://github.com/simidot/nctminiproject/assets/114278754/806cf5d0-b14e-47bc-96bd-64e00adb88f5)
![image](https://github.com/simidot/nctminiproject/assets/114278754/d9302fe2-c899-4055-8f0c-1d96dac8d6fb)
![image](https://github.com/simidot/nctminiproject/assets/114278754/078e685d-b0c2-4dee-bcb7-00fe2c6c8527)




### 기능 영상 

| (유저) 로그인 기능 | (유저) 회원가입 기능|
| :--------: | :--------: |
| ![로그인 GIF](https://github.com/simidot/nctminiproject/assets/114278754/480eb52c-f311-4422-b51e-f4524ba093e2)|![회원가입 기능](https://github.com/simidot/nctminiproject/assets/114278754/07d203a9-dc42-4ee5-8419-5d8003b94154)|
|**(유저) NCT 멤버 정보 조회**|**(유저) NCT 멤버 검색**|
|![유저 멤버상세보기](https://github.com/simidot/nctminiproject/assets/114278754/a26166d9-4086-447c-b009-f13565ebebbe)|![멤버 검색기능](https://github.com/simidot/nctminiproject/assets/114278754/2a9cde93-b653-4f80-ae83-f59cbe4b7fa5)|
|**(유저) 댓글 조회 및 작성/수정/삭제**|**(관리자) 전체 NCT멤버 조회 및 관리**|
|![유저 댓글기능](https://github.com/simidot/nctminiproject/assets/114278754/40a427ec-dd87-49d2-8f5a-74e387e10e5b)|![멤버 조회및 수정숨김 기능](https://github.com/simidot/nctminiproject/assets/114278754/36ad3d60-e686-4688-a6ac-9dc0f5c14a6c)|
|**(관리자) 전체 유저 조회 및 관리**|**(관리자) NCT멤버 등록**|
|![유저관리기능](https://github.com/simidot/nctminiproject/assets/114278754/1241ae72-3545-4639-9563-446fa4133c95)|![멤버등록 기능](https://github.com/simidot/nctminiproject/assets/114278754/bcb5d8c6-4867-4d6e-acc3-aa77144b4418)|


## 📍 주요 기능
### 유저(회원) 권한

1. **로그인 기능:**
   - 사용자는 자신의 계정에 로그인할 수 있으며, 로그인 이후에는 회원 전용 기능을 사용할 수 있다.

     **_(보안을 위해 Spring Security를 사용하여 인증 및 인가를 처리)_**

2. **회원가입 기능:**
    - 새로운 유저는 회원으로 등록할 수 있다.

      **_(회원가입 시, 시스템은 중복 회원 여부를 실시간으로 확인하여 중복 회원을 방지)_**

      **_(Daum API 를 활용해 주소 찾기)_**

3. **NCT 멤버 정보 조회:**
    - 사용자는 nct 맴버 정보를 조회할 수 있으며, 이를 통해 nct 맴버 프로필 및 정보를 확인할 수 있다.

4. **NCT 멤버 검색:**
    - 사용자는 nct 회원을 이름, 그룹을 검색하여 해당 회원의 프로필을 확인할 수 있다.

      **_(MYBATIS를 통한 동적 쿼리 사용)_**

5. **유저별 댓글 조회 및 작성/수정/삭제:**
    - 사용자는 다른 회원의 댓글을 조회하고, 자신의 댓글을 작성, 수정, 삭제할 수 있다.



### 관리자 권한

1. **전체 NCT멤버 조회 및 관리:**
    - 관리자는 전체 멤버를 조회하고 관리할 수 있다.

2. **전체 유저 조회 및 관리:**
    - 관리자는 전체 회원 목록을 조회하고 관리할 수 있다.

3. **NCT멤버 등록:**
    - 관리자는 새로운 멤버를 등록할 수 있다

      **_(프로필 이미지를 업로드하여 서버에 저장하고 해당 이미지를 멤버 프로필에 표시 가능)_**



## 🚀 참여자 : N사모 (23.09.18 ~ 23.10.09)

|<img src="https://github.com/simidot/nctminiproject/assets/74632395/69cc536e-5419-4463-85f2-5ef30f2b5feb" width="120" height="160"/><br/>BE 조솔하 <a href="https://github.com/josolha">GitHub</a>|<img src="https://github.com/simidot/nctminiproject/assets/74632395/fdd43849-ca33-4c55-ade2-1b362a0959cc" width="120" height="160"/><br/>BE 강유신 <a href="https://github.com/simidot">GitHub</a>|
|:---:|:---:|


## 💊 트러블 슈팅
## 1.[시큐리티 적용하기]
[시큐리티 적용하기 링크](https://josolha.tistory.com/30)
 
## 2.[데이터베이스 테이블에 여러 개의 레코드 삽입 시, 외래 키 시퀀스 중복 및 무결성 문제 해결 방법]
[시퀀스 중복 및 무결성 문제 해결 방법 링크](https://hehesim.tistory.com/41)

1. **Foreach 구문 적용**: 먼저, 여러 레코드를 삽입할 때 외래 키 시퀀스 중복 문제를 해결하기 위해 `foreach` 구문을 사용합니다. `foreach`를 사용하여 레코드를 반복적으로 삽입할 수 있습니다.

2. **시퀀스 `currval` 활용**: 외래 키로 사용되는 `memberId`를 가져올 때, 현재 시퀀스 값인 `currval`을 활용합니다. 이를 통해 현재 삽입된 레코드의 `memberId`를 가져올 수 있습니다.

3. **Generated Keys 사용**: 데이터베이스에서 생성된 키 값을 애플리케이션에서 가져오기 위해 `useGeneratedKeys` 설정을 활용합니다. 이 설정을 통해 데이터베이스가 생성한 `memberId` 값을 애플리케이션에서 쉽게 사용할 수 있습니다.

#### 삽입 SQL 문
Insert Member
```xml
<insert id="insertMember" useGeneratedKeys="true" keyProperty="id" keyColumn="memberId">
    INSERT INTO nctmembers (memberId, name, birthdate, nationality, position, mbti, image, regdate)
    VALUES (NCTMEMBERS_SEQ.NEXTVAL, #{name}, #{birthdate}, #{nationality}, #{position}, #{mbti}, #{image}, SYSDATE)
</insert>
<insert id="insertGroupsForMember" parameterType="java.util.List">
    INSERT INTO nctgroups (groupId, memberRefId, groupName)
    SELECT NCTGROUPS_SEQ.NEXTVAL, #{id}, A.* FROM (
        <foreach collection="groupList" item="group" separator="UNION ALL">
            SELECT #{group} FROM DUAL
        </foreach>
    ) A
</insert>
