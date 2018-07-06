class EscapesController < ApplicationController
  before_action :set_escape, only: [:edit, :update]

  # GET /escapes
  # GET /escapes.json
  def index
    @escapes = Escape.successful.with_organiser
  end

  # GET /escapes/new
  def new
    @escape = Escape.new
  end

  # GET /escapes/1/edit
  def edit
  end

  # POST /escapes
  # POST /escapes.json
  def create
    @escape = Escape.new(create_escape_params)

    respond_to do |format|
      if @escape.save
        if @escape.success?
          format.html { redirect_to action: :edit, id: @escape.id }
        else
          @escape.error_message || 'Good try but without success ,-)'
          @escape = Escape.new(create_escape_params)

          format.html { render :new }
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /escapes/1
  # PATCH/PUT /escapes/1.json
  def update
    respond_to do |format|
      if @escape.update(update_escape_params)
        if @escape.success?
          format.html { redirect_to action: :index, notice: 'Escape was successfull!' }
        else
          format.html { render :new, notice: 'Escape failed ;(' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_escape
      @escape = Escape.find(params[:id])
    end

    def create_escape_params
      params.require(:escape).permit(:payload)
        .merge(ip_address: request.remote_ip)
    end

    def update_escape_params
      params.require(:escape).permit(:organiser)
    end
end
