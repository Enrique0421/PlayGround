public class EncontrarNumeros // ejercicio para encontrar en una lista el numero mas alto y mas bajo //
{
    // primero creamos la lista que vamos a utlizar // 
    
    public static void NumeroAltoBajo (list<integer>ListaAltoBajo)
    {
        // Ahora asignamos esos dos valores a unos de los dos numeros de la misma, ponemos [0] para que coja el primer valor que tengamos en la lista y funcione correctamente //
        
        integer NumeroAlto = ListaAltoBajo[0];
        
        integer NumeroBajo = ListaAltoBajo[0];
        
        // ahora vamos a hacer la formula para que se puedan calcular esos numeros que queremos encontrar basandonos en la lista que tenenmos creada //
        
        for (integer i = 0 ; i < listaAltoBajo.size(); i ++) // El ++ en este caso sirve para que vaya pasando del valor de la lista1 al valor de la lista2 y sucesivamente //
        {
            // ahora vamos a hacer la formula de comparacion para saber el numero alto y bajo en distintos casos //
            
            if (NumeroAlto < listaAltoBajo[i]) // Si el numero alto es menor que el numero que esta cogiendo de la lista, el numero de la lista pasa a ser el NumeroAlto //
            {
                NumeroAlto = ListaAltoBajo[i];
            }
            
            if (NumeroBajo > ListaAltoBajo[i]) // Si el numero bajo es mayor que el numero que esta cogiendo de la lista, el numero de la lista pasa a ser el NumeroBajo //
            {
                NumeroBajo = ListaAltoBajo[i];
            }
      
         }
         
        // system.debug sirve para mostrar los valores que queremos en el debug //
        
            system.debug(NumeroBajo);
            system.debug(NumeroAlto);
    }
}