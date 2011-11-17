FactoryGirl.define do
  factory :news_article, class: NewsArticle, parent: :document do
    title "news-title"
    body  "news-body"
  end

  factory :draft_news_article, parent: :news_article, traits: [:draft]
  factory :submitted_news_article, parent: :news_article, traits: [:submitted]
  factory :rejected_news_article, parent: :news_article, traits: [:rejected]
  factory :published_news_article, parent: :news_article, traits: [:published]
  factory :deleted_news_article, parent: :news_article, traits: [:deleted]
  factory :archived_news_article, parent: :news_article, traits: [:archived]
end