class BookSuggestionsController < ApiController
  def create
    suggestions = BookSuggestion.new(suggestions_params)
    if suggestions.save
      render json: suggestions, status: :created
    else
      render json: { error: suggestions.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def suggestions_params
    params.require(:book_suggestion)
          .permit(%i[user_id title author link publisher year synopsis price])
  end
end
