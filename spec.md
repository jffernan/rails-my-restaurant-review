# Specifications for the Rails Assessment

Specs:
- [X] Using Ruby on Rails for the project => done.
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) => done. User has_many Reviews.
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) => done. Review belongs_to User.
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) => done. User has_many Restaurants through Reviews.
- [X] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) => done. Cuisine
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) => done.
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) => done. Filter to see Reviews by User. Top Reviews to see all 'excellent' reviews.
- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item) => done. Restaurant_name
- [X] Include signup => Used gem bcrypt with has_secure_password method in user.rb model and further built out authentication & authorization.
- [X] Include login => Used gem bcrypt with has_secure_password method in user.rb model and further built out authentication & authorization.
- [X] Include logout => Used gem bcrypt with has_secure_password method in user.rb model and further built out authentication & authorization.
- [X] Include third party signup/login (how e.g. Devise/OmniAuth) => done. GitHub Via OmniAuth.
- [X] Include nested resource show or index (URL e.g. users/2/recipes) => done. parent: user => many reviews (child); parent: restaurant => many reviews (child).
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients) => done. parent: user => many reviews (child); parent: restaurant => many reviews (child).
- [X] Include form display of validation errors (form URL e.g. /recipes/new) => done. User Signup & Review New & Edit.

Confirm:
- [X] The application is pretty DRY => done.
- [X] Limited logic in controllers => done.
- [X] Views use helper methods if appropriate => done.
- [X] Views use partials if appropriate => done.
