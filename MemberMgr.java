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
			String strQuery = "select id from member where id = ?";
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
		public Vector selectCity() {
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;
			Vector vecList = new Vector();
			
			try {
				con = pool.getConnection();
				String strQuery = 
						"select distinct city from address"; //
				stmt = con.createStatement();
				rs = stmt.executeQuery(strQuery);
				while(rs.next()) {
					AddressBean addrBean = new AddressBean();
					addrBean.setCity(rs.getString("city"));
					vecList.add(addrBean);
				}//while end
			} catch (Exception e) {
				System.out.println("selectCity Exception : "+e);
			} finally {
				pool.freeConnection(con, stmt, rs);
			}
			return vecList;
		}
	
	//������ �� �ҷ�����
	public Vector selectDistrict(String addr) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			con = pool.getConnection();
			// ?�� ����� �� ����. stmt�� ����ص� ����
			String strQuery = 
					"select distinct district from address where city = ?";
			pstmt = con.prepareStatement(strQuery);
			pstmt.setString(1, addr);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AddressBean addrBean = new AddressBean();
				addrBean.setDistrict(rs.getString("district"));
				vecList.addElement(addrBean);
			}//while end
		} catch (Exception e) {
			System.out.println("selectCity Exception : "+e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vecList;
	}
	
}
