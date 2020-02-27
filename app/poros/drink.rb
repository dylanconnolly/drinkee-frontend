class Drink
  attr_reader :name,
              :category,
              :alcoholic,
              :glass,
              :instructions,
              :image,
              :ingredient_1,
              :ingredient_2,
              :ingredient_3,
              :ingredient_4,
              :ingredient_5,
              :ingredient_6,
              :ingredient_7,
              :ingredient_8,
              :ingredient_9,
              :ingredient_10,
              :ingredient_11,
              :ingredient_12,
              :ingredient_13,
              :ingredient_14,
              :ingredient_15,
              :measurement_1,
              :measurement_2,
              :measurement_3,
              :measurement_4,
              :measurement_5,
              :measurement_6,
              :measurement_7,
              :measurement_8,
              :measurement_9,
              :measurement_10,
              :measurement_11,
              :measurement_12,
              :measurement_13,
              :measurement_14,
              :measurement_15

  def initialize(drink_data)
    @name = drink_data[:attributes][:name]
                @category = drink_data[:attributes][:category]
                @alcoholic = drink_data[:attributes][:alcoholic]
                @glass = drink_data[:attributes][:glass]
                @instructions = drink_data[:attributes][:instructions]
                @image = drink_data[:attributes][:image]
                @ingredient_1 = drink_data[:attributes][:ingredient_1]
                @ingredient_2 = drink_data[:attributes][:ingredient_2]
                @ingredient_3 = drink_data[:attributes][:ingredient_3]
                @ingredient_4 = drink_data[:attributes][:ingredient_4]
                @ingredient_5 = drink_data[:attributes][:ingredient_5]
                @ingredient_6 = drink_data[:attributes][:ingredient_6]
                @ingredient_7 = drink_data[:attributes][:ingredient_7]
                @ingredient_8 = drink_data[:attributes][:ingredient_8]
                @ingredient_9 = drink_data[:attributes][:ingredient_9]
                @ingredient_10 = drink_data[:attributes][:ingredient_10]
                @ingredient_11 = drink_data[:attributes][:ingredient_11]
                @ingredient_12 = drink_data[:attributes][:ingredient_12]
                @ingredient_13 = drink_data[:attributes][:ingredient_13]
                @ingredient_14 = drink_data[:attributes][:ingredient_14]
                @ingredient_15 = drink_data[:attributes][:ingredient_15]
                @measurement_1 = drink_data[:attributes][:measurement_1]
                @measurement_2 = drink_data[:attributes][:measurement_2]
                @measurement_3 = drink_data[:attributes][:measurement_3]
                @measurement_4 = drink_data[:attributes][:measurement_4]
                @measurement_5 = drink_data[:attributes][:measurement_5]
                @measurement_6 = drink_data[:attributes][:measurement_6]
                @measurement_7 = drink_data[:attributes][:measurement_7]
                @measurement_8 = drink_data[:attributes][:measurement_8]
                @measurement_9 = drink_data[:attributes][:measurement_9]
                @measurement_10 = drink_data[:attributes][:measurement_10]
                @measurement_11 = drink_data[:attributes][:measurement_11]
                @measurement_12 = drink_data[:attributes][:measurement_12]
                @measurement_13 = drink_data[:attributes][:measurement_13]
                @measurement_14 = drink_data[:attributes][:measurement_14]
                @measurement_15 = drink_data[:attributes][:measurement_15]
  end
end
