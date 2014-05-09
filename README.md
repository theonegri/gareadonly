# Google Analytics API Read-only

GAReadOnly is a simple wrapper to get the data out of google analytics using the API.

In order to make the gem works, you'll few configuration steps to do in your Google API Console.

Currently only one method works(The only one I really needed so bad) but I'll add more method). Eventually the gem might became a full wrapper with write/delete/modify actions

## Installation

Add this line to your application's Gemfile:

    gem 'gareadonly'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gareadonly

## Configuration

To install the initializer file execute:

    $ rails g gareadonly

## Usage

    GAReadonly.connect
    pageviews = GAReadonly.get_analytics_data({'start-date' => '2014-01-01', 'end-date' => 'yesterday', 'metrics' => 'ga:pageviews', 'dimensions' => 'ga:date'})
    puts "We had #{pageviews.totalsForAllResults['ga:pageviews']} since the 2014-01-01'
    
To connect to the Google API, you'll  need to run `GAReadonly.connect`. In therory you only need to run it ounce. The connection is persistant.

Currently the only query available is `get_analytics_data`. It takes an hash as argument. The following hash will retrieve all the page views since the begining of the year 2014 `GAReadonly.get_analytics_data({'start-date' => '2014-01-01', 'end-date' => 'yesterday', 'metrics' => 'ga:pageviews', 'dimensions' => 'ga:date'})`

## Contributing

If You want more features, please let me know. Thanks.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
