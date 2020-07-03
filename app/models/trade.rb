class Trade < ApplicationRecord
  has_one_attached :screen
  has_one_attached :screen_sentiment_mn
  has_one_attached :screen_sentiment_w1
  has_one_attached :screen_sentiment_d1
  has_one_attached :screen_sentiment_h4
  has_one_attached :screen_sentiment_h1


end
