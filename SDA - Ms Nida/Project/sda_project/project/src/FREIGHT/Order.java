package FREIGHT;

import java.sql.Date;

public class Order {

	/**
	 * 
	 */
	public String orderName;
	/**
	 * 
	 */
	public Date orderDate;
	/**
	 * 
	 */
	public String orderID;
	/**
	 * 
	 */
	public Integer qty;
	/**
	 * Getter of orderName
	 */
	public String getOrderName() {
	 	 return orderName; 
	}
	/**
	 * Setter of orderName
	 */
	public void setOrderName(String orderName) { 
		 this.orderName = orderName; 
	}
	/**
	 * Getter of orderDate
	 */
	public Date getOrderDate() {
	 	 return orderDate; 
	}
	/**
	 * Setter of orderDate
	 */
	public void setOrderDate(Date orderDate) { 
		 this.orderDate = orderDate; 
	}
	/**
	 * Getter of orderID
	 */
	public String getOrderID() {
	 	 return orderID; 
	}
	/**
	 * Setter of orderID
	 */
	public void setOrderID(String orderID) { 
		 this.orderID = orderID; 
	}
	/**
	 * Getter of qty
	 */
	public Integer getQty() {
	 	 return qty; 
	}
	/**
	 * Setter of qty
	 */
	public void setQty(Integer qty) { 
		 this.qty = qty; 
	}
	/**
	 * 
	 */
	public void updateOrder() { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 */
	public void AddOrder() { 
		// TODO Auto-generated method
	 } 

}
