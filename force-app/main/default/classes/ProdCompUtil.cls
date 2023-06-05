public class ProdCompUtil 
{

    Public static void ProductosCompras (list <ProductosDeLaCompra__c> ListaProdComp )
    {
        set <id> CompraIds = new set <id>();
        
        for (ProductosDeLaCompra__c NewCompra : ListaProdComp)
        {
            CompraIds.add(NewCompra.Compra__c);
        }
        
        List <Compra__c> ListCompra = [ Select Name,ValorTotal__c from Compra__c where id in : CompraIds];
            
        Map <id,Compra__c> MapCompra = New Map <id,Compra__c>();
        
        For (Compra__c Compra : ListCompra)
        {
            MapCompra.put(Compra.id,Compra);
        }
     
        List <ProductosDeLaCompra__c> ListProdComp2 = [Select CuantidadDeProductos__c,Compra__c,producto__c from ProductosDeLaCompra__c where compra__c in : CompraIds];
        
      Set <id> ProductoId = New Set <id>();
        
        For (ProductosDeLaCompra__c NewProd : ListProdComp2 )
        {
            ProductoId.add(NewProd.Producto__c);
        }
        
        List <Producto__c> ListProd = [ Select Name, Valor__c from Producto__c where id in : ProductoId ];
        
        Map <id,Producto__c> MapProd = New Map <id,Producto__c>();
        
        for (Producto__c Prod : ListProd)
        {
            MapProd.put(Prod.id,Prod);
        }
        
       Map <id,list<ProductosDeLaCompra__c>> MapListProdComp = New Map <id,list<ProductosDeLaCompra__c>>();
       
        For (ProductosDeLaCompra__c ProdComp : ListProdComp2 )
        {
            if (MapListProdComp.containsKey(ProdComp.Compra__c))
            {
                MapListProdComp.get(ProdComp.compra__c).add(ProdComp);
            }
            else 
            {
                MapListProdComp.put(ProdComp.compra__c , New List <ProductosDeLaCompra__c>{ProdComp});
            }
        }
        
        List <Compra__c> ComprasUpdate = New list <Compra__c>();
        
        
        for (Compra__c compra : ListCompra)
        {
          
               
           list <ProductosDeLaCompra__c> ListProdComp3 = MapListProdComp.get(compra.id); 
           
            Compra.ValorTotal__c = 0;
            Compra.CuantidadDeProductosComprados__c = 0;
            
            for (ProductosDeLaCompra__c NewProducto : ListProdComp3 )
            {
                Producto__c Producto =  MapProd.get(NewProducto.Producto__c);
                
                Compra.ValorTotal__c += Producto.Valor__c * NewProducto.CuantidadDeProductos__c; 
               
            }
            
                ComprasUpdate.add(compra);
            
            }
        
       Update ComprasUpdate;        
    }
    
    Public static void CantidadDeProductosComprados (List <ProductosDeLaCompra__c> ListProdComp)
    {
       set<id> ComprasIds = New set <id>();
        
        For (ProductosDeLaCompra__c Compra : ListProdComp)
        {
            ComprasIds.add(Compra.Compra__c);
        }
                
        List<Compra__c> ListCompra = [Select Name,CuantidadDeProductosComprados__c from Compra__c where id in : ComprasIds];
        
        List <ProductosDeLaCompra__c> ListProdComp2 = [Select Name,Compra__C,Producto__c,CuantidadDeProductos__c from ProductosDeLaCompra__c where Compra__c in : ComprasIds ];
       
        Map <id,list<ProductosDeLaCompra__c>> MapListProdCompra = New Map <id,list<ProductosDeLaCompra__c>>();
        
        For (ProductosDeLaCompra__c ProductosDeLasCompras : ListProdComp2 )
        {
            If (MapListProdCompra.containsKey(ProductosDeLasCompras.Compra__c))
            {
                MapListProdCompra.get(ProductosDeLasCompras.Compra__c).add(ProductosDeLasCompras);
            }
            else 
            {
                MapListProdCompra.put(ProductosDeLasCompras.Compra__c,New List<ProductosDeLaCompra__c>{ProductosDeLasCompras});
            }
            
            List<Compra__c> ComprasUpdate = new List<Compra__c>();
            
            For (Compra__c Compra : ListCompra )
            {
                Compra.CuantidadDeProductosComprados__c = 0;
               
                List <ProductosDeLaCompra__c> ListaProductosCompras = MapListProdCompra.get(compra.id);
              
                For (ProductosDeLaCompra__c ProducCompra : ListaProductosCompras )
                {
                   compra.CuantidadDeProductosComprados__c += ProducCompra.CuantidadDeProductos__c;
                }
                
                ComprasUpdate.add(Compra);
            }
            
           Update ComprasUpdate;
        }
        
    }
    
}