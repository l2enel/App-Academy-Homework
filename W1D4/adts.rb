require 'byebug'

class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def add(el)
      # adds an element to the stack
      @stack << el
    end

    def remove
      # removes one element from the stack
      @stack.pop
    end

    def show
      # return a copy of the stack
      @stack
    end
  end

  class Queue

    def initialize
      @line = []
    end

    def enqueue(el)
      @line.unshift(el)
    end

    def dequeue
      @line.pop
    end

    def show
      @line
    end

  end

  class Map

    attr_accessor :array

    def initialize
      @array = []
    end

    def assign(key, value)
      @array << [key, value] if @array.none? { |arr| arr[0] == key }
      @array = @array.map do |arr|
        arr[0] == key ? [key, value] : arr
      end
    end

    def lookup(key)
      @array.select { |arr| arr[0] == key }
    end

    def remove(key)
      @array.each { |arr| @array.delete(arr) if arr[0] == key }
    end

    def show
      @array
    end
  end

  # if __FILE__ == $PROGRAM_NAME
  #   new_map = Map.new
  #   new_map.array = [["a", 1], ["b", 2], ["c", 3]]
  #   # debugger
  #   new_map.assign("c", 4)
  # end
