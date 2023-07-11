package com.javacode;

public class JavaCode {
	public static int recievePaymentRequest() {
        System.out.println("Payment request recieved!");
        int payment = 5;
        return payment;
    }
    public static void contactCustomer() {
        System.out.println("Customer Contacted!");
    }
    public static boolean stillBookingLesson() {
        System.out.println("Lesson is being booked!");
        return true;
    }
    public static void sendPaymentRequest() {
        System.out.println("Payment request sent!");
    }
    public static void sendConfirmationReceipt() {
        System.out.println("Confirmation receipt sent!");
    }
    public static void sendCancellationReceipt() {
        System.out.println("Reciept cancellation sent!");
    }

    public static void main(String args[]) {
	    boolean booking=false;
	    int payment_details = recievePaymentRequest();
	    
	    if(payment_details <= 5)
	        booking = true;
	    else{
	        contactCustomer();
	        if(stillBookingLesson() == true) {
	            sendPaymentRequest();
	        }
	        else
	            booking = false;
	    }
    
	    if(booking == true)
	        sendConfirmationReceipt();
	    else
	        sendCancellationReceipt();
	}
}
