class Array
    def all_empty?
        self.all? { |element| element.to_s.empty? }
    end

    def all_same?
        self.all? { |element| element == self[0] }
    end

    def any_empty?
        self.any? { |element| element.to_s.empty? }
    end

    def none_empty?
        !any_empty?
    end

    #diagonals source: https://gist.github.com/EvilScott/1755729
    def diagonals
        [self, self.map(&:reverse)].inject([]) do |all_diags, matrix|
          ((-matrix.count + 1)..matrix.first.count).each do |offet_index|
            diagonal = []
            (matrix.count).times do |row_index|
              col_index = offet_index + row_index
              diagonal << matrix[row_index][col_index] if col_index >= 0
            end
            all_diags << diagonal.compact if diagonal.compact.count > 1
          end
          all_diags
        
        end
    end
end