public class IntregacionUtil 
{
    Public static void Integracion1()
    {
        Http http = new Http();
        HttpRequest request =  new HttpRequest();	
        request.SetEndPoint ('https://th-apex-http-callout.herokuapp.com/animals');
        request.SetMethod ('GET');	
        
        
        HttpResponse Response = Http.send(request);
        
        if (Response.GetStatuscode()==200)
        {
            Map<String,Object> results = (Map<string,object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug ('Received the following animals :');
            
            for (Object animal : animals ) 
            {
                	system.debug(animal);
            }
        }
    }
    
    public static void Integracion2 ()
    {
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();	
       
        request.SetEndPoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.SetMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"funky"}');
        
        httpResponse Response =  http.send(request);
        
        if (response.getStatusCode() != 201)
        {
           system.debug('the status code return was not expected : ' + response.GetStatusCode() + ' ' + response.getStatus());
            
        }
        else
        {
         system.debug(Response.getbody());    
        }
        
        
    }
}