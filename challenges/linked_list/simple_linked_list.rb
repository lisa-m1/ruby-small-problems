class Element
  attr_reader :datum
  attr_accessor :next_element

  def initialize(datum, next_element = nil)
    @datum = datum
    @next_element = next_element
  end

  def tail?
    return true unless next_element

    false
  end

  alias_method :next, :next_element
end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    list.size
  end

  def empty?
    list.empty?
  end

  def push(data)
    list.unshift(Element.new(data, head))
  end

  def head
    list.first
  end

  def peek
    return nil if list.empty?
    
    head.datum
  end

  def pop
    popped_element = list.shift
    popped_element.datum
  end

  def to_a
    list.map(&:datum)
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    unless arr.nil? || arr.empty?
      arr.reverse.each do |datum|
        list.push(datum)
      end
    end
    list
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    list.each_with_index do |element, index|
      if index == 0
        reversed_list.list.unshift(Element.new(element.datum))
      else
        reversed_list.push(element.datum)
      end
    end
    reversed_list
  end
end
