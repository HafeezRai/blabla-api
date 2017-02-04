# frozen_string_literal: true
module API
  module PaginationHelpers
    extend Grape::API::Helpers

    def kaminari_params(collection, extra_meta = {})
      {
        current_page: collection.current_page,
        next_page: collection.next_page,
        prev_page: collection.prev_page,
        total_pages: collection.total_pages,
        total_count: collection.total_count,
      }.merge(extra_meta)
    end

    def paginated_results(results, page, per = 25)
      return { collection: results, meta: {} } if page.nil?

      collection = results.page(page).per(per)
      {
        collection: collection,
        meta: kaminari_params(collection),
      }
    end

    def serialized_paginated_results(results, serializer, options = {})
      collection = results.page(options[:page]).per(options[:per])
      serialized = ActiveModel::Serializer::CollectionSerializer.new(
        collection,
        serializer: serializer,
      )
      render items: serialized, meta: kaminari_params(collection)
    end
  end
end