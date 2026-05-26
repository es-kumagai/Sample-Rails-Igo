Rails.application.routes.draw do
  get "/kifu/:id", to: "kifu#show", as: :kifu
  get "/kifu/:id/move", to: "kifu#move"
  post "/kifu/:id/move", to: "kifu#move_add", as: :kifu_move
end
