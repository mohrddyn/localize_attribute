module Localize
  module LocalizeAttribute
    extend ActiveSupport::Concern

    class_methods do
      def localized_attribute(attr)
        attribute_names.detect do |name|
          name == "#{attr}_#{I18n.locale}"
        end.presence || attr.to_s
      end

      def localize_attribute(attr, languages, options = {})
        define_method("#{attr}") do |lang = nil|
          lang ||= I18n.locale
          try("#{attr}_#{lang}").presence ||
              languages.inject(nil) do |v, l|
                v || send("#{attr}_#{l}").presence
              end
        end

        define_method "#{attr}=" do |value|
          send "#{attr}_#{I18n.locale}=".to_sym, value
        end

        if options[:validate_presence]
          validates_presence_of *(languages.collect do |lang|
                                  "#{attr}_#{lang}".to_sym
                                end)
        end

        if options[:validate_uniqueness]
          validates_uniqueness_of *(languages.collect do |lang|
                                    "#{attr}_#{lang}".to_sym
                                  end)
        end

        if options[:synchronize] || options[:synchronise]
          before_validation "synchronize_#{attr.to_s.pluralize}".to_sym
          define_method "synchronize_#{attr.to_s.pluralize}" do
            languages.each do |lang|
              send "#{attr}_#{lang}=".to_sym, send("#{attr}".to_sym)
            end
          end
          private "synchronize_#{attr.to_s.pluralize}".to_sym
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, Localize::LocalizeAttribute
