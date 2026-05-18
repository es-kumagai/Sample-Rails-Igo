// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const playGoBoard = () => {
  const board = document.getElementById("go-board")
  const stones = Array.from(board.querySelectorAll("[data-go-move-number]")).sort((a, b) => {
    return Number(a.dataset.goMoveNumber) - Number(b.dataset.goMoveNumber)
  })
  
  const delay = 500

  stones.forEach((stone) => {
    stone.classList.add("go-stone--hidden")
  })

  stones.forEach((stone, index) => {
    setTimeout(() => {
      stone.classList.remove("go-stone--hidden")
    }, delay * (index + 1))
  })
}

document.addEventListener("turbo:load", playGoBoard)
