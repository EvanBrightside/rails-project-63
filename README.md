# HexletCode

[![CI status](https://github.com/EvanBrightside/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/EvanBrightside/rails-project-63/actions/workflows/main.yml)
[![Hexlet Check](https://github.com/EvanBrightside/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/EvanBrightside/rails-project-63/actions/workflows/hexlet-check.yml)

Form Generator – DSL that makes it easy to generate forms.
This gem takes care of tasks that would normally require writing a lot of boilerplate code.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code --git 'https://github.com/EvanBrightside/rails-project-63.git'

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install specific_install
    $ gem specific_install -l 'https://github.com/EvanBrightside/rails-project-63.git'

## Usage

```ruby
require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'Mitch', job: 'Github', gender: 'm'

HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end

# <form action="#" method="post">
#  <label for="job">Job</label>
#  <textarea name="job" cols="50" rows="50">Github</textarea>
# </form>

user = User.new job: 'Github'
HexletCode.form_for user, url: '#' do |f|
  f.input :name
  f.input :job
  f.submit 'Wow'
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text" value="">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="Github">
#   <input type="submit" value="Wow">
# </form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/EvanBrightside/rails-project-63. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/EvanBrightside/rails-project-63/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/EvanBrightside/rails-project-63/blob/main/CODE_OF_CONDUCT.md).
