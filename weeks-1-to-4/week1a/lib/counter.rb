class Counter
    def initialize
      @count = 0
    end
  
    def add(num)
      @count = @count + num
    end 
  
    def report
      return "Counted to #@count so far"
    end
  end
