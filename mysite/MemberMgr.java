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
			System.out.println("Ŀ�ؼ� ���� : "+e);
		}
	}//������ end
	
	//ID�ߺ�üũ
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
	
	//������ ��/�� �ҷ�����
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
	
	//������ �� �ҷ�����
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
	
	//������ ��ü �ҷ�����
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
	
	//ȸ������ �޼���
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
	
	//�α��� üũ
	public boolean loginCheck(String id, String pw) {
		Connection con = null; //DB������ �������� ���尴ü
		PreparedStatement pstmt = null; //���� �ۼ� �� ���ఴü
		ResultSet rs = null; //select�� ���� ���� �� ���ó�� ��ü 
		boolean loginCon = false;//�Լ� ��ȯ��
		
		try {
			con = pool.getConnection(); //DBCP�� pool�� ����� ����̹� �ε�
			String strQuery = "select id,pw from mymember where id=? and pw=?"; //select ������
			pstmt = con.prepareStatement(strQuery); //������ �̸� ������ �Ѵ�.
			pstmt.setString(1, id);//���� �����Ͱ� ����
			pstmt.setString(2, pw);//���� �����Ͱ� ����
			rs = pstmt.executeQuery(); //���� ����
			loginCon = rs.next(); //���� �ִٸ� true ��ȯ
		} catch (Exception e) {
			System.out.println("loginCheck Exception : "+e); //�����߻� �� ��µǴ� �޽���
		} finally {
			pool.freeConnection(con, pstmt, rs); //pool ��ȯ
		}
		return loginCon; //��ȯ��
	}
	
	//ȸ������ �ҷ�����
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
