require 'carrierwave/orm/activerecord'

class Photo < ActiveRecord::Base
  belongs_to :user
  mount_uploader :file, PhotoUploader
end
