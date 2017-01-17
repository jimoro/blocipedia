class AmountsController < ApplicationController
  before_action :set_amount, only: [:show, :edit, :update, :destroy]

  # GET /amounts
  def index
    @amounts = Amount.all
  end

  # GET /amounts/1
  def show
  end

  # GET /amounts/new
  def new
    @amount = Amount.new
  end

  # GET /amounts/1/edit
  def edit
  end

  # POST /amounts
  def create
    @amount = Amount.new(amount_params)

    if @amount.save
      redirect_to @amount, notice: 'Amount was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /amounts/1
  def update
    if @amount.update(amount_params)
      redirect_to @amount, notice: 'Amount was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /amounts/1
  def destroy
    @amount.destroy
    redirect_to amounts_url, notice: 'Amount was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amount
      @amount = Amount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def amount_params
      params[:amount]
    end
end
