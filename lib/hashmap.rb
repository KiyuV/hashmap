# frozen_string_literal: true

require './lib/linked_list'

class HashMap
  def initialize
    @load_factor = 0.75
    @size = 16
    @bucket = Array.new(@size)
  end

  def set(key, value)
    hash_code = hash(key)

    if @bucket[hash_code].nil?
      @bucket[hash_code] = LinkedList.new
      @bucket[hash_code].append(key, value)
    elsif @bucket[hash_code].contains?(key)
      node = @bucket[hash_code].head
      node = node.next_node until node.key == key

      node.value = value
    else
      @bucket[hash_code].append(key, value)
    end
  end
  
  def get(key)
    hash_code = hash(key)
    return nil if @bucket[hash_code].nil?
    return nil unless @bucket[hash_code].contains?(key)

    node = @bucket[hash_code].head
    node = node.next_node until node.key == key

    node.value
  end

  def has?(key)
    hash_code = hash(key)
    return false if @bucket[hash_code].nil?
    @bucket[hash_code].contains?(key) ? true : false  
  end

  def remove(key)
    if self.has?(key)
      hash_code = hash(key)
      index = @bucket[hash_code].find(key)
      @bucket[hash_code].remove_at(index)
    else
      nil
    end
  end

  def length
    length = 0
    @bucket.each do |list|
      next if list.nil?
      length += list.size
    end
    length
  end

  def clear
    @bucket = Array.new(@size)
  end

  def keys
    keys = []
    @bucket.each do |list|
      next if list.nil?
      keys.concat(list.get_keys) 
    end
    keys
  end

  def values
    values = []
    @bucket.each do |list|
      next if list.nil?
      values.concat(list.get_values) 
    end
    values
  end

  def entries
    entries = []
    @bucket.each do |list|
      next if list.nil?
      entries.concat(list.get_entries) 
    end
    entries
  end

  private

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @bucket.size
  end
end
