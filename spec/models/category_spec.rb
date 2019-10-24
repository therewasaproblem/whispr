require 'rails_helper'

RSpec.describe Category, type: :model do
  it "should be able to create a category" do
    # Teste simples que deve verificar se é salvo no banco com o
    # uso do comando "Create"
    category = Category.create( tag:"test",
                                description: "Categoria teste")
    expect(Category.find_by(tag: "test")).equal? category
  end
end
