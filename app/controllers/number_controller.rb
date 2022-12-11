# frozen_string_literal: true

# NumberController
class NumberController < ApplicationController
  def last_item
    @result = Calc.last()
  end

  def find_sqrt(a)
    x = (a + 1.0) / 2.0
    loop do
      break if (x*x - a) / a < 0.001
      x = (x + a/x) / 2.0
    end
    x
  end

  def view
    a = params[:a].to_i
    
    res = Calc.find_by(a: params[:a])
    if res
      @source = 'SQL'
      @result = ActiveSupport::JSON::decode(res.result)
    else
      @source = 'CALC'
      @result = find_sqrt(a)
      
      res = Calc.create(:a => params[:a], :result => ActiveSupport::JSON::encode( @result ))
    end
  end

  def input; end
end
