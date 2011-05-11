class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @produtos = Produto.all
    @lista = Lista.find params[:lista_id]
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])
    @lista = Lista.find params[:lista_id]
    @item.lista = @lista
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to(lista_path(@lista), :notice => 'O Item foi criado com sucesso.') }
        format.xml  { render :xml => @item, :status => :created, :location => lista_item_path(@lista, @lista) }
      else
        @produtos = Produto.all
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @lista = Lista.find(params[:lista_id])
    @item = Item.find(params[:id])
    @item.destroy
    

    respond_to do |format|
      format.html { redirect_to(lista_url(@lista)) }
      format.xml  { head :ok }
    end
  end
end
