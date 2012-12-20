module FoldersHelper
  
  def pathc(pa)
        
     @p = pa   
   flash[:notice] = "notice"
     @files =  Dir[@p]  
 
 
  end
  
end
