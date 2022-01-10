
class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def show
  puts 'show invoked'
  @ideas =Idea.find(params[:id])
  redirect_to root_path
  end
  def create
  @idea = Idea.create(idea_params)
  redirect_to root_path
  end
  def edit
  @idea = Idea.find(params[:id])
  end

  def update
  @idea = Idea.find(params[:id])
  if @idea.update(idea_params)
  redirect_to root_path
  else
  redirect_to edit_idea_path(params[:id])
  end
  end


  def destroy
  puts 'destroy invoked'
  @idea = Idea.find(params[:id])
  @idea.destroy
  redirect_to root_path
  end

  def index
  @ideas = Idea.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  private

  def idea_params
  params.require(:idea).permit(:description, :author)
  end

end