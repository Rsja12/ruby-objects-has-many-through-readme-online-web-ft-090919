class Waiter

    attr_accessor :name, :yrs_experience
 
  @@all = []
 
  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end
 
  def self.all
    @@all
  end

  def new_meal(customer, total, tip = 0)
    Meal.new(self, customer, total, tip)
  end

  def meals 
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
   best_tipped_meal = meals.max do |meal1, meal2|
    meal1.tip <=> meal2.tip
   end
   best_tipped_meal.customer 
  end

end