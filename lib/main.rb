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

    p @hashmap.get('jacob')
    p @hashmap.get('john')

    p @hashmap.has?('john')
    p @hashmap.has?('jean')

    p @hashmap.remove('john')
    p @hashmap.remove('jenny')
  end
end

task = Main.new
task.run
