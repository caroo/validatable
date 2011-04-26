module Validatable
  class Errors
    extend Forwardable
    include Enumerable
    attr_accessor :base

    def_delegators :errors, :clear, :each, :each_pair, :empty?, :length, :size, :[]

    # call-seq: on(attribute)
    # 
    # * Returns nil, if no errors are associated with the specified +attribute+.
    # * Returns the error message, if one error is associated with the specified +attribute+.
    # * Returns an array of error messages, if more than one error is associated with the specified +attribute+.
    def on(attribute)
      return nil if errors[attribute.to_sym].nil?
      errors[attribute.to_sym].size == 1 ? errors[attribute.to_sym].first : errors[attribute.to_sym]
    end

    def add(attribute, message) #:nodoc:
      errors[attribute.to_sym] = [] if errors[attribute.to_sym].nil?
      errors[attribute.to_sym] << message
    end

    def merge!(errors) #:nodoc:
      errors.each_pair{|k, v| add(k,v)}
      self
    end

    # call-seq: replace(attribute)
    # 
    # * Replaces the errors value for the given +attribute+
    def replace(attribute, value)
      errors[attribute.to_sym] = value
    end

    # call-seq: raw(attribute)
    # 
    # * Returns an array of error messages associated with the specified +attribute+.
    def raw(attribute)
      errors[attribute.to_sym]
    end
    
    def errors #:nodoc:
      @errors ||= {}
    end

    def count #:nodoc:
      errors.values.flatten.size
    end
    
    def each_full
      each do |attribute, messages|
        messages = [Validatable::Translator.translate_messages(base, attribute, messages)].flatten
        messages.each { |message| yield message}
      end
    end
    
    def each_error
      each do |attribute, messages|
        messages = [Validatable::Translator.translate_messages(base, attribute, messages)].flatten
        messages.each {|message| yield attribute, message}
      end
    end

    # call-seq: full_messages -> an_array_of_messages
    # 
    # Returns an array containing the full list of error messages.
    def full_messages
      full_messages = []
      each_full do |message|
        full_messages << message
      end
      full_messages
    end
    
    def humanize(lower_case_and_underscored_word) #:nodoc:
      lower_case_and_underscored_word.to_s.gsub(/_id$/, "").gsub(/_/, " ").capitalize
    end
  end
end