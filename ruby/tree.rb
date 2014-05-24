class Tree
  attr_accessor :children, :node_name

  def initialize(tree_hash={})
  	@children = []
   	tree_hash.each do |name,child_hash|
   	  	  	@node_name = name
   	  	  	child_hash.each {|n,c| @children.push(Tree.new({n => c}))}
   	end
 
  end

  def visit_all(&block)
      	visit &block
      	children.each {|c| c.visit_all &block}
  end

  def visit(&block)
  	block.call self
  end
end

  #ruby_tree = Tree.new("Ruby",[Tree.new("Reia"),Tree.new("MacRuby")])

  ruby_tree_hash = {'grandpa' => {'dad' => {'child1' => {}, 'child2' => {} }, 'uncle' => {'child3' => {}, 'child4' =>{} } } }
  
  ruby_tree = Tree.new(ruby_tree_hash)

  puts "Visiting a node"
  ruby_tree.visit {|node| puts node.node_name}

  puts "Visiting entire tree"
  ruby_tree.visit_all {|node| puts node.node_name}