# Stripe api base

## How to use

1. Clone this repo
1. Install PostgreSQL in case you don't have it
1. Create your `database.yml` and `application.yml` file
1. `bundle install`
1. Generate a secret key with `rake secret` and paste this value into the `application.yml`.
1. Run `yarn` to install webpack needs
1. `rails db:create db:migrate`
1. `rspec` and make sure all tests pass
1. `rails s`
1. You can now try your REST services!

## Optional configuration

- Set your [frontend URL](https://github.com/cyu/rack-cors#origin) in `config/initializers/rack_cors.rb`
- Set your mail sender in `config/initializers/devise.rb`
- Config your timezone accordingly in `application.rb`.

## Code quality

With `rake code_analysis` you can run the code analysis tool, you can omit rules with:

- [Rubocop](https://github.com/bbatsov/rubocop/blob/master/config/default.yml) Edit `.rubocop.yml`
- [Reek](https://github.com/troessner/reek#configuration-file) Edit `config.reek`
- [Rails Best Practices](https://github.com/flyerhzm/rails_best_practices#custom-configuration) Edit `config/rails_best_practices.yml`
- [Brakeman](https://github.com/presidentbeef/brakeman) Run `brakeman -I` to generate `config/brakeman.ignore`
- [Bullet](https://github.com/flyerhzm/bullet#whitelist) You can add exceptions to a bullet initializer or in the controller

## Configuring Code Climate
1. After adding the project to CC, go to `Repo Settings`
1. On the `Test Coverage` tab, copy the `Test Reporter ID`
1. Replace the current value of `CC_TEST_REPORTER_ID` on the `config.yml file (.circleci/config.yml)` with the one you copied from CC
