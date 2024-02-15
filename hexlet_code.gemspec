# frozen_string_literal: true

require_relative 'lib/hexlet_code/version'

Gem::Specification.new do |spec|
  spec.name = 'hexlet_code'
  spec.version = HexletCode::VERSION
  spec.authors = ['Ivan Zabrodin']
  spec.email = ['xvanx84@gmail.com']

  spec.summary = 'Form Generator – DSL that makes it easy to generate forms.'
  spec.description = 'This gem takes care of tasks that would normally require writing a lot of boilerplate code.'
  spec.homepage = 'https://github.com/EvanBrightside/rails-project-63'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata = {
    'homepage_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => 'https://github.com/EvanBrightside/rails-project-63',
    'changelog_uri' => 'https://github.com/EvanBrightside/rails-project-63'
  }

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
