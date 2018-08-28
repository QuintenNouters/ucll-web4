package controller;

import domain.PersonService;
import handlers.RequestHandler;

public class ControllerFactory {
	
    public RequestHandler getController(String key, PersonService model) {
        return createHandler(key, model);
    }
    
	private RequestHandler createHandler(String handlerName, PersonService model) {
		RequestHandler handler = null;
		try {

			Class<?> handlerClass = Class.forName("handlers."+ handlerName + "Handler");
			Object handlerObject = handlerClass.newInstance();
			handler = (RequestHandler) handlerObject;
	    	handler.setModel(model);
		} catch (Exception e) {
			throw new RuntimeException("Deze pagina bestaat niet!!!! " + handlerName);
		}
		return handler;
	}
}
