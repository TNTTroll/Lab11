class Calc < ApplicationRecord
    validates_uniqueness_of :n, :a
end
