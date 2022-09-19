module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    index = 0

    my_each do |element|
      block.call(element, index)
      index += 1
    end

    self
  end

  def my_select(&block)
    filtered_array = []

    my_each do |element|
      filtered_array.push(element) if block.call(element)
    end

    filtered_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    index = 0

    while index < length
      yield(self[index])
      index += 1
    end

    self
  end
end
