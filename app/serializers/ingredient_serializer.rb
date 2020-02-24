class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :id
end
