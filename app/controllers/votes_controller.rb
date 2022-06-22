class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @list = List.find(params[:list_id])
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.save
    @list = List.find(params[:list_id])
    redirect_to list_path(@list)
  end

  private

  def vote_params
    params.require(:vote).permit(:content, :list_id, :rating)
  end
end
