# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{validatable}
  s.version = "1.6.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jay Fields"]
  s.date = %q{2011-04-26}
  s.description = %q{Validatable is a library for adding validations.}
  s.email = %q{validatable-developer@rubyforge.org}
  s.extra_rdoc_files = ["README"]
  s.files = ["lib/child_validation.rb", "lib/errors.rb", "lib/included_validation.rb", "lib/macros.rb", "lib/object_extension.rb", "lib/requireable.rb", "lib/translator.rb", "lib/understandable.rb", "lib/validatable.rb", "lib/validatable_class_methods.rb", "lib/validatable_instance_methods.rb", "lib/validations/validates_acceptance_of.rb", "lib/validations/validates_confirmation_of.rb", "lib/validations/validates_each.rb", "lib/validations/validates_format_of.rb", "lib/validations/validates_length_of.rb", "lib/validations/validates_numericality_of.rb", "lib/validations/validates_presence_of.rb", "lib/validations/validates_true_for.rb", "lib/validations/validation_base.rb", "test/functional/validatable_test.rb", "test/functional/validates_acceptance_of_test.rb", "test/functional/validates_confirmation_of_test.rb", "test/functional/validates_each_test.rb", "test/functional/validates_format_of_test.rb", "test/functional/validates_length_of_test.rb", "test/functional/validates_numericality_of_test.rb", "test/functional/validates_presence_of_test.rb", "test/functional/validates_true_for_test.rb", "test/test_helper.rb", "test/unit/errors_test.rb", "test/unit/translator_test.rb", "test/unit/understandable_test.rb", "test/unit/validatable_test.rb", "test/unit/validates_acceptance_of_test.rb", "test/unit/validates_confirmation_of_test.rb", "test/unit/validates_format_of_test.rb", "test/unit/validates_length_of_test.rb", "test/unit/validates_numericality_of_test.rb", "test/unit/validates_presence_of_test.rb", "test/unit/validates_true_for_test.rb", "test/unit/validation_base_test.rb", "rakefile.rb", "README"]
  s.homepage = %q{http://validatable.rubyforge.org}
  s.rdoc_options = ["--title", "Validatable", "--main", "README", "--line-numbers"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{validatable}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Validatable is a library for adding validations.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
