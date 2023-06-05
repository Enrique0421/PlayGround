@istest public class ProdCompUtilTest
{
 
    @TestSetup static void Setup() 
    {
        Persona__c Persona1 = New Persona__c();
        Persona1.name = 'TestPersona';
        insert Persona1;
        
        compra__c Compra = new Compra__c();
        compra.name = 'TestCompra';
        Compra.Persona__c = Persona1.id;
        insert Compra;
        
        list<Producto__c> TestListaProducto = New List <Producto__c>();
        
        Producto__c Test1Producto = new Producto__c();
        Test1Producto.name = 'Test1Producto';
        Test1Producto.valor__c = 100;
        TestListaProducto.add(Test1Producto);
        Producto__c Test2Producto = new Producto__c();
        Test2Producto.name = 'Test2Producto';
        Test2Producto.valor__c = 30;
        TestListaProducto.add(Test2Producto);
        Producto__c Test3Producto = new Producto__c();
        Test3Producto.name = 'Test3Producto';
        Test3Producto.valor__c = 10;
        TestListaProducto.add(Test3Producto);
        Producto__c Test4Producto = new Producto__c();
        Test4Producto.name = 'Test4Producto';
        Test4Producto.valor__c = 200;
        TestListaProducto.add(Test4Producto);
        insert TestListaProducto;
    }
   
        @istest static void TriggerProductosDeLaCompra ()
       {
      
           list <Producto__c> TestListaProducto = [Select id From Producto__c ];
           compra__c Compra = [Select id from Compra__c];
        List<ProductosDeLaCompra__c> listaProductosDeLaCompra = new List<ProductosDeLaCompra__c>();
           for (Producto__c Product :  TestListaProducto)
           { 
               
            ProductosDeLaCompra__c ProdComp = New ProductosDeLaCompra__c();
            ProdComp.CuantidadDeProductos__c = 5;
            ProdComp.Compra__c = Compra.id;
            ProdComp.Producto__c = Product.id;
            ProdComp.name = 'TestProdComp';
            listaProductosDeLaCompra.add(ProdComp);
              
            }
        
        insert listaProductosDeLaCompra;
       
       
    }
    
    
}