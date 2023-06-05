@Istest 
public class TestVerifyDate 
{
    @IsTest static void TestChecKDates()
    {
        date Date1 = Date.NewInstance ( 2023, 5, 22);
        date Date2 = Date.NewInstance ( 2023, 6, 1);
        
        Date Test1 = VerifyDate.CheckDates(Date1,Date2);
        System.assertEquals(Date2,Test1);
        
        
    }
    @IsTest Static Void TestChechDates2()
    {
        Date Date1 = Date.NewInstance ( 2023, 5, 22);
        Date Date2 = Date.NewInstance ( 2023, 7, 28);
        Date LastDate = Date.newInstance(2023, 5, 31);
        
        Date Test2 = VerifyDate.CheckDates(Date1,Date2);
        System.assertequals(LastDate,test2);
        
    }
    
    @IsTest Static Void TesTCheckDates3()
    {
        
        Date Date1 = Date.NewInstance ( 2023, 5, 22);
        Date Date2 = Date.NewInstance ( 2023, 5, 28); 
       
    
        Date Test3 = VerifyDate.CheckDates(Date1,Date2);
        System.assertEquals(Date2,Test3);
    
    }
    
    @IsTest Static Void TestCheckDates4()
    {
        Date Date1 = Date.NewInstance ( 2023, 5, 22);
        Date Date2 = Date.NewInstance ( 2023, 5, 22); 
        
        Date Test4 = VerifyDate.CheckDates(Date1,Date2);
        System.assertEquals(Date2,Test4);
        
    }
    
}