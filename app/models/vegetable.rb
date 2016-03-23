class Vegetable < ActiveRecord::Base
  belongs_to :supplier
  has_many :orders
  has_many :images
  has_many :categorized_vegetables
  has_many :categories, through: :categorized_vegetables

  def health_benefits_list
    if health_benefits
      health_benefits.split(', ')
    else
      ["N/A"]
    end
  end

  def friendly_updated_at
    updated_at.strftime("%b %e, %l:%M %p")
  end

  def sale_message
    if price < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    price * 0.09 
  end

  def total_cost
    price + tax
  end
end