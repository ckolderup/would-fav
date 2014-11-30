class TweetsController < ApplicationController
  def create
    collection = Collection.friendly.find(collection_params)

    not_allowed unless current_user

    privs = Privilege.where(user: current_user).where(collection: collection).last
    not_allowed unless privs.present?
    not_allowed unless [:add, :edit, :owner].to_s.include?(privs.level)

    not_found unless collection.present?

    tweet = Tweet.create(url: params[:url], collection: collection)
    redirect_to collection, {notice: 'Added!', status: :see_other}
  end

  private

  def collection_params
    params.require(:collection_slug)
  end
end
