package FREIGHT;

import java.sql.Date;

public class Admin extends Login {

	/**
	 * 
	 */
	public String Admin_name;
	/**
	 * 
	 */
	public Date reg_date;
	/**
	 * 
	 */
	public Boolean log_status;
	/**
	 * 
	 */
	public String Admin_id;
	/**
	 * Getter of Admin_name
	 */
	public String getAdmin_name() {
	 	 return Admin_name; 
	}
	/**
	 * Setter of Admin_name
	 */
	public void setAdmin_name(String Admin_name) { 
		 this.Admin_name = Admin_name; 
	}
	/**
	 * Getter of reg_date
	 */
	public Date getReg_date() {
	 	 return reg_date; 
	}
	/**
	 * Setter of reg_date
	 */
	public void setReg_date(Date reg_date) { 
		 this.reg_date = reg_date; 
	}
	/**
	 * Getter of log_status
	 */
	public Boolean getLog_status() {
	 	 return log_status; 
	}
	/**
	 * Setter of log_status
	 */
	public void setLog_status(Boolean log_status) { 
		 this.log_status = log_status; 
	}
	/**
	 * Getter of Admin_id
	 */
	public String getAdmin_id() {
	 	 return Admin_id; 
	}
	/**
	 * Setter of Admin_id
	 */
	public void setAdmin_id(String Admin_id) { 
		 this.Admin_id = Admin_id; 
	}
	/**
	 * 
	 */
	public void updateDetails() { 
		// TODO Auto-generated method
	 } 

}
