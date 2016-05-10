exercism
    -has_many exercises
exercise
    -belongs_to exercism
    -name: "string"
    -exercism_id: integer

steps
    -modify form
    -modify controller new, create, and params
    -add custom writer

I don't understand why, but the form only seems to be displaying multiple fields  when i have accepts_nested_attributes_for :exercises in the 
You must include a nested form that writes to an associated model through a custom attribute writer. An example of this would be a New Recipe form that allowed you to add ingredients that are unique across recipes (thereby requiring a join model, or imagine being able to see all recipes that include Chicken), along with a quantity or description of the ingredient in the recipe. On this form you would have a series of fields named recipe[ingredient_attributes][0][name] and recipe[ingredient_attributes][0][description] which would write to the recipe model through a method ingredient_attributes=. 

This method cannot be provided via the accepts_nested_attributes_for macro because the custom writer would be responsible for finding or creating a recipe by name and then creating the row in the join model recipe_ingredients with the recipe_id, the ingredient_id, and the description from the form.