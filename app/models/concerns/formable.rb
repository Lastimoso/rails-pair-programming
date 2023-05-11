# frozen_string_literal: true

module Formable
  extend ActiveSupport::Concern

  module ClassMethods
    private

    def form_to_array(*attributes, **options)
      attributes.each do |attribute|
        define_method :"#{attribute}=" do |value|
          value = value.split(",").map(&:strip) if value.class == String
          value = value&.compact&.reject(&:empty?)
          if self.class.const_defined? attribute.upcase.to_sym
            value &= "#{self.class}::#{attribute.upcase}".constantize
          end

          super(value)
        end
      end
    end
  end
end
