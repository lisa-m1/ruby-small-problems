require 'bundler/setup'

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative '../lib/todolist_project'
require 'date'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(@todos.size, @list.size)
  end

  def test_first
    assert_equal(@todos.first, @list.first)
  end


  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    rem1 = @todos.shift
    rem2 = @list.shift
    assert_equal(rem1, rem2)
  end

  def test_pop
    rem1 = @todos.pop
    rem2 = @list.pop
    assert_equal(rem1, rem2)
  end

  def test_true
    all_done = @todos.all? {|todo| todo.done?}
    assert_equal(all_done, @list.done?)
  end

  def test_arg_error
    assert_raises(TypeError) do
      @list << 2
    end
  end

  def test_shovel
    assert_equal(@list.add(@todo1), @list << @todo1)
  end

  def test_item_at
    assert_raises(IndexError) do 
      @list.item_at(10)
    end
  end

  def test_item_at_again
    assert_equal(@todos[1], @list.item_at(1))
  end


  def test_mark_done_at
    assert_raises(IndexError) do 
      @list.mark_done_at(10)
    end
  end

  def test_mak_done_at_again
    assert_equal(@todos[1].done!, @list.mark_done_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) do 
      @list.mark_undone_at(10)
    end
  end

  def test_mak_done_at_again
    assert_equal(@todos[1].undone!, @list.mark_undone_at(1))
  end

  def test_done!
    all_todos = @todos.each {|todo| todo.done!}
    assert_equal(all_todos, @list.done!)

  end

  def test_remove_at
    assert_raises(IndexError) do
      @list.remove_at(10)
    end

  end

  def test_to_s
  end

  def test_no_due_date
    assert_nil(@todo1.due_date)
  end

  def test_due_date
    due_date = Date.today + 3
    @todo2.due_date = due_date
    assert_equal(due_date, @todo2.due_date)
  end

end