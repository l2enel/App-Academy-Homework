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

    def initialize
    end

  end
