class LRUCache

  attr_reader :max_size
  attr_accessor :cache

    def initialize(max_size)
      @cache = []
      @max_size = max_size
    end

    def count
      # returns number of elements currently in cache
      cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
        if self.count >= max_size
          if cache.include?(el)
            cache.delete(el)
            cache << el
          else
            cache.shift
            cache << el
          end
        else
          if cache.include?(el)
            cache.delete(el)
            cache << el
          else
            cache << el
          end
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
      cache
    end

    private
    # helper methods go here!
  end

  # add O(n)
  # count O(1)
  # show O(1)
  #
