class AddUniqueIndexToNews < ActiveRecord::Migration[5.2]
  def up
    # XXX Não achei uma maneira de fazer isso só com as funções do Rails.
    # Os indices criados por ele falham com dados muito longos (por não conseguir
    # construir o índice), por isso usarei um índice com hash nos campos TEXT.
    
    execute 'CREATE UNIQUE INDEX "index_news_on_url_and_title_and_summary" ' +
      'ON "news" ("url", md5("title"), md5("summary"))'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
