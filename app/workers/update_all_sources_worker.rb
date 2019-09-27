class UpdateAllSourcesWorker
    include Sidekiq::Worker

    def perform(options = {})
        Source.find_each do |source|
            NewsFeedUpdateWorker.perform_async(
                source.id,
                nil, # FIXME Arrumar um jeito de atribuir categorias as notícias.
                source.feed_url,
                source.feed_options
            )
        end
    end
end