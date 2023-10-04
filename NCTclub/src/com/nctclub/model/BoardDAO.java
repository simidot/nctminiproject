package com.nctclub.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	// DB에 연결하기 위해 Connection 객체 생성
	public void getConnection() {
		System.out.println("getConnection");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "hr";
		
		try {
			// 드라이버 로딩 (oracleDriver.class를 찾아서 로딩)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DriverManager 객체에 의해서 관리
			conn = DriverManager.getConnection(url,user,pw);
			System.out.println("데이터 베이스 연결!!");
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}
	
	public int boardInsert(BoardDTO dto) {
		String sql = "INSERT INTO board2(name,email) values(?,?) ";
		getConnection();
		
		int cnt =-1;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,dto.getName());
			ps.setString(2,dto.getEmail());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
		e.printStackTrace();
		}finally {
		dbClose();
	}
		return cnt;
	}
		
		
	// 회원가입
//	public int userInsert(UserDTO dto) {
//		String sql = "INSERT INTO ";
//				sql += "member2(no,id,pw,name,age,email,phone) ";
////				sql += "member(no,id,pw,name,age,email,phone) ";
////				sql += "values(?,?,?,?,?,?,?)";
//				sql += "values(mem_seq.nextVal,?,?,?,?,?,?)";
//				
//		//Connection 객체 생성
//		getConnection();
//		
//		int cnt = -1;
//		
//		try {
//			ps = conn.prepareStatement(sql);
//			
//			// 사용자가 입력한 값으로 ? 셋팅 
////			ps.setInt(1,dto.getNo());
//			ps.setString(1,dto.getId());
//			ps.setString(2,dto.getPw());
//			ps.setString(3,dto.getName());
//			ps.setInt(4,dto.getAge());
//			ps.setString(5,dto.getEmail());
//			ps.setString(6,dto.getPhone());
//			
//			// sql문 전송, sql문이 정상적으로 수행되면 0보다 큼
//			cnt = ps.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			dbClose();
//		}
//		
//		
//		return cnt;
//		}
//	
//		
//	// 회원리스트 가져오기
//	public ArrayList<UserDTO> memberList() {
//				
//				ArrayList<UserDTO> list = new ArrayList<UserDTO>();
//				String sql = "SELECT * FROM MEMBER2";
//				
//				
//				//Connection생성
//				getConnection();
//				
//				try {
//					ps = conn.prepareStatement(sql);
//					rs = ps.executeQuery(); // select -- > executeQuery() ResultSet 리턴,  나머지 dml은 excuteUpdate()
//					
//					
//					//레코드의 갯수만큼 반복
//					while(rs.next()) { // rs.next() : 다음 레코드(행)가 존재하면 True, Cursor(레코드를 가르키는 포인터)이동  
//									//rs.get+칼럼타입("컬럼명");
//						int no = rs.getInt("no");
//						String id = rs.getString("id");
//						String pw = rs.getString("pw");
//						String name = rs.getString("name");
//						int age = rs.getInt("age");
//						String email = rs.getString("email");
//						String phone = rs.getString("phone");
//						
//						//dto로 모아서 담는다.
//						UserDTO dto = new UserDTO(no,id,pw,name,age,email,phone);
//						
//						// ArrayList에 담기
//						list.add(dto); // 회원수만큼 list 담는 처리
//						
//					}
//					
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}finally {
//					dbClose();
//				}
//				
//				return list;
//			}
//		
//		
//	// 회원정보 가져오기
//	public UserDTO memberInfo(int no) {
//
//		
//		String sql = "SELECT * FROM member2 WHERE no = ?";
//		getConnection(); //커넥션 객체 생성
//		
//		UserDTO dto = null;
//		
//		try {
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, no);
//			rs = ps.executeQuery();
//			
//			//한회원에 대한 정보만 가져옴 따라서 while문은 필요없음.
//			//ArrayList에 담을 필요도 없음
//			if(rs.next()) {
//				
//				no = rs.getInt("no");
//				String id = rs.getString("id");
//				String pw = rs.getString("pw");
//				String name = rs.getString("name");
//				int age = rs.getInt("age");
//				String email = rs.getString("email");
//				String phone = rs.getString("phone");
//				
//				//dto로 모아서 담기
//				dto = new UserDTO(no,id,pw,name,age,email,phone);
//				System.out.println("회원정보 : " + dto);
//				
//			}
//			
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}finally {
//			dbClose();
//		}
//		
//		return dto;
//	}
//	
//	// 회원 삭제
//	public int deleteMember(int no) {
//
//		
//		String sql = "DELETE FROM member2 WHERE no = ?";
//		getConnection();
//		int cnt = -1;
//		
//		try {
//			ps  = conn.prepareStatement(sql);
//			ps.setInt(1,no);
//			
//			cnt = ps.executeUpdate();
//			
//			
//			
//		} catch (SQLException e) {
//			
//			e.printStackTrace();	
//		}finally {
//			dbClose();
//		}
//		
//		return cnt;
//	}
//	
//	
//	// 회원 수정
//	public int memberUpdate(UserDTO dto) {
//		String sql = "UPDATE member2 SET age = ?, email=?, phone=? where no = ?";
//		getConnection();
//		
//		int cnt = -1;
//		
//		try {
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, dto.getAge());
//			ps.setString(2, dto.getEmail());
//			ps.setString(3, dto.getPhone());
//			ps.setInt(4, dto.getNo());
//			
//			cnt  = ps.executeUpdate();
//			
//			
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			dbClose();
//		}
//		
//		return cnt;
//	}
	
	
	
	// 자원 반납, db 접속 종료 
 	public void dbClose() {
				
					try {
						if(rs!= null) rs.close();
						if(ps!= null) ps.close();
						if(conn!= null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}

}
