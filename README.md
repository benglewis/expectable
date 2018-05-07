The Expectable gem is used as follows:

1. The given class and it's methods are defined, e.g.:

```ruby
class A
	# Instance method - use include on your instance
	def b
	end

	# Static method - use extend on your class
	def self.b
	end
end
```
2. Include Expectable on this class, e.g.:

```ruby
a = A.new
a.include Expectable
```

or

```ruby
a = A
a.extend Expectable
```
(Note: You don't need to reassign `A`, I simply doing this so that the next step will always work).

3. In a given test case, we would like to expect a method call on an instance of this class, e.g.:

```ruby
def test_a_calls_b
	a.expect(:b, 'my-return-value', ['my-required-input'])
		puts a.b('my-required-input')
	end
end

test_a_calls_b
```

This case would return:

```
my-required-input
=> true
```
