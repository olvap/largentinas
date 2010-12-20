class ProvinciasController < ApplicationController
  # GET /provincias
  # GET /provincias.xml
  def index
    @provincias = Provincia.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @provincias }
    end
  end

  # GET /provincias/1
  # GET /provincias/1.xml
  def show
    @provincia = Provincia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @provincia }
    end
  end

  # GET /provincias/new
  # GET /provincias/new.xml
  def new
    @provincia = Provincia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @provincia }
    end
  end

  # GET /provincias/1/edit
  def edit
    @provincia = Provincia.find(params[:id])
  end

  # POST /provincias
  # POST /provincias.xml
  def create
    @provincia = Provincia.new(params[:provincia])

    respond_to do |format|
      if @provincia.save
        format.html { redirect_to(@provincia, :notice => 'Provincia was successfully created.') }
        format.xml  { render :xml => @provincia, :status => :created, :location => @provincia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @provincia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /provincias/1
  # PUT /provincias/1.xml
  def update
    @provincia = Provincia.find(params[:id])

    respond_to do |format|
      if @provincia.update_attributes(params[:provincia])
        format.html { redirect_to(@provincia, :notice => 'Provincia was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @provincia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /provincias/1
  # DELETE /provincias/1.xml
  def destroy
    @provincia = Provincia.find(params[:id])
    @provincia.destroy

    respond_to do |format|
      format.html { redirect_to(provincias_url) }
      format.xml  { head :ok }
    end
  end
end
