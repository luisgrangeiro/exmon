defmodule ExMon.Player do
    required_keys = [:life, :name, :moves]

    @max_life 100 #variavel de modulo não precisa do sinal de igual

    @enforce_keys required_keys

    defstruct required_keys    

    def build(name, move_rnd, move_avg, move_heal) do
        %ExMon.Player{
            name: name,
            moves: %{
                move_rnd: move_rnd,
                move_avg: move_avg,
                move_heal: move_heal
            },            
            life: @max_life
        }
    end
end