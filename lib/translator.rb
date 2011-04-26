module Validatable
  module Translator
    VALIDATABLE_MESSAGES = [
      "can't be empty",
      "must be a number",
      "is invalid",
      "doesn't match confirmation",
      "must be accepted"
    ]
    
    module_function
    def translate_messages(base, attribute, messages)
      options = {:attribute => translate_attribute(base, attribute)}
      base_class_name = base.class.name.underscore
      messages = [messages].flatten
      translated = messages.map do |message|
        defaults = [:"models.#{base_class_name}.attributes.#{attribute}.#{message}", 
          :"models.#{base_class_name}.#{message}",
          :"messages.#{message}"]
        defaults << message if message.is_a?(String) && !Validatable::Translator::VALIDATABLE_MESSAGES.include?(message)
        I18n.translate(defaults.shift, options.merge(:default => defaults, :scope => [:validatable, :errors]))
      end
      translated.size == 1? translated.first : translated
    end
    
    def translate_attribute(base, attribute)
      if base.class.respond_to?(:human_attribute_name)
        base.class.human_attribute_name(attribute)
      else
        defaults = [:"attributes.#{base.class.to_s.underscore}.#{attribute}", :"attributes.#{attribute}", attribute.to_s.humanize]
        I18n.translate(defaults.shift, :default => defaults, :scope => [:validatable])
      end
    end
  end
end