Rails.application.routes.draw do
 
  get("/", { :controller => "home", :action => "index" })


  get("/signup", { :controller => "users", :action => "new" })   
  post("/users", { :controller => "users", :action => "create" })  
  get("/login", { :controller => "sessions", :action => "new" })   
  post("/sessions", { :controller => "sessions", :action => "create" })  
  delete("/logout", { :controller => "sessions", :action => "destroy" })  


  get("/places", { :controller => "places", :action => "index" })  
  get("/places/new", { :controller => "places", :action => "new" })  
  post("/places", { :controller => "places", :action => "create" })  
  get("/places/:id", { :controller => "places", :action => "show" })  

 
  get("/places/:place_id/entries/new", { :controller => "entries", :action => "new" })  
  post("/places/:place_id/entries", { :controller => "entries", :action => "create" })  

end