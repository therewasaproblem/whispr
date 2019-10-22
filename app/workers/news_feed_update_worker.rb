class NewsFeedUpdateWorker
    include Sidekiq::Worker

    # XXX Usar category_id aqui implica que todas as noticias de
    # uma fonte são/serão da mesma categoria. Algo a pensar.
    def perform(source_id, category_id, feed_url, options = {})
        feed = RSSFeed.new feed_url, options

        feed.items.each do |item|
            news = News.new(
                url: item.link,
                title: item.title,
                summary: item.description,
                source_id: source_id,
                category_id: category_id
            )

            begin
                news.save
            rescue ActiveRecord::RecordNotUnique
                # Ignorar
            rescue ActiveRecord::StatementInvalid => e
                # Permitir apenas este tipo de exceção, que é um registro
                # duplicado que "passou" pelo Rails, mas foi detectado no DB.
                unless e.cause.is_a? ActiveRecord::RecordNotUnique
                    raise
                end
            end
        end
    end
end