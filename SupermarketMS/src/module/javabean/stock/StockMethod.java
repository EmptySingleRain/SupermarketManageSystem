package module.javabean.stock;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conn.Conn;

public class StockMethod {
	//用库存的增删改查
	public List<Stock> selectAllStock(Stock stock) throws SQLException{
		
		List<Stock> list = new ArrayList<Stock>();
		CallableStatement cs=new Conn().getConn().prepareCall("{call SelectAllStock()}");
		ResultSet rs = cs.executeQuery();
		
		while(rs.next()){
			Stock stock1=new Stock();
			
			stock1.setId(rs.getString("id"));
			stock1.setName(rs.getString("name"));
			stock1.setPrice(Float.parseFloat(rs.getString("price")));
			stock1.setAmount(Integer.parseInt(rs.getString("amount")));
			list.add(stock1);
		}
		return list;
	}
	
	public List<Stock> selectStock(String zl) throws SQLException{
		
		List<Stock> list = new ArrayList<Stock>();
		CallableStatement cs = null;
		
		if(zl.equals("fz"))	
		cs=new Conn().getConn().prepareCall("{call SelectAllClothes()}");
		
		if(zl.equals("smcp"))	
	    cs=new Conn().getConn().prepareCall("{call SelectAllDigital()}");
		
		if(zl.equals("jd"))
		cs=new Conn().getConn().prepareCall("{call SelectAllEquipment()}");	
		
		if(zl.equals("sx"))
		cs=new Conn().getConn().prepareCall("{call SelectAllFresh()}");		
		
		if(zl.equals("ryp"))
		cs=new Conn().getConn().prepareCall("{call SelectAllLive()}");		
		
		if(zl.equals("ls"))
		cs=new Conn().getConn().prepareCall("{call SelectAllSnacks()}");		
		
		ResultSet rs = cs.executeQuery();
		
		while(rs.next()){
			Stock stock1=new Stock();
			
			stock1.setId(rs.getString("id"));
			stock1.setName(rs.getString("name"));
			stock1.setPrice(Float.parseFloat(rs.getString("price")));
			stock1.setAmount(Integer.parseInt(rs.getString("amount")));
			list.add(stock1);
		}
		return list;
	}
	
	public ResultSet selectGoodsById(Stock stock) throws SQLException{
		CallableStatement cs =null;
		cs = new Conn().getConn().prepareCall("{call SelectGoodsById(?)}");
		cs.setString(1, stock.getId());
		ResultSet rs = cs.executeQuery();
		return rs;
	}
	
	public void insertStock(Stock stock,String zl) throws SQLException {		

		CallableStatement cs = null;

		    if(zl.equals("fz")){
				cs=new Conn().getConn().prepareCall("{call InsertClothes(?,?)}");
				cs.setString(1,stock.getName());
				cs.setFloat(2,stock.getPrice());
				cs.execute();
		    }

			
			if(zl.equals("smcp")){
			    cs=new Conn().getConn().prepareCall("{call InsertDigital(?,?)}");
				cs.setString(1,stock.getName());
				cs.setFloat(2,stock.getPrice());
				cs.execute();
			}

			
			if(zl.equals("jd")){
				cs=new Conn().getConn().prepareCall("{call InsertEquipment(?,?)}");
				cs.setString(1,stock.getName());
				cs.setFloat(2,stock.getPrice());
				cs.execute();
			}

			
			if(zl.equals("sx")){
				cs=new Conn().getConn().prepareCall("{call InsertFresh(?,?)}");	
				cs.setString(1,stock.getName());
				cs.setFloat(2,stock.getPrice());
				cs.execute();
			}

			
			if(zl.equals("ryp")){
				cs=new Conn().getConn().prepareCall("{call InsertLive(?,?)}");
				cs.setString(1,stock.getName());
				cs.setFloat(2,stock.getPrice());
				cs.execute();
			}

			
			if(zl.equals("ls")){
				cs=new Conn().getConn().prepareCall("{call InsertSnacks(?,?)}");
				cs.setString(1,stock.getName());
				cs.setFloat(2,stock.getPrice());
				cs.execute();
			}
	}
	

	public void updateStock(Stock stock) {

		try {
			CallableStatement cs;
			cs = new Conn().getConn().prepareCall(
					"{call UpdateStock(?,?,?,?)}");
			
			cs.setString(1, stock.getId());
			cs.setString(2, stock.getName());
			cs.setFloat(3, stock.getPrice());
			cs.setInt(4, stock.getAmount());

			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delStock(Stock stock) {
		
		try {
		CallableStatement cs;
		cs = new Conn().getConn().prepareCall("{call DeleteStock(?)}");
		cs.setString(1,stock.getId());
        cs.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//出售后在库存中减去出售的数量
	public void reduceGoodsAmount(String id,int saleAmount){
		try {
			CallableStatement cs;
			cs = new Conn().getConn().prepareCall(
					"{call ReduceGoodsAmount(?,?)}");
			
			cs.setString(1, id);
			cs.setInt(2, saleAmount);

			cs.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//出售后生产出售的历史纪录
	public void insertSaleRecord(String id,String name,float price,int saleAmount,float totalprice) {		

		CallableStatement cs = null;

		try {
			cs = new Conn().getConn().prepareCall("{call InsertSaleRecord(?,?,?,?,?)}");

			cs.setString(1, id);
			cs.setString(2, name);
			cs.setFloat(3, price);
			cs.setInt(4, saleAmount);
			cs.setFloat(5, totalprice);
			cs.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//查询出售的历史纪录
	public ResultSet selectSaleRecord(){
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			cs = new Conn().getConn().prepareCall("{call SelectSaleRecord()}");

		    rs = cs.executeQuery();
		
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
