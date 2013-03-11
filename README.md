# Kayakoapi-Ruby

Basic ruby gem to generate API signatures compatible with the [Kayako REST API](http://wiki.kayako.com/display/DEV/Kayako+REST+API)

## Installation

Add this line to your application's Gemfile:

    gem 'kayakoapi-ruby'

And then:

    $ bundle install

Or install it yourself as:

    $ gem install kayakoapi-ruby

## Usage

    require 'kayako-ruby'

    generator = KayakoApi.new('http://my.kayako.helpdesk/api', 'my-application-key', 'my-application-secret')

    generator.url
    #=> "http://my.kayako.helpdesk/api/index.php?signature=%57%56%4A%65%4D%65+%31%4A%6B%34%33%4E%32%6C%56%6E/%70%4D%6D%33%5A%57%79%31%4F%51%31%50%62%34%76%67%74%47%41%4E%67%4A%42%35%45=&salt=5870184239&apikey=1234567890"

    generator.signature
    #=> {:signature=>"%61%33%4F%6F%59%39%44%79%71%31%4F%6D%4D%6F%74%7A%47%44%4A%76%37%30%4F%6C%6F%48%74/%79%6D%6F%4C%70%43%77%57%52%57%41%6F%52%45%6B=", :salt=>"5265651781", :apikey=>"my-application-key"}

nb. you will need to add your own controller and action to the url.

If an error occurs, KayakoApi#url will return false.

The salt is randomly generated, but included in the querystring (as per the [Kayako REST API](http://wiki.kayako.com/display/DEV/Kayako+REST+API).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Copyright (c) 2013 Peter Mellett

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.