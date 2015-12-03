module NumberEnumerator
  def numbers( start )
    (start..Float::INFINITY).lazy
  end
end


class Prime
  include NumberEnumerator
  class << self
    def first( n = nil ) 
      if n
        raise TypeError.new( "No implicit conversion of #{n.class} into Integer" ) unless n.is_a? Fixnum
        generator.take(n.to_i).to_a
      else
        generator.first
      end
    end
    def each(&block)
      generator.each(&block)
    end
    private
    def generator
      Prime.new.send(:generator)
    end
  end
  private
  def generator 
    numbers(2).reject{|i| (2..Math.sqrt(i)).any?{|j| i % j == 0}}
  end
end

