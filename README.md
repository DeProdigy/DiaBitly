# Dia&Co URL Shortener
A simple URL shortener and redirect app

## Setup
```
$ bundle install
$ rake db:create
$ rake db:migrate
```

## To run the specs
`$ rspec spec`

## To run the server
`$ rails s`

## Possible improvements

* Use `FactoryGirl` for tests
* Make sure `ShortUrlGenerator` retries a with a different `:redirect_id` if the validation fails. With enough traffic there might be a collision because the `RedirectUrlGenerator` returns an ID based on time.
