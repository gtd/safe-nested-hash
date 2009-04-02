require 'test_helper'

class SafeNestedHashTest < Test::Unit::TestCase
  context "empty safe_nested_hash" do
    setup do
      @hash = SafeNestedHash.new
    end

    should "return an undefined hash for key" do
      assert_equal SafeNestedHash::UndefinedHash, @hash[1].class
    end

    should "return an undefined_hash for nested key" do
      assert_equal SafeNestedHash::UndefinedHash, @hash[1][2].class
    end

    should "define a key" do
      @hash[1] = 'a'
      assert_equal 'a', @hash[1]
    end

    should "define a nested key" do
      @hash[1][2][3] = 'c'
      assert_equal 'c', @hash[1][2][3]
    end
  end

  context "nested safe_nested_hash" do
    setup do
      @hash = SafeNestedHash.new
      @hash[1][2][3] = 'a'
      @hash[2] = 'b'
    end

    should "return an undefined hash for new nested key" do
      assert_equal SafeNestedHash::UndefinedHash, @hash[3][4].class
    end

    should "return an undefined hash for partially defined nested key" do
      assert_equal SafeNestedHash::UndefinedHash, @hash[1][4].class
    end

    should "not clobber existing value when adding to a partial chain" do
      @hash[1][2][4][5] = 'c'
      assert_equal 'c', @hash[1][2][4][5]
    end

    should "not clobber existing value when adding to a partial chain" do
      @hash[1][2][4][5] = 'c'
      assert_equal 'a', @hash[1][2][3]
    end

    should "raise error if attempting to extend non-hash" do
      assert_raises IndexError do
        @hash[2][3] = 'd'
      end
    end
  end
end
