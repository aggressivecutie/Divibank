# Transfer Controller
class TransfersController < ApplicationController
  def index
    @transfers = Transfer.all
  end

  def show
    @transfer = Transfer.find(params[:id])
  end

  def new
    @transfer = Transfer.new
  end

  def edit
    @transfer = Transfer.find(params[:id])
  end

  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.save
      redirect_to @transfer
    else
      render 'new'
    end
  end

  def destroy
    @transfer = Transfer.find(params[:id]).delete

    redirect_to transfers_path
  end

  private

  def transfer_params
    params.require(:transfer).permit(:amount, :currency, :conversion_rate, sender_acc: [:sent_transfers], recipient_acc: [:received_transfers])
  end

end
