class Trade < ApplicationRecord
  has_one_attached :screen
  has_one_attached :screen_sentiment_mn
  has_one_attached :screen_sentiment_w1
  has_one_attached :screen_sentiment_d1
  has_one_attached :screen_sentiment_h4
  has_one_attached :screen_sentiment_h1

  # This directive enables Filterrific for the Student class.
  # We define a default sorting by most recent sign up, and then
  # we make a number of filters available through Filterrific.
  filterrific(
    default_filter_params: { sorted_by: "risultato_desc" },
    available_filters: [
      :sorted_by,
      :search_query,
    ],
  )

  # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
  scope :search_query, ->(query) {
    return nil  if query.blank?


  }
  scope :sorted_by, ->(sort_option) {
    # extract the sort direction from the param value.
     direction = /desc$/.match?(sort_option) ? "desc" : "asc"
     case sort_option.to_s
     when /^risultato_/
       order("LOWER(trades.risultato) #{direction}, trades.data_micro desc")
     when /^esecuzione_/
       order("LOWER(trades.esecuzione) #{direction}, trades.data_micro desc")
     when /^data_micro_/
       order("trades.data_micro #{direction}")
     when /^resa_/
       order("trades.resa #{direction}")
     when /^symbol_/
       order("LOWER(trades.symbol) asc, trades.data_micro #{direction}")
     else
       raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
     end
  }

  # This method provides select options for the `sorted_by` filter select input.
  # It is called in the controller as part of `initialize_filterrific`.
  def self.options_for_sorted_by
    [
      ["symbol", "symbol_asc"],
      ["Risultato mancante sopra", "risultato_desc"],
      ["Esecuzione", "esecuzione_asc"],
      ["Data micro new->old", "data_micro_desc"],
      ["Data micro old->new", "data_micro_asc"],
      ["Resa cresente", "resa_asc"],
      ["Resa decresente", "resa_desc"],
    ]
  end

end
