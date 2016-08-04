class SumOfMultiples
	attr_accessor :result_array
	
	def initialize(factor1, factor2, factor3 = nil)
		@factor1 = factor1
		@factor2 = factor2
		@factor3 = factor3
		@result_array = []
	end

	def self.to(limit)
		inst = self.new(3, 5)
		inst.to(limit)
	end

	def to(limit)
		multiples(@factor1, limit)
		multiples(@factor2, limit)
		multiples(@factor3, limit) if @factor3
		result = result_array.uniq.reduce(:+)
		result ? result : 0
	end

	def multiples(factor, limit)
		multiplier = 1
		while (factor * multiplier) < limit
			result_array << factor * multiplier
			multiplier += 1
		end
	end
end
