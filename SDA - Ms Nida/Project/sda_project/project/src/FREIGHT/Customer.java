package FREIGHT;

import java.util.List;

public class Customer extends Login {

	/**
	 * 
	 */
	public List<Order> order;
	/**
	 * 
	 */
	public String cust_Address;
	/**
	 * 
	 */
	public String cust_ID;
	/**
	 * 
	 */
	public String custName;
	/**
	 * Getter of order
	 */
	public List<Order> getOrder() {
	 	 return order; 
	}
	/**
	 * Setter of order
	 */
	public void setOrder(List<Order> order) { 
		 this.order = order; 
	}
	/**
	 * Getter of cust_Address
	 */
	public String getCust_Address() {
	 	 return cust_Address; 
	}
	/**
	 * Setter of cust_Address
	 */
	public void setCust_Address(String cust_Address) { 
		 this.cust_Address = cust_Address; 
	}
	/**
	 * Getter of cust_ID
	 */
	public String getCust_ID() {
	 	 return cust_ID; 
	}
	/**
	 * Setter of cust_ID
	 */
	public void setCust_ID(String cust_ID) { 
		 this.cust_ID = cust_ID; 
	}
	/**
	 * Getter of custName
	 */
	public String getCustName() {
	 	 return custName; 
	}
	/**
	 * Setter of custName
	 */
	public void setCustName(String custName) { 
		 this.custName = custName; 
	}
	/**
	 * 
	 */
	public void retrieve() { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 */
	public void store() { 
		// TODO Auto-generated method
	 } 

}
