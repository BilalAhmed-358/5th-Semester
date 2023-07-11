class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Enter your percentage"); 
        Scanner sc= new Scanner(System.in);
        int percentage=0;
        percentage=sc.nextInt();
        if(percentage >=90)
        {
        System.out.println("A+ Grade"); 

        }
        else if(percentage < 90 && percentage >=80)
        {
        System.out.println("A Grade"); 
        }
        else if(percentage < 80 && percentage >=70)
        {
        System.out.println("B Grade"); 
        }
        else if(percentage < 70 && percentage >=60)
        {
        System.out.println("C Grade"); 
        }
        else if(percentage < 60)
        {
        System.out.println("Fail!"); 
        }


    }
}