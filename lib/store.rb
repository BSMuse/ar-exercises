# - Stores must always have a name that is a minimum of 3 characters
# - Stores have an annual_revenue that is a number (integer) that must be 0 or more
# - BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a [custom validation method](http://guides.rubyonrails.org/active_record_validations.html#custom-methods) - **don't** use a `Validator` class)


class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: { minimum: 3 }
  validates :annual_revenue, presence: true, numericality: { only_integer: true }, comparison: { greater_than: :0 }
  validate :must_carry_apparel

  def must_carry_apparel
    unless mens_apparel || womens_apparel
      errors.add(:base, "Store must carry at least one type of apparel (men's or women's)")
    end
end
