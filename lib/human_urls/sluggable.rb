module HumanUrls
  module Sluggable
    extend ActiveSupport::Concern
    include ActiveModel::Dirty

    included do
      before_validation :prepare_slug
    end

    module ClassMethods
      def sluggify(slug_param=:slug, generated_from: false)
        validates_presence_of slug_param
        validates_uniqueness_of slug_param, case_sensitive: false
        validates_length_of slug_param, maximum: 244

        define_method(:to_param) do
          send(slug_param)
        end

        define_method(:prepare_slug) do
          # If these conditions generate slug from auto generated field
          if generated_from.present? && self.send("#{slug_param}").blank?
            # slug equals autogenerated field
            self.send("#{slug_param}=", send(generated_from))
          end
          self.send("#{slug_param}=", send(slug_param).to_s)
          self.send("#{slug_param}=", send(slug_param).parameterize)
        end
      end
    end
  end
end
