class Board

    def self.print_grid(grid)
        grid.each { |subarr| puts subarr.join(" ") }
    end

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.each do |subarr| 
            subarr.each { |el| count += 1 if el == :S}
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[position] = :X 
            return false 
        end
    end
        
    def place_random_ships
        max_ships = size / 4
        ship_count = 0

        until ship_count == max_ships
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            if @grid[row][col] != :S
                @grid[row][col] = :S
                ship_count += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |subarr|
            subarr.map do |ele|
                if ele == :S 
                    :N
                else 
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
    
end
