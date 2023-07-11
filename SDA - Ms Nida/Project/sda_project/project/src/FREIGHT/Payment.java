package FREIGHT;

public class Payment extends Order {

	/**
	 * 
	 */
	public String paymentID;
	/**
	 * 
	 */
	public double tax;
	/**
	 * 
	 */
	public double Amount;
	/**
	 * 
	 */
	public String paymentType;
	/**
	 * Getter of paymentID
	 */
	public String getPaymentID() {
	 	 return paymentID; 
	}
	/**
	 * Setter of paymentID
	 */
	public void setPaymentID(String paymentID) { 
		 this.paymentID = paymentID; 
	}
	/**
	 * Getter of tax
	 */
	public double getTax() {
	 	 return tax; 
	}
	/**
	 * Setter of tax
	 */
	public void setTax(double tax) { 
		 this.tax = tax; 
	}
	/**
	 * Getter of Amount
	 */
	public double getAmount() {
	 	 return Amount; 
	}
	/**
	 * Setter of Amount
	 */
	public void setAmount(double Amount) { 
		 this.Amount = Amount; 
	}
	/**
	 * Getter of paymentType
	 */
	public String getPaymentType() {
	 	 return paymentType; 
	}
	/**
	 * Setter of paymentType
	 */
	public void setPaymentType(String paymentType) { 
		 this.paymentType = paymentType; 
	} 

}
