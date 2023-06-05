public class ListaDePersonas 
{
    public static void ListaGente (list<persona>ListaGente)
    {
        persona MasJoven = new persona();
        persona MasMayor = new persona();
        persona HombreMasMayor = new persona();
        persona MujerJovenAlta = new persona();
        persona Hombrebajo = new persona();
        
        for (persona Gente : ListaGente)
        {
            if ( MasJoven.edad == null || MasJoven.edad > gente.edad )
            {
                MasJoven = gente;
            }
            
            if ( MasMayor.edad == null || MasMayor.edad < gente.edad )
            {
                MasMayor = gente;
            }
            
            if ( HombreMasMayor.edad == null || HombreMasMayor.edad < gente.edad && HombreMasMayor.genero == 'M')
            {
                HombreMasMayor = gente;
            }
            
            if (MujerJovenALta.edad == null || MujerJovenAlta.edad > gente.edad && MujerJovenAlta.genero == 'F' && MujerJovenAlta.altura < gente.altura )
            {
                MujerJovenAlta = gente;
            }
            
            if (HombreBajo.edad == null || HombreBajo.genero == 'M' && HombreBajo.altura > gente.altura)
            {
                HombreBajo = gente;
            }
            
            
          }
            system.debug('El mas joven es');
            system.debug(MasJoven);
            system.debug('El mas mayor es');
            system.debug(MasMayor);
            system.debug('El hombre mas mayor es');
            system.debug(HombreMasMayor);
            system.debug('La mujer Joven mas alta es');
            system.debug(MujerJovenAlta);
            system.debug('El hombre mas bajo es');
            system.debug(Hombrebajo);
        }
    
}