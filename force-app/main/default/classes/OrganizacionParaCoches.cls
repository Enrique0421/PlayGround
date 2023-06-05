public class OrganizacionParaCoches
{
    public static void Organizacion(list<Coche__c>ListaCoches)
  {
      
      
          
      Coche__c CocheRojoTesla = new Coche__c();
      Coche__c Coche2PuertasRojo = new Coche__c();
      Coche__c CocheTeslaAmarillo = new Coche__c();
      Coche__c CocheFerrari = new Coche__c();
      
      for (Coche__c TodosLosCoches : ListaCoches )
      {
          if (TodosLosCoches.color__c == 'Rojo' && TodosLosCoches.marca__c == 'Tesla')
          {
              CocheRojoTesla = TodosLosCoches;
          }
          
          if (TodosLosCoches.NumeroDePuertas__c == 2 && TodosLosCoches.color__c == 'Rojo' )
          {
              Coche2PuertasRojo = TodosLosCoches;
          }
          
          if (TodosLosCoches.color__c == 'Amarillo' && TodosLosCoches.marca__c == 'Tesla')
          {
              CocheTeslaAmarillo = TodosLosCoches;
          }
          
          if (TodosLosCoches.marca__c == 'Ferrari')
          {
              CocheFerrari = TodosLosCoches;
          }
                
      }
          System.debug ('El Coche Rojo De tesla es');
          System.debug (CocheRojoTesla);
          System.debug ('El Coche amarillo de tesla');
          System.debug (CocheTeslaAmarillo);
          System.debug ('El coche de dos puertas es ');
          System.debug (Coche2PuertasRojo);
          System.debug ('El coche de Marca Ferrari es');
          System.debug (CocheFerrari);
      
      if (coche__c.persona__c != null )
      {
          insert ListaCoches;
      }
     
    }
}