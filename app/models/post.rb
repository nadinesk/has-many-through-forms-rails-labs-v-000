class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :categories
  accepts_nested_attributes_for :users, reject_if: proc { |attributes| attributes['user_id'].blank? }

   def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def user_attributes=(user_attributes)    
      user = User.find_or_create_by(user_attribute)
      self.users << user
    
  end

end
