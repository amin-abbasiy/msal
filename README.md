# MSAL

MS Graph Authentication Library

## Installation

### On the system

```ruby
gem install msal
```

### On your project

Add this line to your application's Gemfile:

```ruby
gem 'msal', '~> 0.14.2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install msal

## Usage

Library is Under development and not ready to use, any kinds of contribution will be appreciated

### Authorization & Token

By below instructions you can create authorization url for starting process
```ruby
::Msal::Auth.new(
    client_id: "your_client_id",
    tenant: "your_tenant",
    response_type: "`code` by default",
    response_mode: "`query` by default",
    scope: "your_defined_scope",
    redirect_uri: "your_redirect_uri",
    state: "optional to keep request state and prevent attack"
)
```
Then with response data you are able to make request for token

```ruby
::Msal::Token.new(
        client_id: '11111111-1111-1111-1111-111111111111',
        scope: 'user.read mail.read',
        code: '9a7daa06-9ac9-45ef-bd99-471392fb37a3',
        redirect_uri: 'http://localhost/app',
        grant_type: 'authorization_code',
        client_secret: '9a7daa06-9ac9-45ef-bd99-471392fb37a3'
)
```

Is also possible to pass `tenant` as second argument if you are not using `common` tenant.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amin-abbasiy/msal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/msal/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Msal project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/msal/blob/master/CODE_OF_CONDUCT.md).
