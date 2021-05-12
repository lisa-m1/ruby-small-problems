class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
  end

end

class SimpleLinkedList
  def size
  end
  
  def empty?
  end

  def push()
  end

  def peek
  end

  def head
  end

  def pop
  end

  def from_a()
  end

  def to_a
  end

  def reverse
  end



end







class Element

  def initialize(*datum)
    @datum = datum
  end

  def datum
    if @datum.size == 1
      @datum[0]
    else
      @datum
    end
  end

  def tail?
    return true if @datum.size == 1
  end
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

  def push(value)
    list.push(Element.new(value))
  end

  def peek
    return nil if list.empty?
    list[0].datum
  end

  def head
    return nil if list.empty?
    list[0]
  end
end
