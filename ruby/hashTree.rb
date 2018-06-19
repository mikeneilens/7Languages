class Tree
	attr_accessor :treeData

	def initialize(treeData)
		@treeData = treeData
	end

	def visit_all(&block)
		treeData.each_pair do |key, value| 
			block.call key 
			Tree.new(value).visit_all(&block)
		end
	end

	def visit(&block)
		treeData.each_pair do |key, value| block.call key end
	end
end

ruby_tree = Tree.new( {"grandpa" => {"dad" => {"child 1" => {}, "child 2" => {} }, "uncle" => {"child 3" => {} }  } })

puts 'visiting a node'
ruby_tree.visit {|name| puts "name is #{name}"}
puts 'visiting all nodes'
ruby_tree.visit_all {|name| puts "name is #{name}"}
