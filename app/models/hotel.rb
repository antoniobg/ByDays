class Hotel < ActiveRecord::Base

  # Relationships
  has_many :room_types, dependent: :destroy
  
  def to_s
    name
  end
end
