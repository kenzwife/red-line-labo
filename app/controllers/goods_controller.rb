class GoodsController < ApplicationController
    def create
        good = current_user.goods.create(camp_id: params[:camp_id]) #user_idとcamp_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        good = Good.find_by(camp_id: params[:camp_id], user_id: current_user.id)
        good.destroy
        redirect_back(fallback_location: root_path)
    end
end
