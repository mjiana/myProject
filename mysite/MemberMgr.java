package mysite;

import java.util.*;
import mysite.*;
import java.sql.*;

//DAO
public class MemberMgr {
	private DBConnectionMgr pool = null;
	
	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			System.out.println("커넥션 실패 : "+e);
		}
	}//생성자 end
	
	//ID중복체크
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean checkCon = false;
		
		try {
			con = pool.getConnection();
			String strQuery = "select id from mymember where id = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			checkCon = rs.next();
		} catch (Exception e) {
			System.out.println("Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return checkCon;
	}//checkId end
	
	//거주지 시/도 불러오기
	public List selectCity() {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		
		try {
			con = pool.getConnection();
			String strQuery = 
					"select distinct city from address order by city asc"; //
			stmt = con.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next()) {
				AddressBean addrBean = new AddressBean();
				addrBean.setCity(rs.getString("city"));
				list.add(addrBean);
			}//while end
		} catch (Exception e) {
			System.out.println("selectCity Exception : "+e);
		} finally {
			pool.freeConnection(con, stmt, rs);
		}
		return list;
	}
	
	//거주지 구 불러오기
	public List selectDistrict(String addr) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		
		try {
			con = pool.getConnection();
			String strQuery = 
					"select distinct district from address where city = ?  order by district asc";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, addr);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddressBean addrBean = new AddressBean();
				addrBean.setDistrict(rs.getString("district"));
				list.add(addrBean);
			}//while end
		} catch (Exception e) {
			System.out.println("selectCity Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	//거주지 전체 불러오기
	public List selectAddress() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		
		try {
			con = pool.getConnection();
			String strQuery = 
					"select * from address";
			pstmt = con.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddressBean addrBean = new AddressBean();
				addrBean.setCity(rs.getString("city"));
				addrBean.setDistrict(rs.getString("district"));
				list.add(addrBean);
			}//while end
		} catch (Exception e) {
			System.out.println("selectCity Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	//회원가입 메서드
	public boolean memberInsert(SignBean sBean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			String strQuery = "insert into mymember values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, sBean.getMid() );
			pstmt.setString(2, sBean.getMpw() );
			pstmt.setString(3, sBean.getMname() );
			pstmt.setString(4, sBean.getMemail() );
			pstmt.setString(5, sBean.getMphone() );
			pstmt.setString(6, sBean.getMaddress() );
			pstmt.setString(7, sBean.getMtrans() );
			pstmt.setString(8, sBean.getMbirth() );
			pstmt.setString(9, sBean.getMgender() );
			int count = pstmt.executeUpdate();
			
			if(count > 0) flag = true;
 		} catch (Exception e) {
			System.out.println("memberInsert Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//로그인 체크
	public boolean loginCheck(String id, String pw) {
		Connection con = null; //DB서버와 연동정보 저장객체
		PreparedStatement pstmt = null; //쿼리 작성 및 실행객체
		ResultSet rs = null; //select문 쿼리 실행 및 결과처리 객체 
		boolean loginCon = false;//함수 반환값
		
		try {
			con = pool.getConnection(); //DBCP의 pool에 저장된 드라이버 로딩
			String strQuery = "select id,pw from mymember where id=? and pw=?"; //select 쿼리문
			pstmt = con.prepareStatement(strQuery); //쿼리를 미리 컴파일 한다.
			pstmt.setString(1, id);//동적 데이터값 설정
			pstmt.setString(2, pw);//동적 데이터값 설정
			rs = pstmt.executeQuery(); //쿼리 실행
			loginCon = rs.next(); //값이 있다면 true 반환
		} catch (Exception e) {
			System.out.println("loginCheck Exception : "+e); //오류발생 시 출력되는 메시지
		} finally {
			pool.freeConnection(con, pstmt, rs); //pool 반환
		}
		return loginCon; //반환값
	}
	
	//회원정보 불러오기
	public SignBean memberView(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SignBean rb = new SignBean();
		
		try {
			con = pool.getConnection();
			String strQuery = "select * from mymember where id=?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rb.setMid(rs.getString("id"));
				rb.setMname(rs.getString("name"));
				rb.setMemail(rs.getString("email"));
				rb.setMphone(rs.getString("phone"));
				rb.setMaddress(rs.getString("address"));
				rb.setMtrans(rs.getString("trans"));
				if(rs.getString("birth") != null) rb.setMbirth(rs.getString("birth"));
				if(rs.getString("gender") != null) rb.setMgender(rs.getString("gender"));
			}
		} catch (Exception e) {
			System.out.println("memberView Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rb;
	}
}
