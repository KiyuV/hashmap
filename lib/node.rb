# frozen_string_literal: true

class Node
  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end

  attr_reader :value
  attr_accessor :next_node
end
