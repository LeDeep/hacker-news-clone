class LinksController < ApplicationController


  def new
    @link = Link.new
  end

  def create
    @link = Link.create(params[:link])

    if @link.save
      flash[:notice] = 'Your link was successfully created.'
      redirect_to links_path
    else
      render :new
      flash[:alert] = 'That is an invalid link. Please try again.'
    end

  end

  def index
    @links = Link.all
  end

end