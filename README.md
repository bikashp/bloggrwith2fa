# bloggrwith2fa

This is a demo app for 2 factor authentication workflow allowing multiple options (google authenticator app, sms and email. Note: The app is not configured to send authentication code via sms and email, it simply writes the code on the standard output) to get the authentication code. This is a rails 4 app backed by sqlite databse and uses [two_factor_authentication](https://github.com/Houdini/two_factor_authentication) gem. For demo click [here] (https://bloggrwith2fa.herokuapp.com/)

## Setup

1.Clone Repo
```ruby
    git clone git@github.com:bikashp/bloggrwith2fa.git
    cd bloggrwith2fa
```

2.Install dependencies.
```ruby
    bundle install
```

3.Create the database and run migrations
```ruby
    bundle exec rake db:create
    bundle exec rake db:migrate
```
4.Start server
```ruby
    rails s
```
