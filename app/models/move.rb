class Move < ApplicationRecord
  belongs_to :kifu

  enum :color, {
    black: 0,
    white: 1
  }
end
