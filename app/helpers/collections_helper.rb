module CollectionsHelper
  def curated_by users
    "Curated by " + users.map {|u| link_to "@#{u.name}", u}.to_sentence
  end
end
