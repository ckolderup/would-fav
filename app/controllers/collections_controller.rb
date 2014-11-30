class CollectionsController < ApplicationController
  def show
    @collection = Collection.friendly.find(collection_params)

    #handle renamed collections
    if request.path != collection_path(@collection)
      return redirect_to @collection, status: :moved_permanently
    end
  end

  private

  def collection_params
    params.require(:slug)
  end
end
