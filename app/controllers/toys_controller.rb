class ToysController < ApplicationController
  wrap_parameters format: []

  # GET /toys
  def index
    toys = Toy.all
    render json: toys
  end

  # GET /toys/:id
  def show
    toy = Toy.find_by(id: params[:id])
    render json: toy
  end

  # POST /toys
  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  # PATCH /toys/:id
  def update
    toy = Toy.find_by(id: params[:id])
    if toy
      toy.update(toy_params)
    else
      render json: { error: "Toy not found"}, status: :not_found
    end
  end

  # DELETE /toys/:id
  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  def increment_likes
    toy = Toy.find_by(id: params[:id])
    if toy
      toy.update(likes: toy.likes + 1)
      render json: toy
    else
      render json: { error: "Toy not found" }, status: :not_found
    end
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
