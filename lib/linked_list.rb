# frozen_string_literal: true

require './lib/node'

class LinkedList
  def initialize(head = nil)
    @head = head
    @tail = nil
    @size = 0
  end

  def append(key, value)
    @size += 1
    new_node = Node.new(key, value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(key, value)
    @size += 1
    new_node = Node.new(key, value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  attr_reader :size

  def head
    if @head.nil?
      nil
    else
      @head.value
    end
  end

  def tail
    if @tail.nil?
      nil
    else
      @tail.value
    end
  end

  def at(index)
    node = @head
    i = 0
    return nil if index >= @size

    loop do
      break if i == index

      node = node.next_node
      i += 1
    end

    node.value
  end

  def pop
    current_node = @head
    until current_node.nil?
      if !current_node.next_node.nil?
        following_node = current_node.next_node
        if following_node.next_node.nil?
          @size -= 1
          return current_node.next_node = nil
        else
          current_node = following_node
        end
      else
        @size -= 1
        return @head = nil
      end
    end
  end

  def contains?(value)
    node = @head
    until node.nil?
      return true if node.value == value
      return false if node.next_node.nil?

      node = node.next_node

    end
    false
  end

  def find(value)
    node = @head
    index = 0
    until node.nil?
      return index if node.value == value

      break if node.next_node.nil?

      index += 1
      node = node.next_node

    end
    nil
  end

  # inserts a new node at the provided index
  def insert_at(key, value, index)
    raise IndexError if index >= @size

    return prepend(key, value) if index.zero?

    i = 0
    current_node = @head
    following_node = current_node.next_node

    until i == (index - 1)
      current_node = following_node
      following_node = current_node.next_node
      i += 1
    end

    current_node.next_node = Node.new(key, value, following_node)
    @size += 1
    nil
  end

  def remove_at(index)
    raise IndexError if index >= @size

    if index.zero?
      tmp = @head
      @head = @head.next_node
      @size -= 1
      tmp.value
    else
      i = 0
      current_node = @head
      following_node = current_node.next_node

      until i == (index - 1)
        current_node = following_node
        following_node = current_node.next_node
        i += 1
      end

      current_node.next_node = following_node.next_node
      @size -= 1
      following_node.value
    end
  end

  def to_s
    node = @head
    until node.nil?
      print "(#{node.value}) -> "
      node = node.next_node
    end
    puts 'nil '
  end
end
