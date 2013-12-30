# Phantomherd

Phantomherd provides a simple way to launch multiple PhantomJS instances in parallel to run a simple load test on your site.

## Installation

Install via RubyGems:

    $ gem install phantomherd

You'll also need CasperJS, which you can install via Homebrew:

    $ brew install casperjs --devel

## Usage

To run a basic load test, just supply the name of a CasperJS script to run:

    $ phantomherd test.coffee

This will run the specified CasperJS script once in two parallel PhantomJS instances by default and report the results.

### Parameters

You can specify sample size with the `-s` flag, and level of concurrency with the `-c` flag.

    $ phantomherd -s 100 -c 25 test.coffee
    
This will run a total of 100 runs through the specified CasperJS script across 25 concurrent PhantomJS instances.
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
