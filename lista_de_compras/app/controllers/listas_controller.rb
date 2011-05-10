class ListasController < ApplicationController
  # GET /listas
  # GET /listas.xml
  def index
    @listas = Lista.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lista }
    end
  end

  # GET /listas/1
  # GET /listas/1.xml
  def show
    @lista = Lista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lista }
    end
  end

  # GET /listas/new
  # GET /listas/new.xml
  def new
    @produtos = Produto.all
    @lista = Lista.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lista }
    end
  end

  # GET /listas/1/edit
  def edit
    @produtos = Produto.all
    @lista = Lista.find(params[:id])
  end

  # POST /listas
  # POST /listas.xml
  def create
    @lista = Lista.new(params[:lista])
    
    respond_to do |format|
      if @lista.save
        format.html { redirect_to(@lista, :notice => 'Lista was successfully created.') }
        format.xml  { render :xml => @lista, :status => :created, :location => @lista }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listas/1
  # PUT /listas/1.xml
  def update
    @lista = Lista.find(params[:id])

    respond_to do |format|
      if @lista.update_attributes(params[:lista])
        format.html { redirect_to(@lista, :notice => 'Lista was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lista.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listas/1
  # DELETE /listas/1.xml
  def destroy
    @lista = Lista.find(params[:id])
    @lista.destroy

    respond_to do |format|
      format.html { redirect_to(listas_url) }
      format.xml  { head :ok }
    end
  end
end
