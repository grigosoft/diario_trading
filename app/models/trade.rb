class Trade < ApplicationRecord
  has_one_attached :screen
  has_one_attached :screen_sentiment_mn
  has_one_attached :screen_sentiment_w1
  has_one_attached :screen_sentiment_d1
  has_one_attached :screen_sentiment_h4
  has_one_attached :screen_sentiment_h1



    # db columns:
    # integer: id
    # string: first_name
    # string: last_name
    # text: email
    # integer: country_id
    # datetime: created_at

    # This directive enables Filterrific for the Student class.
    # We define a default sorting by most recent sign up, and then
    # we make a number of filters available through Filterrific.
    filterrific(
      default_filter_params: { sorted_by: "data_micro_desc" },
      available_filters: [
        :sorted_by,
        :search_query,
        :with_country_id,
        :with_created_at_gte,
      ],
    )

    # ActiveRecord association declarations
    belongs_to :country

    # Scope definitions. We implement all Filterrific filters through ActiveRecord
    # scopes. In this example we omit the implementation of the scopes for brevity.
    # Please see 'Scope patterns' for scope implementation details.
    scope :search_query, ->(query) {
      # Filters students whose name or email matches the query
    }
    scope :sorted_by, ->(sort_key) {
      # Sorts students by sort_key
    }
    scope :with_data_micro_gte, ->(ref_date) {
    }

    # This method provides select options for the `sorted_by` filter select input.
    # It is called in the controller as part of `initialize_filterrific`.
    def self.options_for_sorted_by
      [
        ["Symbol (a-z)", "symbol_asc"],
        ["Registration date (newest first)", "data_micro_desc"],
        ["Registration date (oldest first)", "data_micro_asc"]
      ]
    end

end
