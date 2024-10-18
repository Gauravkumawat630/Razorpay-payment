class PaymentsController < ApplicationController
  def new
     end

  def create
    begin
      razorpay_order = Razorpay::Order.create({
        amount: params[:amount].to_i * 100, 
        currency: 'INR',
        receipt: SecureRandom.hex(10), 
      })

      redirect_to payment_success_path
    rescue Razorpay::BadRequestError => e
      flash[:error] = "Payment failed: #{e.message}"
      redirect_to new_payment_path
    end
  end
  def success
    begin
      @orders = Razorpay::Order.all.items
    rescue Razorpay::BadRequestError => e
      flash[:error] = "Failed to fetch orders: #{e.message}"
      @orders = []
    end
  end
  
  
  
end