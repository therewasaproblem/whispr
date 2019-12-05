class CategoryController < ActionController::Base
    def index
	@user = current_user
	@category_list = Category.all
	@checked = 
        render "index", layout: "application"
	
    end
    def submit
	preferences = params[:categories_ids]
	current_user.category_ids= preferences
	current_user.save
	redirect_to action: "prefered_search", controller: "news"
    end
end
