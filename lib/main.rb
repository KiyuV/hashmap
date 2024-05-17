require './lib/hashmap'

class Main
  def initialize
    @hashmap = HashMap.new
  end

  def run
    @hashmap.set('john', 'doe')
    @hashmap.set('john', 'bye')
    @hashmap.set('{', 'boe')
  end
end

task = Main.new
task.run