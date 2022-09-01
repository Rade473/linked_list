# frozen_string_literal: true

require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
    @create_node = proc { |value, next_node| Node.new(value, next_node)}
  end

  def start_list(value)
    @head = @create_node.call(value)
  end

  def append(value)
    return start_list(value) if head.nil?
    find_end.next_node = @create_node.call(value)
  end

  def print
    node = @head
    return if node.nil?
    puts node
    while (node = node.next_node)
      puts node
    end
  end

  def find_end
    node = @head
    return node if node.next_node.nil?
    while (node = node.next_node)
      return node if node.next_node.nil?
    end
  end

  def prepend(value)
    return start_list(value) if head.nil?
    @head = @create_node.call(value, @head)
  end

  def size
    @count = 1
    node = @head
    return if node.nil?
    while (node = node.next_node)
      @count += 1
    end
    puts "Number of nodes is #{@count}"
  end

  def first_element
    node = @head
    puts "#{node} is the first one"
  end

  def last_element
    puts "#{find_end} is the last node"
  end

  def at(index)
    node = @head
    @index_count = 0
    return if node.nil?
    return @head if index == 0
    while (node = node.next_node)
      @index_count += 1
      return node if @index_count == index
    end
  end

  def pop
    node = @head
    find_end.value = nil
    while (node = node.next_node)
      node.next_node = nil if node.next_node.value.nil?
    end
  end

  def contains?(value)
    node = @head
    result = false
    result = true if node.value == value

    while (node = node.next_node)
      if node.value == value
        result = true
      end
    end
    result
  end

  def find(value)
    node = @head
    index = 1
    return 0 if node.value == value
    return if node.nil?
    while (node = node.next_node)
      return index if node.value == value
      index += 1
    end
    nil
  end

end