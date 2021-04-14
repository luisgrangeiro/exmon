defmodule ExMon do
  @computer_moves [:move_avg, :move_rnd, :move_heal]

  def create_player(name, move_rnd, move_avg, move_heal) do
    ExMon.Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    computer = create_player("Robotinik", :punch, :kick, :heal)
    ExMon.Game.start(computer, player)
    # Exemplo com Pipe operator
    # "Robotinik"
    # |> create_player(:punch, :kick, :heal)
    # |> ExMon.Game.start(player)

    # Vemos que podemos remover o primeiro parametro

    ExMon.Game.Status.print_round_message(ExMon.Game.info())
  end

  def make_move(move) do
    ExMon.Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  defp handle_status(:game_over, _move), do: ExMon.Game.Status.print_round_message(ExMon.Game.info())

  defp handle_status(_other, move) do
    move
    |> ExMon.Game.Actions.fetch_move()
    |> do_move()

    cyomputer_move(ExMon.Game.info())
  end

  defp do_move({:error, move}), do: ExMon.Game.Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> ExMon.Game.Actions.heal()
      move -> ExMon.Game.Actions.attack(move)
    end

    ExMon.Game.Status.print_round_message(ExMon.Game.info())
  end

  defp computer_move(%{turn: :computer, status: :continue}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end

  defp computer_move(_), do: :ok
end
