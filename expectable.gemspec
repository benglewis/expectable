Gem::Specification.new do |s|
  s.name        = 'expectable'
  s.version     = '0.1.1'
  s.date        = '2018-05-05'
  s.summary     = "The Expectable gem allows you to expect methods to be called on objects that are not MiniTest::Mock"
  s.description = "This gem extends MiniTest by allowing you to simply include this class on any given class dynamically and expect calls to methods on that class."
  s.authors     = ["Ben Lewis"]
  s.email       = 'hello@blewis.me'
  s.files       = ["lib/expectable.rb"]
  s.homepage    =
    'http://rubygems.org/gems/expectable'
  s.license       = 'MIT'

  s.add_runtime_dependency 'minitest', '~>5.11', '>=5.11'
end
