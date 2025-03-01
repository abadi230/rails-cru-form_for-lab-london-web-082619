class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def show
        @genre = set_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(genre_params(:name))

        redirect_to genre_path(@genre)
    end

    def edit
        @genre = set_genre
    end

    def update
        @genre = set_genre
        @genre.update(genre_params(:name))

        redirect_to genre_path(@genre)
    end

    def destroy
       Genre.destroy(params[:id])

        redirect_to genres_path
    end

    private
    def set_genre
        @genre =Genre.find(params[:id])
    end

    def genre_params(*args)
        params.require(:genre).permit(:name)
    end
end
