class ReviewsController < ApplicationController
    before_action :authenticate_user!

    def create
      camp = Camp.find(params[:camp_id])
      review = camp.reviews.build(review_params) #buildを使い、contentとcamp_idの二つを同時に代入
      review.user_id = current_user.id
      if review.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def review_params
        params.require(:review).permit(:content)
      end
end
  
