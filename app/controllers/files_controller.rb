class FilesController < ApplicationController
  
  
   def new_file1 # create new file
     @fpath = params[:fpath]
     
     if @fpath
    
      
     FileUtils.touch("#{@fpath}")
     flash[:notice] = "New File Created Successfully"
     render '_newfile'
    
     else
       flash[:notice] = "New File Not Created"
       render 'new_file'
       
    end
  end
   
  
  
 def open_file1 #method called when file is opened
   
 end
 
 def deletefile1 # delete file
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
