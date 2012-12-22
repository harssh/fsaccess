class FoldersController < ApplicationController
  
  #Errno::EACCES in FoldersController#new 
  rescue_from Errno::EACCES, :with => :error_render_method

  def error_render_method
    respond_to do |type|
    # type.html { render :json => "Access Denied" }
      type.all  { render :action => 'nf' }
      flash[:error] = 'Access Denied Pls Change Path.'
    end
    true
  end
  
  
  def index
   
      if params[:q] 
    @files =  Dir["#{params[:q]}"+"/*"]
    render '_form'
  end
    
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    #@folder = Folder.find(params[:id])
     @files =  Dir[:folder]
      @p = :q     
   flash[:notice] = "notice"
     @files =  Dir["#{@p}"]  
 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @folder }
    end
  end

  # GET /folders/new
  # GET /folders/new.json
  def new
   # @folder = Folder.new

 if params[:q] 
 # begin
  if FileUtils.mkdir_p("#{params[:q]}")
        render '_nform'
        flash[:error] = "Folder Created"
        
  #    else
        
   #     format.html { redirect_to nf_path, notice: 'Folder was successfully updated.' }
    #    format.json { render json: @folder.errors, status: :unprocessable_entity }
      
     end
     #  rescue   
      #   render :action => 'nf' 
      #flash[:error] = 'Access Denied Pls Change Path.'
      #end
 end
   # respond_to do |format|
    #  format.html # new.html.erb
     # format.json { render json: @folder }
    #end
  end

  # GET /folders/1/edit
  def edit
    @folder = Folder.find(params[:id])
  end

  # POST /folders
  # POST /folders.json
  def create
    #@folder = Folder.new(params[:folder])
     
    # @files =  Dir[:folder]
        if params[:q] 
          FileUtils.mkdir_p("#{params[:q]}")
        end
     #@files =  Dir["#{params[:q]}"]
     flash[:success] = "Folder Created"
    render '_nform' 
    
      end

  # PUT /folders/1
  # PUT /folders/1.json
  def update
    @folder = Folder.find(params[:id])

    respond_to do |format|
      if @folder.update_attributes(params[:folder])
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
#    @folder = Folder.find(params[:id])
 #   @folder.destroy

      

   
  end
  
  def path
        
     @p = :q     
   flash[:notice] = "notice"
     @files =  Dir["#{@p}"]  
 
 
  end
  
  
  def nf
       respond_to do |format|
     format.html # nf.html.erb
      format.json { render json: @folder }
    end
    
  end
  
  def deld
    
    FileUtils.rm_rf(params[:fid])
    
    
  end
  
  def renam
    
    pat = params[:fid].slice(0..(params[:fid].index('/')))
    
    FileUtils.mv(params[:fid],pat + params[:rn])
    
  end
  
  def newf
    
    if params[:q] 
  if FileUtils.touch("#{params[:q]}")
        render '_newfil'
        flash[:error] = "Folder Created"
     
 end
  end
  end
  
  def subflist
    
   if params[:q] 
    @files =  Dir["#{params[:q]}"+"/*"]
    render '_sfsorm'
    #redirect_to
  end
  end
 
  def subf
     #if params[:q] 
    @files =  Dir["#{params[:q]}"]
 # end
  end
  
 
 
end
