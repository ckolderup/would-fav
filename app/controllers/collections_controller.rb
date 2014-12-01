class CollectionsController < ApplicationController
  def show
    @collection = Collection.friendly.find(collection_params)

    not_found unless @collection.public? || @collection.visible_to?(current_user)

    #handle renamed collections
    if request.path != collection_path(@collection, params)
      return redirect_to @collection, status: :moved_permanently
    end

    respond_to do |format|
      format.html
      format.text { render text: @collection.tweets.map(&:url).join('\n') }
    end
  end

  private

  def collection_params
    params.require(:slug)
  end
end
