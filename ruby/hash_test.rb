#hash testing

ruby_tree_hash = {'grandpa' => {'dad' => {'child1' => {}, 'child2' => {} }, 'uncle' => {'child3' => {}, 'child4' =>{} } } }



def create_children_array(tree_hash = {})
	children = {}
	tree_hash.each {|k,v| children = v}
	puts children
end


create_children_array(ruby_tree_hash)



