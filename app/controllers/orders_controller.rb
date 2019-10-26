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
      product = Product.find(params[:id])
      respond_to do |f|
        @session = UserOrderSession.new(product, current_user).call
        f.js {}
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
