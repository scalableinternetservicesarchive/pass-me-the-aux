module SessionsHelper
    def logged_in?
        (session.has_key? :user) && !(User.find_by(id: session[:user_id]).nil?)
    end

    def current_user
        @current_user = @current_user || User.find_by(id: session[:user_id])
    end

    def recommendations
        @recommendations = Recommendation.where(requestor_id: session[:user_id]).where.not(url_to_song: nil).all
    end
end
