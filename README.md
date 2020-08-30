# simple_strong_password

Simple password strength validator.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_strong_password'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simple_strong_password

## Usage

```ruby
class User < ApplicationRecord
  validates :password, strong_password: true
  # Specifies the required char category count. Defaults to 3.
  # validates :password, strong_password: { required_char_category_count: 2 }
end
```
