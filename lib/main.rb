# frozen_string_literal: true

require './lib/hashmap'

class Main
  def initialize
    @hashmap = HashMap.new
  end

  def run
    @hashmap.set('john', 'doe')
    @hashmap.set('john', 'smith')
    @hashmap.set('{', 'boe')
    @hashmap.set('peter', 'wright')
=begin
    p @hashmap.get('jacob')
    p @hashmap.get('john')

    p @hashmap.has?('john')
    p @hashmap.has?('jean')

    p @hashmap.remove('john')
    p @hashmap.remove('jenny')

    p @hashmap.length
    p @hashmap.clear
    
    p @hashmap.keys
    p @hashmap.values
    p @hashmap.entries
=end
  end
end

task = Main.new
task.run
