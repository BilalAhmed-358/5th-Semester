package FREIGHT;

public class Credit extends Payment {

	/**
	 * 
	 */
	public String cardType;
	/**
	 * 
	 */
	public String EXP_Date;
	/**
	 * 
	 */
	public Integer CCNo;
	/**
	 * 
	 */
	public Integer cardNo;
	/**
	 * Getter of cardType
	 */
	public String getCardType() {
	 	 return cardType; 
	}
	/**
	 * Setter of cardType
	 */
	public void setCardType(String cardType) { 
		 this.cardType = cardType; 
	}
	/**
	 * Getter of EXP_Date
	 */
	public String getEXP_Date() {
	 	 return EXP_Date; 
	}
	/**
	 * Setter of EXP_Date
	 */
	public void setEXP_Date(String EXP_Date) { 
		 this.EXP_Date = EXP_Date; 
	}
	/**
	 * Getter of CCNo
	 */
	public Integer getCCNo() {
	 	 return CCNo; 
	}
	/**
	 * Setter of CCNo
	 */
	public void setCCNo(Integer CCNo) { 
		 this.CCNo = CCNo; 
	}
	/**
	 * Getter of cardNo
	 */
	public Integer getCardNo() {
	 	 return cardNo; 
	}
	/**
	 * Setter of cardNo
	 */
	public void setCardNo(Integer cardNo) { 
		 this.cardNo = cardNo; 
	}
	/**
	 * 
	 */
	public void payAuthorized() { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 */
	public void printReceipt() { 
		// TODO Auto-generated method
	 } 

}
