class FibonacciCacher
  def self.get(position)
    if position.blank?
      raise "You need to pass in a position."
    end

    fib_num = Rails.cache.read(position)

    if fib_num.nil?
      fib_num = fibonacci[position]
      Rails.cache.write(position, fib_num)
    end

    fib_num
  end

  private

  def fibonacci
    Fibonacci.new
  end
end
