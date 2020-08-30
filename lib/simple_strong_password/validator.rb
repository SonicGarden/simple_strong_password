require 'active_model'

module ActiveModel
  module Validations
    class StrongPasswordValidator < ActiveModel::EachValidator
      SYMBOL_CHARACTERS = %( !”#$%&’()*+,-./:;<=>?@[\]^_`{|}~).freeze
      SYMBOL_REGEXP = Regexp.new("[#{Regexp.escape(SYMBOL_CHARACTERS)}]")
      DEFAULT_REQUIRED_CHAR_CATEGORY_COUNT = 3

      def initialize(options)
        default_options = {
          required_char_category_count: DEFAULT_REQUIRED_CHAR_CATEGORY_COUNT,
        }
        super(default_options.merge(options))
      end

      def validate_each(record, attribute, value)
        return if value.nil?

        validate_charcter_categories(record, attribute, value)
      end

      def self.patterns
        [
          /[a-z]/,
          /[A-Z]/,
          /\d+/,
          SYMBOL_REGEXP,
        ]
      end

      private

      def validate_charcter_categories(record, attribute, value)
        char_category_count = self.class.patterns.count { |pattern| pattern.match?(value) }

        if char_category_count < options[:required_char_category_count]
          record.errors.add(attribute, :insufficient_password_characters, required_char_category_count: options[:required_char_category_count])
        end
      end
    end
  end
end
