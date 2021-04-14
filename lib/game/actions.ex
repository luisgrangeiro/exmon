defmodule ExMon.Game.Actions do
    def fetch_move(move) do
        ExMon.Game.player()
        |> Map.get(:moves)
        |> find_move(move)
    end

    defp find_move(moves, move) do
        Enum.find_value(moves, {:error, move}, fn {key, value} -> 
            if value == move, do: {:ok, key}
        end)
    end

    def attack(move) do
        case ExMon.Game.turn() do
            :player -> ExMon.Game.Actions.Attack.attack_opponent(:computer, move)
            :computer -> ExMon.Game.Actions.Attack.attack_opponent(:player, move)
        end
    end

    def heal() do
        case ExMon.Game.turn() do
            :player -> ExMon.Game.Actions.Heal.heal_life(:player)
            :computer -> ExMon.Game.Actions.Heal.heal_life(:computer)
        end
    end
end