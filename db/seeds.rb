# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'CREATING RECIPES'
Recipe.create :name => "Jauhelihakastike", :production_time => 30, :category_id => 1, :private => false, :instruction => "700g jauhelihaa, jauhoja, purkki tomaattisosetta..."
Recipe.create :name => "Perunamuusi", :production_time => 15, :category_id => 1, :private => false, :instruction => "2 litraa vettä ja 2 kiloa perunoita. Keitä perunat, kuori, muussaa perunat "
Recipe.create :name => "Alkusalaatti", :production_time => 10, :category_id => 2, :private => false, :instruction => "Salaattia, tomaattia, kurkkua"
Recipe.create :name => "Mansikkapirtelö", :production_time => 15, :category_id => 3, :private => false, :instruction => "0.5 litraa jäätelöä kulhoon mihin sekaan mansikoita. Sekoita tämän jälkeen ainekset."
Recipe.create :name => "Kaakaojälkkäri", :production_time => 20, :category_id => 3, :private => true, :instruction => "Puol levyy fazerin sinistä ja 0.5l maitoo kattilaan, jossa lämmitetään. Lopuksi kippoon ja kermavaahtoa ja mariannei päälle"
Recipe.create :name => "ES+viinaa", :production_time => 2, :category_id => 4, :private => false, :instruction => "ES ja viinaa sekaisin -> inb4'ei ees maistu' -> puolet ja puolet suhteessa"
Recipe.create :name => "Rommikola", :production_time => 2, :category_id => 4, :private => true, :instruction => "Viina ja kolaa sekaisin. (ylläri?)"


puts 'CREATING USERS'
User.create username:"Div", password:"AAA1", password_confirmation:"AAA1", admin:"true"
User.create username:"Dov", password:"AAA1", password_confirmation:"AAA1", admin:"false"
User.create username:"Dev", password:"AAA1", password_confirmation:"AAA1", admin:"false"

puts 'CREATING USER_RECIPES'
UserRecipe.create :recipe_id => 1, :user_id => 1
UserRecipe.create :recipe_id => 2, :user_id => 1
UserRecipe.create :recipe_id => 3, :user_id => 1
UserRecipe.create :recipe_id => 6, :user_id => 1
UserRecipe.create :recipe_id => 7, :user_id => 1
UserRecipe.create :recipe_id => 2, :user_id => 2
UserRecipe.create :recipe_id => 3, :user_id => 2
UserRecipe.create :recipe_id => 4, :user_id => 2
UserRecipe.create :recipe_id => 5, :user_id => 3
UserRecipe.create :recipe_id => 1, :user_id => 3
UserRecipe.create :recipe_id => 7, :user_id => 3

puts 'CREATING CATEGORIES'
Category.create :name => "Pääruoka", :description => "Kana, liha, kala..."
Category.create :name => "Alkuruoka", :description => "Salaatti esimerkiksi."
Category.create :name => "Jälkiruoka", :description => "Kakut, jäätelöt..."
Category.create :name => "Juomat", :description => "Coctailit esimerkiksi."

puts 'CREATING RATINGS'
Rating.create :score => 10, :recipe_id => 1, :user_id => 1
Rating.create :score => 9, :recipe_id => 2, :user_id => 1
Rating.create :score => 8, :recipe_id => 3, :user_id => 1
Rating.create :score => 4, :recipe_id => 4, :user_id => 1
Rating.create :score => 3, :recipe_id => 5, :user_id => 1
Rating.create :score => 10, :recipe_id => 1, :user_id => 1
Rating.create :score => 4, :recipe_id => 2, :user_id => 1
Rating.create :score => 2, :recipe_id => 3, :user_id => 2
Rating.create :score => 4, :recipe_id => 4, :user_id => 2
Rating.create :score => 1, :recipe_id => 5, :user_id => 2
Rating.create :score => 4, :recipe_id => 1, :user_id => 2
Rating.create :score => 1, :recipe_id => 2, :user_id => 3
Rating.create :score => 9, :recipe_id => 3, :user_id => 3
Rating.create :score => 7, :recipe_id => 4, :user_id => 3
Rating.create :score => 6, :recipe_id => 5, :user_id => 3
Rating.create :score => 5, :recipe_id => 1, :user_id => 3
Rating.create :score => 10, :recipe_id => 7, :user_id => 1