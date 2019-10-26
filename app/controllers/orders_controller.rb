class OrdersController < ApplicationController

    before_action :authenticate_user!,only: [:index,:create_session]
    skip_before_action :verify_authenticity_token, only: [:stripe_webhook]

    def index
        @orders = current_user.orders


        if params[:checkout] == 'success'
            flash[:notice] = 'Payment is Successful'
        end
    end
    
    def create_session
        @product = Product.find(params[:id])
        @order = @product.orders.new(status: 'session_initiated',paid: false,user_id: current_user.id)
        respond_to do |f|
            if @order.save
                @session = Stripe::Checkout::Session.create(
                    payment_method_types: ['card'],
                    client_reference_id: @order.id,
                    line_items: [{
                        name: @product.name,
                        # description: 'Comfortable cotton t-shirt',
                        # images: ['https://example.com/t-shirt.png'],
                        amount: (@product.price * 100).to_i,
                        currency: 'usd',
                        quantity: 1,
                    }],
                    success_url: orders_url({checkout: 'success'}),
                    cancel_url: products_url({checkout: 'failure'}),
                )
                f.js {}
            else
                f.js {}
            end
        end
            
    end

    def stripe_webhook
        type = params["type"]
        if type == 'checkout.session.completed'
            client_reference_id = params.dig("data","object","client_reference_id")
            if client_reference_id.present?
                order = Order.find(client_reference_id.to_i)
                if order.present?
                    order.completed!
                    order.update(paid: true)
                end
            end
        end
    end
end
