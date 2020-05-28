class Vendor::BaseController < ApplicationController
    before_action :authenticate_vendor!

    private
  
    def pundit_user
      # https://github.com/varvet/pundit/blob/df96d2ae6bcf28991c1501d5ff0bde4c42aa4acd/lib/pundit.rb#L317-L319
      
      # by default this will be `current_user`
      # we need to override it because this controller is for vendors
      
      current_vendor
    end
end