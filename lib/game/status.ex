defmodule ExMon.Game.Status do
    def print_round_message(%{status: :started} = info) do
        IO.puts("\n ===== Game Started =====")
        IO.inspect(info)
        IO.puts("---------------------------")
    end

    def print_round_message(%{status: :game_over} = info) do
        IO.puts("\n ===== The Game is over =====")
        IO.inspect(info)
        IO.puts("---------------------------")
    end

    def print_round_message(%{status: :continue, turn: player} = info) do
        IO.puts("\n ===== It's #{player} turn. =====")
        IO.inspect(info)
        IO.puts("---------------------------")
    end

    def print_wrong_move_message(move) do
        IO.puts("===== Invalid Move =====")
    end

    def print_move_message_base(opponent, :attack, damage) do
        opponent
        |>ExMon.Game.fetch_player()
        |>Map.get(:name)
        |>print_move_message_generic(:attack, damage)     
    end

    def print_move_message(:computer, :attack, damage) do
        IO.puts("\n ====== The player used #{:attack} dealing #{damage} damage. =====")
    end

    def print_move_message(:player, :attack, damage) do
        IO.puts("\n ====== The computer used #{:attack} dealing #{damage} damage. =====")
    end

    def print_move_message(player, :heal, life) do
        IO.puts("\n ====== #{player} healed itself to #{life}. =====")
    end 

    defp print_move_message_generic(name, :attack, damage) do
        IO.puts("\n ====== #{name} used #{:attack} dealing #{damage} damage. =====")
    end  
end