require_relative 'lib/list'
require_relative 'lib/node'

list = LinkedList.new

list.append(3)
list.append(3)
list.prepend(10)
list.append(4)
list.append(5)
list.append(8)
list.prepend(12)
# list.pop
# list.pop
# list.pop
list.print
# list.size
list.find(43)
# p list.contains?(3)
# p list.contains?(40)
# p list.contains?(32)
# p list.contains?(12)
