Toolchain:

* Rbenv or some .ruby-version-compatible library
* Bundler
* Foreman
* Rails 4

You need a .env file to run this. Current keys:

Key             |  Value
----------------|----------------------------------
CONSUMER_KEY    | Twitter application consumer key
CONSUMER_SECRET | Twitter application consumer secret
SECRET_KEY_BASE | standard Rails secret key, `rake secret` to generate
