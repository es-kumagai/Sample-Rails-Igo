class KifuController < ApplicationController
  def show
    @kifu = Kifu.find_or_create_by!(id: params[:id])
    @moves = @kifu.moves.order(move_number: :asc)
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
    @kifu.moves.order(move_number: :desc).first&.black? ? :white : :black
  end
  
  def move_params
    params.require(:move).permit(:move_number, :color, :x, :y)
  end
end
