class AgendasController < ApplicationController
  before_action :set_agenda, only: [:show, :edit, :update, :destroy]
  before_action :permissao, only: [:show, :edit]  
  before_filter :authenticate_user!

  # GET /agendas
  # GET /agendas.json
  def permissao
    if @agenda.user_id != current_user.id
      redirect_to root_path, flash[:notice] = "Teste"
    end
  end


  def index
    @agendas = Agenda.all
  end

  # GET /agendas/1
  # GET /agendas/1.json
  def show
  end

  # GET /agendas/new
  def new
    @agenda = Agenda.new
  end

  # GET /agendas/1/edit
  def edit
  end

  # POST /agendas
  # POST /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)

    @agenda.user_id = current_user.id

    respond_to do |format|
      if @agenda.save
        format.html { redirect_to @agenda, notice: 'Agenda was successfully created.' }
        format.json { render :show, status: :created, location: @agenda }
      else
        format.html { render :new }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendas/1
  # PATCH/PUT /agendas/1.json
  def update
    respond_to do |format|
      if @agenda.update(agenda_params)
        format.html { redirect_to @agenda, notice: 'Agenda was successfully updated.' }
        format.json { render :show, status: :ok, location: @agenda }
      else
        format.html { render :edit }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1
  # DELETE /agendas/1.json
  def destroy
    @agenda.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: 'Agenda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agenda_params
      params.require(:agenda).permit(:nome, :sobrenome, :email, :tel_residencial, :tel_celular, :tel_comercial, :user_id)
    end
end
