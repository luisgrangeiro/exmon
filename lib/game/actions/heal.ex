defmodule ExMon.Game.Actions.Heal do
    @heal_power 18..25

    def heal_life(player) do
        player
        |> ExMon.Game.fetch_player()
        |> Map.get(:life)
        |> calculate_total_life()
        |> set_life(player)
    end

    defp calculate_total_life(life), do: Enum.random(@heal_power) + life      
    
    defp set_life(life, player) when life > 100, do: update_player_life(player, 100)
    defp set_life(life, player), do: update_player_life(player, life)

    defp update_player_life(player, life) do
        player
        |> ExMon.Game.fetch_player()
        |> Map.put(:life, life)
        |> update_game(player, life)
    end

    defp update_game(player_data, player, life) do
        ExMon.Game.info()
        |> Map.put(player, player_data)
        |> ExMon.Game.update()

        ExMon.Game.Status.print_move_message(player, :heal, life)
    end
end