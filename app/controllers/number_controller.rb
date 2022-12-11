# frozen_string_literal: true

def check_pow5(num)
  return Math.log(num, 5).round(4) == Math.log(num, 5).round if num.positive?
  false
end

# NumberController
class NumberController < ApplicationController
  def last_item
    @result = Calc.last()
  end

  def view
    n = params[:n].to_i
    a_list = params[:a]&.split&.map(&:to_i)&.take n
    n, a = params[:n].strip, params[:a].strip
    
    res = Calc.find_by(n: params[:n], a: params[:a])
    if res
      @source = 'SQL'
      @result = ActiveSupport::JSON::decode(res.result)
      @count = @result.length
    else
      @source = 'CALC'
      @result = calculate_list(a_list)
      @count = @result.length
      
      res = Calc.create(:n => params[:n], :a => params[:a], :result => ActiveSupport::JSON::encode( @result ))
      # if res.valid?
      #   res.save # для .new
      # end
    end
  end

  def calculate_list(a_list)
    seq = []

    a_list&.each_index do |index|
      seq_current = []
      a_list[index..].each do |num|
        break unless check_pow5(num)

        seq_current += [num]
        seq << seq_current
      end
    end

    seq.uniq.sort_by(&:count).reverse
  end

  def input; end
end
