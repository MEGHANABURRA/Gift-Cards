class OrdersController < ApplicationController
    before_action :authorize
    after_action :correct_user
    
    def new
        @order = current_user.orders.build
    end
    
    def create
        @order = current_user.orders.build(order_params)
        @order.delivery_status="Out for delivery"
        @order.order_date=Time.now.strftime("%F")
        if @order.save
            flash[:notice] = "Order placed successfully."
            redirect_to orders_path
        else
            flash.now.alert="Unable to create order."
            render :new
        end
    end

    def show
        @orders = Order.all
    end

    def edit
        @order= Order.find(params[:id])
    end

    def update
        @order=Order.find(params[:id])
        @order.update(delivery_status: params[:order][:delivery_status])
        redirect_to orders_admin_history_path
    end

    def correct_user
        @order= current_user.orders.find_by(id: params[:id])
    end


    private
    def order_params
        params.require(:order).permit(:first_name, :last_name, :value, :mobile, :address, :commission, :user_id)
    end 

end
