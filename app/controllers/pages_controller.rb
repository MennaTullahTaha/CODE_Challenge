class PagesController < ApplicationController
    def home
        redirect_to posts_path if logged_in?
    end

    def FAQS
    end 

end
