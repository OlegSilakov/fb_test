class Algoritm

	@count = 50

	def self.miss(miss1, miss2)
		find_miss(generate_array(miss1, miss2), @count)
	end

	def self.generate_array(n1, n2)
		miss_ar = []
		(1..@count).each do |v|
			if ((v != n1) and (v != n2))
				miss_ar << v
			end
		end
		miss_ar
	end

	def self.find_miss(miss_array, k_elem)
		miss_n = []
		miss_n << 1 if (miss_array.first != 1)
		miss_n = miss_array.each_index.reduce(miss_n) do |acc, k|
			if ((k > 0) and (miss_array[k] - miss_array[k-1] > 1))
				acc << miss_array[k] - 2 if ((miss_array[k] - miss_array[k-1]) > 2)
				acc << miss_array[k] - 1
			end
			acc
		end
		miss_n << k_elem if (miss_array.last != k_elem)
		miss_n	
	end
end