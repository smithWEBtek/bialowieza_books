[x] Using Ruby on Rails for the project
[x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
[x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
[x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
[] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. books.quantity)
[] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
[] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
[] Include signup (how e.g. Devise)
[] Include login (how e.g. Devise)
[] Include logout (how e.g. Devise)
[] Include third party signup/login (how e.g. Devise/OmniAuth)
[] Include nested resource show or index (URL e.g. authors/1/books/1)
[] Include nested resource "new" form (URL e.g. users/:user_id/shopping_cart/new)
[] Include form display of validation errors (form URL e.g. /recipes/new)
[] The application is DRY
[] Move logic in controllers to models
[] Use helper methods in controllers as needed for views
[] Views use partials as needed in views

Model Associations:
User
-has_one :cart

Cart(current list)
-belongs_to :user
-has_many :order_items
-has_many :books, through: :order_items

Order_Item(books added to cart, join table between book and cart)
-belongs_to :book
-belongs_to :cart

Book
-belongs_to :author
-has_many :order_items
-has_many :carts, through: :order_items

Author
-has_many :books
