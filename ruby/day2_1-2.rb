#print the content of an array of sixteen number, 4 at a time

array = (1..16).to_a
array.each_with_index do |number, index|
    print "#{number} "
    puts if (index + 1) % 4 == 0
  end

  #do the same using each_slice

  array.each_slice(4) { |slice| puts slice.join(' ') }


#the tree class was interesting, let the tree initializer accept a nested structure of hashes

class Tree
    attr_accessor :value, :children
  
    def initialize(value, children_hash = {})
      @value = value
      @children = []
      build_from_hash(children_hash)
    end
  
    def print_tree(level = 0)
        puts "#{' ' * level * 2}#{value}"
        children.each { |child| child.print_tree(level + 1) }
    end

    private
  
    def build_from_hash(children_hash)
      children_hash.each do |key, value|
        child_node = Tree.new(key, value.is_a?(Hash) ? value : {})
        @children << child_node
      end
    end

   
end
  
# Example Usage
nested_hash = { 'child1' => { 'grandchild1' => {}, 'grandchild2' => {} }, 'child2' => {} }
tree = Tree.new('root', nested_hash)

tree.print_tree