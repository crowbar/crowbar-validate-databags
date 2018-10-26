# Crowbar::Validate::Databags

A gem to validate crowbar databags

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crowbar-validate-databags'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crowbar-validate-databags

## Usage

    $ crowbar-validate-databags PATH/TO/DATABAGS/

## Development

To install this gem onto your local machine, run `bundle exec rake install`.

To release a new version, first of all create a new local branch like `git checkout -b feature/version`
for updating the `CHANGELOG.md` (please handle it the same way as in previous
versions) and for raising the version number, you can find the version in
`lib/crowbar/validate/databags/version.rb`.
 
After merging the pull request it's time to build the rubygem and to release it.
This is done automatically by Travis once a git tag is pushed or you can manually run `bundle exec rake release`
on the master branch in order to create the tag (according to `lib/crowbar/validate/databags/version.rb`) 
and push the gem at the same time.

```
$ bundle exec rake release
crowbar-validate-databags 1.0.0 built to pkg/crowbar-validate-databags-1.0.0.gem.
Tagged v1.0.0.
Pushed git commits and tags.
Pushed crowbar-validate-databags 1.0.0 to rubygems.org
```


Last, go to https://github.com/crowbar/crowbar-validate-databags/releases and edit the new release.
Then you should put the latest changelog into the description
form field.
