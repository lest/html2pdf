class WebPagesController < ApplicationController
  inherit_resources
  actions :all, :except => [:edit, :update, :destroy]

  protected
    def collection
      @web_pages ||= end_of_association_chain.paginate(:page => params[:page], :order => 'created_at desc')
    end
end
