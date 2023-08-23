class BidsController < ApplicationController
  before_action :get_item
  before_action :set_bid, only: %i[ create show edit update destroy ]
  before_action :authenticate_user!

  # GET /bids or /bids.json
  def index
    @bids = @item.bids
  end

  # GET /bids/1 or /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    # @bid = Bid.new
    @bid = @item.bids.build
  end

  # GET /bids/1/edit
  def edit
  end

  # POST /bids or /bids.json
  def create
    @bid = @item.bids.build(bid_params)

    respond_to do |format|
      if @bid.save
        format.html { redirect_to item_bids_path(@bid), notice: "Bid was successfully created." }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1 or /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to item_bids_path(@bid), notice: "Bid was successfully updated." }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1 or /bids/1.json
  def destroy
    @bid.destroy

    respond_to do |format|
      format.html { redirect_to item_bids_path(@bid), notice: "Bid was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = @item.bids.find(params[:id])
      # @itemid = Item.find(params[:id])
      # @userid = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bid_params
      params.require(:bid).permit(:amount, :item_id, :user_id)
    end

    def get_item
      @item = Item.find(params[:item_id])
    end

end
