require 'rails_helper'

RSpec.describe Source, type: :model do
  it "should be able to create a source" do
    # Teste simples que deve verificar se é salvo no banco com o
    # uso do comando "Create"
    source = Source.create( name:"fonte",
                          # TODO A gente já tem um padrão?
                          language: "PT-BR",
                          homepage_url: "www.juropordeus.com")
    expect(Source.find_by(name: "fonte")).equal? source
  end
end
