class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
  end


  def show
  end

  def new
    @transaction = Transaction.new
    @worker_id = params[:worker_id];
    @company_id = params[:company_id];
    @job_id = params[:job_id];
    
  end

  def edit
  end


  def create
    @transaction = Transaction.new(transaction_params)

      if @transaction.save
        redirect_to jobs_path, notice: 'Transaction was successfully created.' 
      else
        render :new 
      end
    end
  end

  def update
      if @transaction.update(transaction_params)
        redirect_to @transaction, notice: 'Transaction was successfully updated.' 
      else
        render :edit 
    end
  end
 
  def destroy
    @transaction.destroy
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' 
  end

  private
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:company_id, :worker_id, :job_id)
    end
end
