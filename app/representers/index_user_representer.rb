require 'roar/json'

module IndexUserRepresenter
  include Roar::JSON

  property :id
  property :email
  property :full_name
  property :created_at
  property :age
  property :avatar

  def full_name
    first_name.capitalize + ' ' + last_name.capitalize
  end

  def avatar
    super.mini.url || 'https://s3-eu-west-1.amazonaws.com/blabla-clone-app/uploads/user/avatar/placeholder/img_placeholder_avatar_thumb.jpg'
  end
end
