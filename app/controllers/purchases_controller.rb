class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]
  before_action :set_category, only: %i[new index create show edit update destroy]
  authorize_resource

  # GET /purchases or /purchases.json
  def index
    @purchases = @category.purchases
  end

  # GET /purchases/1 or /purchases/1.json
  def show; end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @purchase = @category.purchases.create(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to group_purchases_path, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to group_purchases_path, notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.html { redirect_to group_purchases_path, notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def set_category
    @category = Group.find(params[:group_id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount).merge(author_id: current_user.id)
  end
end
