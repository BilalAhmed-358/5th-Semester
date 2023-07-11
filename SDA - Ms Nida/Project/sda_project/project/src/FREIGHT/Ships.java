package FREIGHT;

public class Ships extends Port {

	/**
	 * 
	 */
	public double refuel_time;
	/**
	 * 
	 */
	public String dockTime;
	/**
	 * 
	 */
	public Integer noOfContainers;
	/**
	 * 
	 */
	public double weight;
	/**
	 * 
	 */
	public double price_per_hour;
	/**
	 * 
	 */
	public String shipID;
	/**
	 * 
	 */
	public String route;
	/**
	 * 
	 */
	public String location;
	/**
	 * 
	 */
	public String date_Arrival;
	/**
	 * Getter of refuel_time
	 */
	public double getRefuel_time() {
	 	 return refuel_time; 
	}
	/**
	 * Setter of refuel_time
	 */
	public void setRefuel_time(double refuel_time) { 
		 this.refuel_time = refuel_time; 
	}
	/**
	 * Getter of dockTime
	 */
	public String getDockTime() {
	 	 return dockTime; 
	}
	/**
	 * Setter of dockTime
	 */
	public void setDockTime(String dockTime) { 
		 this.dockTime = dockTime; 
	}
	/**
	 * Getter of noOfContainers
	 */
	public Integer getNoOfContainers() {
	 	 return noOfContainers; 
	}
	/**
	 * Setter of noOfContainers
	 */
	public void setNoOfContainers(Integer noOfContainers) { 
		 this.noOfContainers = noOfContainers; 
	}
	/**
	 * Getter of weight
	 */
	public double getWeight() {
	 	 return weight; 
	}
	/**
	 * Setter of weight
	 */
	public void setWeight(double weight) { 
		 this.weight = weight; 
	}
	/**
	 * Getter of price_per_hour
	 */
	public double getPrice_per_hour() {
	 	 return price_per_hour; 
	}
	/**
	 * Setter of price_per_hour
	 */
	public void setPrice_per_hour(double price_per_hour) { 
		 this.price_per_hour = price_per_hour; 
	}
	/**
	 * Getter of shipID
	 */
	public String getShipID() {
	 	 return shipID; 
	}
	/**
	 * Setter of shipID
	 */
	public void setShipID(String shipID) { 
		 this.shipID = shipID; 
	}
	/**
	 * Getter of route
	 */
	public String getRoute() {
	 	 return route; 
	}
	/**
	 * Setter of route
	 */
	public void setRoute(String route) { 
		 this.route = route; 
	}
	/**
	 * Getter of location
	 */
	public String getLocation() {
	 	 return location; 
	}
	/**
	 * Setter of location
	 */
	public void setLocation(String location) { 
		 this.location = location; 
	}
	/**
	 * Getter of date_Arrival
	 */
	public String getDate_Arrival() {
	 	 return date_Arrival; 
	}
	/**
	 * Setter of date_Arrival
	 */
	public void setDate_Arrival(String date_Arrival) { 
		 this.date_Arrival = date_Arrival; 
	}
	/**
	 * 
	 */
	public void refuelled() { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 */
	public void priceByWeight() { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 */
	public void dockTimePrice() { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 */
	public void refuelledPrice() { 
		// TODO Auto-generated method
	 } 

}
