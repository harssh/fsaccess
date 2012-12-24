class FilesController < ApplicationController
  
  rescue_from Errno::EACCES, :with => :error_render_method
  rescue_from Errno::ENOENT, :with => :error_render_method3
 
   
  def error_render_method
        
      render :action => 'new_folder' 
      flash[:error] = 'Access Denied Pls Change Path.'
      
  end
  
  
  def error_render_method3   
           render :action => 'createfolder' 
           
   end
    
   def create # create new file
     @fpath = params[:fpath]
     
     if @fpath
    
      
     FileUtils.touch("#{@fpath}")
     flash[:notice] = "New File Created Successfully"
     render '_newfile'
    
     else
       flash[:notice] = "New File Not Created"
       render 'create'
       
    end
  end
   
  
  
 def show #method called when file is opened
   
 end
 
 def delete # delete file
   @f_name = params[:fname]
   
   if FileUtils.rm(@f_name)
     
     flash[:success] = "Deleted Successful"
      redirect_to :back
   else
     flash[:error] = "Folder Contains sub Folder or files."
     redirect_to :back
   end
   
 end
 
end
