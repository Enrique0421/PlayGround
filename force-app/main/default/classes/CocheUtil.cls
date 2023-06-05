public class CocheUtil
{

    public static void ActualizacionDeCuantidad (list<coche__c> NewCoches , map<id,coche__c> oldCocheMap) // Añadir los parametros NewCoches y OldCocheMap directamente para sustituir a los triggers // 
    {
        
        set <id> PersonasId = new set<Id>();
        
        for (Coche__c NewCoche : NewCoches) 
        {
             PersonasId.add(NewCoche.Persona__c);
        }
        
        list<persona__c> PersonasList = new list <persona__c>();         
       
        PersonasList = [Select Name, CuantidadDeCoches__c from Persona__c where id in : PersonasId ]; 
       
        Map <id,Persona__c> PersonasMap = new Map <id , Persona__c>(); 
        
        for (Persona__c Persona : PersonasList) 
        {
        PersonasMap.put(Persona.id,persona);      
        }
        
     
       
        list <Persona__c> Personas = new list<Persona__c>();
       
        for(Coche__c NewCoche : NewCoches) 
        {
            Persona__c NewPersona = New Persona__c();
            
            list <Coche__c> CochesNewPersona = New list <coche__c>(); 
            
           
          
            
            NewPersona = PersonasMap.get(NewCoche.Persona__c); 
         
            CochesNewPersona = [Select name from Coche__c Where persona__c =: NewPersona.id ];
          
            NewPersona.CuantidadDeCoches__c = CochesNewPersona.size(); 
           
            if (oldCocheMap != null)
            {
            coche__c oldCoche = oldCocheMap.get(NewCoche.id);
            Persona__c OldPersona = New Persona__c();
            
            List<coche__c> CochesOldPersona = new list <coche__c>();
            
            OldPersona = PersonasMap.get(OldCoche.Persona__c);
                
            CochesOldPersona = [Select name from Coche__c Where persona__c =: OldPersona.id ];
            OldPersona.CuantidadDeCoches__c = CochesOldPersona.size();
            
            Personas.add(OldPersona);
            }
            
            Personas.add(NewPersona);
            
        }
        
         Update Personas;
    
    }
    
    
    public static void CambiarNombre (list <coche__c> NewCoches, map<id,coche__c> OldCocheMap)
    {
      list <Persona__c> PersonasUpdate = new list<Persona__c>();
        
        set <id> PersonaId = new set <Id>();
        
        for (Coche__c NewCoche : NewCoches)
        {
            PersonaId.add(NewCoche.Persona__c);
        }
        
        list <Persona__c> ListaPersonas = new list <persona__c>();
        
        ListaPersonas = [select name,CuantidadDeCoches__c from Persona__c where id in : PersonaId ];
        
        Map <id,Persona__c> MapPersonas = New Map <id,Persona__c>();
        
        for (Persona__c Personas : ListaPersonas )
        {
            MapPersonas.put(Personas.id ,personas);
        }
        
        
        
        for (coche__c NewCoche : NewCoches)
        {
          
            Persona__c NewPersona = New Persona__c();
         
            NewPersona = MapPersonas.get(NewCoche.Persona__c);
         
            
            if (NewCoche.id != null)
                {
                    coche__c OldCoche = OldCocheMap.get(NewCoche.id);
                    
                    if (oldCoche.Persona__c != NewCoche.Persona__c)
          
                    {
                        NewCoche.name = 'Coche de ' + NewPersona.name;
                    }
                   
                }
            else ( NewCoche.name = 'Coche de ' + NewPersona.name);
             
          
        }
          
            Update PersonasUpdate;
    }
    
    
    
}