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

  def my_all?(&block)
    all_true = true

    my_each do |element|
      unless block.call(element)
        all_true = false
        break
      end
    end

    all_true
  end

  def my_any?(&block)
    any_true = false

    my_each do |element|
      if block.call(element)
        any_true = true
        break
      end
    end

    any_true
  end

  def my_none?(&block)
    none_true = true

    my_each do |element|
      if block.call(element)
        none_true = false
        break
      end
    end

    none_true
  end

  def my_count(&block)
    return length unless block_given?

    number_of_elements_that_match = 0

    my_each do |element|
      number_of_elements_that_match += 1 if block.call(element)
    end

    number_of_elements_that_match
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
