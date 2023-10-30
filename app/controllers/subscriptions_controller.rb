class SubscriptionsController < ApplicationController
    def create 
        @sub= Subscription.new(sub_params)
        respond_to do |format|
            if @sub.save
                format.turbo_stream
            else
                format.json {render json: @sub.errors, status: :unprocessable_entity}
            end
        end
    end

    private
    def sub_params
        params.require(:subscription).permit(:name, :telegram, :site)
    end
end