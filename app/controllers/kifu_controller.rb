class KifuController < ApplicationController
  def show
    @star_points = [ [ 4, 4 ], [ 4, 10 ], [ 4, 16 ], [ 10, 4 ], [ 10, 10 ], [ 10, 16 ], [ 16, 4 ], [ 16, 10 ], [ 16, 16 ] ]
    @kifu = Kifu.find_or_create_by!(id: params[:id])
    @moves = @kifu.moves.order(move_number: :asc)
    @stones_by_position = @moves.each_with_object({}) do |move, stones|
      stones[[ move.x, move.y ]] = move
    end
  end

  def move
    @kifu = Kifu.find_or_create_by!(id: params[:id])
    @move = @kifu.moves.new(move_number: next_move_number, color: next_move_color)
  end

  def move_add
    @kifu = Kifu.find_or_create_by!(id: params[:id])
    @move = @kifu.moves.new(move_params)

    if @move.save
      redirect_to kifu_move_path(@kifu)
    else
      render :move, status: :unprocessable_entity
    end
  end

  private

  def next_move_number
    @kifu.moves.maximum(:move_number).to_i + 1
  end

  def next_move_color
    if @kifu.moves.order(move_number: :desc).first&.black?
      :white
    else
      :black
    end
  end

  def move_params
    params.require(:move).permit(:move_number, :color, :x, :y)
  end
end
