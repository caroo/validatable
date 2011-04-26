require "test_helper"

class Validatable::TranslatorTest < Test::Unit::TestCase
  include Validatable::Translator
  attr_reader :to_validate
  def setup
    I18n.load_path ||= []
    I18n.load_path << File.join(File.dirname(__FILE__), "../de.yml")
    I18n.locale = :de
    @to_validate = ValidatableClass.new
    @to_validate.valid?
  end

  def test_should_translate_attribute
    assert_equal "Attribut A", translate_attribute(to_validate, :attribute_a) # deep scope given
    assert_equal "Attribut B", translate_attribute(to_validate, :attribute_b) # flat scope given
    assert_equal "Email",      translate_attribute(to_validate, :email)       # no scope given, use humanize
  end
  
  def test_should_translate_message
    assert_equal "Attribut A muss vorhanden sein.", translate_messages(to_validate, :attribute_a, to_validate.errors.on(:attribute_a))
    assert_equal "Attribut B hat ein ungültiges Format(shallow).", translate_messages(to_validate, :attribute_b, to_validate.errors.on(:attribute_b))
    assert_equal ["Email muss vorhanden sein(deep).", "Ihre Email sieht nicht wie eine aus."], translate_messages(to_validate, :email, to_validate.errors.on(:email))
  end
end

class ValidatableClass
  include ::Validatable
  attr_accessor :attribute_a, :attribute_b, :email
  def initialize(attribute_a = nil, attribute_b = nil, attribute_c = nil)
    @attribute_a = attribute_a
    @attribute_b = attribute_b
    @email = email
  end
  
  validates_presence_of :attribute_a, :email
  validates_format_of :attribute_b, :with  => /\S+/
  validates_format_of :email, :with => /email_regex/, :message  => "Ihre Email sieht nicht wie eine aus."
end
