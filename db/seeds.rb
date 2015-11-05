User.destroy_all
Hat.destroy_all
Recipe.destroy_all
Membership.destroy_all
Comment.destroy_all

users = [{
  first_name: "Tara",
  last_name: "Strauss",
  email: "tamist@gmail.com",
  password: 'Foxypoodle23',
  password_confirmation: 'Foxypoodle23',
  username: "Tamist",
  image_file_name: "headshot.jpg"
  },
  {
  first_name: "Foxy",
  last_name: "Poodle",
  email: "foxy@poodle.com",
  password: 'cute',
  password_confirmation: 'cute',
  username: "Foxy",
  image_file_name: "foxy.jpg"
  }]

User.create users

hats = [{
  name: "Tara and Foxy",
  user_id: 1
  }]

Hat.create hats

memberships = [{
  user_id: 1,
  hat_id: 1
  },
  {
  user_id: 2,
  hat_id: 1
  }]

Membership.create memberships

recipes = [{
  instructions: "make the food!",
  cook_method: "oven",
  cook_time: "forever",
  user_id: 1,
  hat_id: 1,
  name: "yummy food",
  cook_temp: "300 degrees",
  ingredients: "food\r\nmore food"
  }]

Recipe.create recipes


