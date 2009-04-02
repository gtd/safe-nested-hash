class SafeNestedHash < Hash
  def [](key)
    if has_key?(key)
      super
    else
      UndefinedHash.new(self, key)
    end
  end

  class UndefinedHash #:nodoc:
    def initialize(base, key)
      @base = base
      @first_key = key
      @keychain = []
    end

    def nil?
      true
    end

    def [](key)
      @keychain << key
      self
    end

    def []=(key, value)
      @keychain << key
      @base[@first_key] = build_chain(@keychain, value)
    end

    private
      def build_chain(remaining, value)
        if remaining.empty?
          value
        else
          key = remaining.shift
          hash = SafeNestedHash.new
          hash[key] = build_chain(remaining, value)
          hash
        end
      end
  end
end