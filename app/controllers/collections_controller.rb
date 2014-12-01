class CollectionsController < ApplicationController
  def new
    not_allowed unless current_user

    @collection = Collection.new
  end

  def create
    not_allowed unless current_user

    @collection = Collection.create(collection_params)
    Privilege.create(user: current_user, collection: @collection, level: :owner)

    redirect_to @collection, {notice: 'Created!', status: :see_other}
  end

  def show
    @collection = Collection.friendly.find(params[:slug])

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
    params.require(:collection).permit(:name, :description, :private)
  end
end
