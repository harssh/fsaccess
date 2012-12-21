module FoldersHelper
  
  def pathc(pa)
        
     @p = pa   
   flash[:notice] = "notice"
     @files =  Dir[@p]  
 
 
  end
  
  def deld(pa1)
    
    FileUtils.rm_rf(pa1)
    
  end
  
end
