class Tweet < ActiveRecord::Base
  belongs_to :collection

  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https))
  #TODO: validate that the url is a twitter permalink

end
