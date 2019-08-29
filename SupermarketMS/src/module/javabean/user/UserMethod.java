package module.javabean.user;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import module.javabean.admin.Admin;

import conn.Conn;

public class UserMethod {

	/*
	public ResultSet judgeUser(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call JudgeUser(?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getPassword());		
		ResultSet rs = cs.executeQuery();
		return rs;
	}
	*/
	
	//用户的增删改查
	public List<User> selectAllUser(User user) throws SQLException{
		
		List<User> list = new ArrayList<User>();
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectAllUsers()}");
		ResultSet rs = cs.executeQuery();
		
		while(rs.next()){
			User user1=new User();
			
			user1.setMasterid(Integer.parseInt(rs.getString("id")));
			user1.setUsername(rs.getString("name"));
			user1.setPassword(rs.getString("password"));
			user1.setBdate(rs.getString("bdate"));
			user1.setLogin_num(Integer.parseInt(rs.getString("login_num")));
			user1.setTruename(rs.getString("truename"));
			user1.setSex(rs.getString("sex"));
			user1.setBirthday(rs.getString("birthday"));
			user1.setMobile(rs.getString("mobile"));
			user1.setEmail(rs.getString("email"));
			user1.setDept(rs.getString("dept"));
			user1.setPosition(rs.getString("position"));
			user1.setPosition_desc(rs.getString("position_desc"));
			user1.setOffice_phone(rs.getString("office_phone"));
			/*
			user1.setGroupid(Integer.parseInt(rs.getString("groupid")));
			user1.setCreatedate(rs.getString("createdate"));
			user1.setGroupname(rs.getString("groupname"));
			user1.setGroupinfo(rs.getString("groupinfo"));
			*/
			list.add(user1);
		}
		return list;
	}

	public ResultSet selectUserById(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectUserById(?)}");
			cs.setInt(1,user.getMasterid());
			ResultSet rs = cs.executeQuery();
			return rs;
	}
	
	public ResultSet selectUserByName(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectUserByName(?)}");
			cs.setString(1,user.getUsername());
			ResultSet rs = cs.executeQuery();
			return rs;
	}
	
	public ResultSet selectUserByTruename(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectUserByTruename(?)}");
			cs.setString(1,user.getTruename());
			ResultSet rs = cs.executeQuery();
			return rs;
	}

	public ResultSet selectUsername() throws SQLException {
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectAllUsername()}");
		ResultSet rs = cs.executeQuery();
		return rs;
	}
	
	public void insertUser(User user) throws SQLException {		

		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call InsertUser(?,?,?,?,?,?,?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getPassword());
		cs.setString(3,user.getBdate());
		cs.setString(4,user.getTruename());
		cs.setString(5,user.getSex());
		cs.setString(6,user.getBirthday());
		cs.setString(7,user.getMobile());
		cs.setString(8,user.getEmail());
        cs.execute();

	}
	

	public void delUser(User user) {
		
		try {
		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call DeleteUser(?)}");
		cs.setInt(1,user.getMasterid());
        cs.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void updateUser(User user){
		
		try {
		CallableStatement cs;
	    cs = new Conn().getConn().prepareCall("{call UpdateUser(?,?,?,?,?,?,?,?,?)}");
		cs.setInt(1,user.getMasterid());
		cs.setString(2, user.getUsername());
		cs.setString(3, user.getPassword());
		cs.setString(4, user.getTruename());
		cs.setString(5, user.getSex());
		cs.setString(6, user.getBdate());
		cs.setString(7, user.getBirthday());
		cs.setString(8, user.getMobile());
		cs.setString(9, user.getEmail());
		
        cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//根据用户id查组别id
	public ResultSet selectGroupid(int Masterid) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Conn con = new Conn();
		try {
			pstm = con.getConn().prepareStatement(
					"select * from mastergroup where masterid = ?");
			pstm.setInt(1, Masterid);

			rs = pstm.executeQuery();

		} catch (Exception e) {
			System.out.println("没有给予其组别");
		}
		return rs;
	}
	
	//根据组别id查询组别名
	public String selectGroupname(int Groupid){
		String groupname="错误";
	    PreparedStatement pstm = null;
        ResultSet rs = null;
        Conn con = new Conn();
        try{
        	System.out.print(Groupid);
            pstm = con.getConn().prepareStatement("select * from groupmanager where groupid = ?");
            pstm.setInt(1, Groupid);
            
            rs = pstm.executeQuery();
            

        if(rs.next()){
        	groupname=rs.getString("groupname").trim();
        }
        
        }catch(Exception e){
       	 System.out.println("请通知管理员,添加此Groupid:"+Groupid+"的组别内容");
       }
		return groupname;	
	}

	/*以下是组别的操作内容*/
	
	//查询组别
		public ResultSet selectGroupmanager() throws SQLException{
			
			CallableStatement cs=new Conn().getConn().prepareCall("{call SelectGroupmanager()}");
				ResultSet rs = cs.executeQuery();
				return rs;
		}
	
		//添加组别
	public void insertGroupmanager(User user) throws SQLException {		

		CallableStatement cs = null ;
		cs = new Conn().getConn().prepareCall("{call InsertGroupmanager(?,?)}");
		cs.setString(1,user.getGroupname());
		cs.setString(2,user.getGroupinfo());
        cs.execute();

	}
	
	//删除组别
	public void delGroupmanager(User user) throws SQLException {
		

		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call DeleteGroupmanager(?)}");
		cs.setInt(1,user.getGroupid());
        cs.execute();

	}

	
	//更新组别
	public void updateGroupmanager(User user){
		
		try {
		CallableStatement cs;
	    cs = new Conn().getConn().prepareCall("{call UpdateGroupmanager(?,?,?)}");
	    
		cs.setInt(1,user.getGroupid());
		cs.setString(2, user.getGroupname());
		cs.setString(3, user.getGroupinfo());

        cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//赋予组别
	public void grantGroupmanager(User user) throws SQLException {		

		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call GrantGroupmanager(?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getGroupname());
        cs.execute();

	}
	
	//撤销组别
	public void revokeGroupmanager(User user) throws SQLException {		

		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call RevokeGroupmanager(?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getGroupname());
        cs.execute();
	}
	
	//以下是员工
	
	//员工登录
	public ResultSet selectStuff(User user) throws SQLException{
		CallableStatement cs = new Conn().getConn().prepareCall("{call Stuff_login(?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getPassword());
	    ResultSet rs = cs.executeQuery();
	    return rs;
	}
	
	public void increaseNumLogins(User user) {
		CallableStatement cs;
		try {
			cs = new Conn().getConn().prepareCall("{call IncreaseNumLoginsByName(?)}");
			cs.setString(1,user.getUsername());
			cs.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public void lastLoginTime() {
		CallableStatement cs;
		try {
			cs = new Conn().getConn().prepareCall("{call LastLoginTime()}");
			cs.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	//员工增删改查

public List<User> selectAllStuff(User user) throws SQLException{
		
		List<User> list = new ArrayList<User>();
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectAllStuff()}");
		ResultSet rs = cs.executeQuery();
		
		while(rs.next()){
			User user1=new User();
			
			user1.setMasterid(Integer.parseInt(rs.getString("id")));
			user1.setUsername(rs.getString("name"));
			user1.setPassword(rs.getString("password"));
			user1.setBdate(rs.getString("bdate"));
			user1.setLogin_num(Integer.parseInt(rs.getString("login_num")));
			user1.setTruename(rs.getString("truename"));
			user1.setSex(rs.getString("sex"));
			user1.setBirthday(rs.getString("birthday"));
			user1.setMobile(rs.getString("mobile"));
			user1.setEmail(rs.getString("email"));
			user1.setDept(rs.getString("dept"));
			user1.setPosition(rs.getString("position"));
			user1.setPosition_desc(rs.getString("position_desc"));
			user1.setOffice_phone(rs.getString("office_phone"));
			/*
			user1.setGroupid(Integer.parseInt(rs.getString("groupid")));
			user1.setCreatedate(rs.getString("createdate"));
			user1.setGroupname(rs.getString("groupname"));
			user1.setGroupinfo(rs.getString("groupinfo"));
			*/
			list.add(user1);
		}
		return list;
	}
/*
	public ResultSet selectStuffById(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectUserById(?)}");
			cs.setInt(1,user.getMasterid());
			ResultSet rs = cs.executeQuery();
			return rs;
	}
	
	public ResultSet selectStuffByName(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectUserByName(?)}");
			cs.setString(1,user.getUsername());
			ResultSet rs = cs.executeQuery();
			return rs;
	}
	*/

/*
	public ResultSet selectStuffByTruename(User user) throws SQLException{
		
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectUserByTruename(?)}");
			cs.setString(1,user.getTruename());
			ResultSet rs = cs.executeQuery();
			return rs;
	}

	public ResultSet selectUsername() throws SQLException {
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectAllUsername()}");
		ResultSet rs = cs.executeQuery();
		return rs;
	}
	*/

	public void insertStuff(User user) throws SQLException {		

		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call InsertStuff(?,?,?,?,?,?,?,?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getPassword());
		cs.setString(3,user.getBdate());
		cs.setString(4,user.getTruename());
		cs.setString(5,user.getSex());
		cs.setString(6,user.getBirthday());
		cs.setString(7,user.getMobile());
		cs.setString(8,user.getEmail());
		cs.setString(9,user.getGroupname());
        cs.execute();

	}
	
	//商城登录
	public ResultSet selectMallUser(User user) throws SQLException{
		CallableStatement cs = new Conn().getConn().prepareCall("{call Mall_login(?,?)}");
		cs.setString(1,user.getUsername());
		cs.setString(2,user.getPassword());
	    ResultSet rs = cs.executeQuery();
	    return rs;
	}

}
