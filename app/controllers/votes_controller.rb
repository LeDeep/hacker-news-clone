class VotesController < ApplicationController

  before_filter :authorize, only: [:new, :create]

  def new
    @vote = Vote.new
  end

  def create
    @vote = Link.find(params[:link_id]).votes.create(params[:vote])

    if @vote.save
      flash[:notice] = 'Thanks for voting.'
      redirect_to links_path
    end
  end

  def index
    @votes = Vote.all
  end

end