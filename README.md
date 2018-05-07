The Expectable gem is used as follows:

1. The given class and it's methods are defined, e.g.:

```ruby
class A
	def b
	end
end
```
2. In a given test case, we would like to expect a method call on an instance of this class, e.g.:

```ruby
def test_a_calls_b
	A.expect(:b, 'my-return-value', ['my-required-input'])
		a = A.new
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
