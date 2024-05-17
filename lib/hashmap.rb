require './lib/linked_list'

class HashMap
  def initialize
    @load_factor = 0.75
    @bucket = Array.new(16)
  end

  def set(key, value)
    hash_code = hash(key)

    if @bucket[hash_code].nil?
      @bucket[hash_code] = LinkedList.new
      @bucket[hash_code].append(key, value)
    elsif @bucket[hash_code].contains?(key)
      node = @bucket[hash_code].head
      node = node.next_node unless node.key == key

      node.value = value
    else
      @bucket[hash_code].append(key, value)
    end
  end

  private

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % @bucket.size
  end
end