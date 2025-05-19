def run_tests(test_class)
    instance = test_class.new
    instance.methods.each do |method|
      if method.to_s.start_with?("test_")
        instance.send(method)
      end
    end
  end  

def assert_equal(expected, actual, message)
    if expected != actual
      STDERR.puts message
      STDERR.puts "  Expected: #{expected}"
      STDERR.puts "    Actual: #{actual}"
      STDERR.puts
    end
  end

  class MathTester
    def test_round
      assert_equal(6, 5.6.round, "I tried rounding a float, but I didn't get the value I expected.")
    end
  
    def helper
      raise 'You shouldn\'t see this message because this method should not be automatically called by the test runner.'
    end
  
    def test_max
      assert_equal(3.9, [-1.1, 3.9, 3.1].max, "I tried finding the max of some values, but I didn't get the max I expected.")
    end
  
    def test_plus
      assert_equal(13, 4 + 9, "I tried adding two values, but I didn't get the sum I expected.")
    end
  
    def test_pi
      # This test fails because it's a bad test.
      assert_equal(3, Math::PI, "I tried testing pi, but it wasn't the value I expected.")
    end
  
    def test_minus
        assert_equal(10, 430-420, "I tried testing subtraction, but it wasn't the value I expected.")
    end

    def test_power
        #this test fails because i'm a horrible coder.
        assert_equal(9, 2 ** 3, "I tried testing exponentioation, but it wasn't the power I expected.")
    end

    def test_sqrt
        #this test fails because i'm a horrible coder.
        assert_equal('eight somethin\'', Math.sqrt(69), "The square root of sixty-nine is eight somethin’, right? ’Cause I’ve been tryna work it out, oh")
    end
  end

run_tests(MathTester)