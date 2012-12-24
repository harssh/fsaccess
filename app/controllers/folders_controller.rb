class FoldersController < ApplicationController
  
  #Errno::EACCES in FoldersController#new 
  #Errno::ENOTEMPTY in FoldersController#deldir 
    
  rescue_from Errno::EACCES, :with => :error_render_method
  rescue_from  Errno::ENOTEMPTY , :with => :error_render_method2
 rescue_from Errno::ENOENT, :with => :error_render_method3
 
   
  def error_render_method
        
      render :action => 'new_folder' 
      flash[:error] = 'Access Denied Pls Change Path.'
      
  end
  
  def error_render_method2

    
    flash[:error] = 'Folder Contails sub Folder or files.'
       redirect_to :back 
      flash[:error] = 'Folder Contains sub Folder or files.'
   
  end

  def error_render_method3   
           render :action => 'createfolder' 
           
   end
    
    
  def index  #listing from given path
   @fpath = params[:fpath]
     
     if @fpath
       
      @files =  Dir[ "#{@fpath}"+"/*"]    
      render '_form'
    else
      flash[:error] = "Invalid Path"
      render 'index'
      
    end
   
  end
  
   # def subfolderlist # listing for subfolder
     # @fpath = params[:fpath]
#      
     # if @fpath
#      
        # @files =  Dir["#{@fpath}"+"/*"]
        # render '_form'
#              
     # else     
       # redirect_to :back    
#     
     # end
  # end
    
  
  def createfolder #calls new folder name input page
 @f_path =params[:fpath]
 
     if FileUtils.mkdir_p("#{@f_path}")
        render '_nform'
        flash[:success] = "Folder Created"
        
    else 
       flash[:error] = "Folder notCreated"
        render 'new'
     end
      
  end

 
  def deldir #delete directory
         @f_name = params[:fname]
         
   if Dir.rmdir(@f_name)
     flash[:success] = "Deleted Successful"
      redirect_to :back
   else
     flash[:error] = "Folder Contains sub Folder or files."
     redirect_to :back
   end
   
    
    
  end
  
  def rename #rename 
    
    pat = params[:fpath].slice(0..(params[:fpath].index('/')))
    
   if FileUtils.mv(params[:fpath],pat + params[:newname])
    flash[:notice] = "Rename Successfull"
    redirect_to :back
    else
     flash[:notice] = "Invalid Name"
    redirect_to :back 
    end
  end
  
  
  
end
