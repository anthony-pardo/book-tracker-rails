# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - User has many reviews
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Review belongs_to user and belongs_to book
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - User has_many books through reviews; Genre has_many users through books
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - User has_many genres through books; Genre has_many users through books
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - genre name is user submittable
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - validations on User, Book, Genre, Comment, and Review
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - User.most_books URL: /users/most_books implemented
- [x] Include signup (how e.g. Devise) - implemented with Devise
- [x] Include login (how e.g. Devise) - implemented with Devise
- [x] Include logout (how e.g. Devise) - implemented with Devise
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - implemented with Devise/OmniAuth-Github
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - users/1/books implemented
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - users/1/books/new form implemented
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - form validation errors to form URL /users/1/books/new

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate