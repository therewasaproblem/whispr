require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be able to create a user" do
    # Teste simples que deve verificar se um usuário é salvo no banco com o
    # uso do comando "Create"
    user = FactoryBot.create(:user)
    expect(User.find_by(username: user.username)).equal? user
  end
end
