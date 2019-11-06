class UpdateAllSourcesWorker
    include Sidekiq::Worker

    def perform(options = {})
        Source.find_each do |source|
            NewsFeedUpdateWorker.perform_async(
                source.id,
                source.category.id,
                source.feed_url,
                source.feed_options
            )
        end
    end
end
