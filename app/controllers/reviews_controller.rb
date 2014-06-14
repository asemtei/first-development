class ReviewsController < ApplicationController
before_action :movie_var


	def index
		  @reviews = (@movie.reviews).created
	end

	def new
		  @reviews = @movie.reviews.new
	end

  	def destroy
		  @reviews = @movie.reviews.find(params[:id])
		  @reviews.destroy
		  redirect_to movie_reviews_path(@movie), alert: "Review successfully deleted!"
  	end

	def create
		  @reviews = @movie.reviews.new(review_params)
		  if @reviews.save
		  redirect_to movie_reviews_path(@movie),
		  notice: 'Thanks for your review!'
		else
		  render :new
		end
	end

	def edit
  		 @reviews = @movie.reviews.find(params[:id])
	end
	
	def update
		 @reviews = @movie.reviews.find(params[:id])
	 	if @reviews.update(review_params)
		  redirect_to movie_reviews_path, notice: "Review successfully updated!"
		else
	    render :edit
	  	end
	end

	private

	def review_params
    params.require(:review).permit(:name, :stars, :comment)
  	end

  	def movie_var
		  @movie = Movie.find(params[:movie_id])
	end	  
end
