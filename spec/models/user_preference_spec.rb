require 'rails_helper'

RSpec.describe UserPreference, type: :model do
  it "should create a relation with existing references" do
    # Para conseguir criar esse teste, precisamos definir
    # objetos que de fato existam.
    user = User.create(username:"test",
                    password: "senhaComplicada",
                    email: "test@test.com")
    category = Category.create( tag:"test",
                                description: "Categoria teste")

    user_p = UserPreference.new user_id: user.id,
                                category_id: category.id

    expect(user_p.save).to be true
  end
end
