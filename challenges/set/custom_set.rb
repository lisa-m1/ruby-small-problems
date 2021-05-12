class CustomSet
  attr_reader :set

  def initialize(arr = [])
    @set = arr
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(sub)
    set.all? { |item| set.count(item) <= sub.count(item) }
  end

  def count(item)
    set.count(item)
  end

  def disjoint?(other)
    set.all? { |item| other.count(item) == 0 }
  end

  def eql?(other)
    return false if empty? && !other.empty?

    set.uniq.all? { |item| other.contains?(item) }
  end

  def add(element)
    set.push(element) unless contains?(element)
    self
  end

  def ==(other)
    set == other.set
  end

  def intersection(other)
    new_set = []
    set.each { |item| new_set << item if other.contains?(item) }
    CustomSet.new(new_set)
  end

  def difference(other)
    new_set = set - other.set
    CustomSet.new(new_set)
  end

  def union(other)
    new_set = (set + other.set).uniq.sort
    CustomSet.new(new_set)
  end
end
