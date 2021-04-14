# ExMon
Esse é um projeto usado como base de aprendizagem no curso de Elixir do Rafael Camarda.

É basicamente um jogo por turnos onde você cria um personagem e define 3 habilidades (ataque e cura).
O jogo gera automaticamente um inimigo e então você deve invocar as habilidades a fim de derrotá-lo.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_mon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_mon, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_mon](https://hexdocs.pm/ex_mon)

## Getting-Started
Para executar esse projeto é necessário ter [Elixir](https://elixir-lang.org/install.html) e Erlang/OTP 21 instalados

## Running
Inicie um terminal no diretório raiz do projeto e execute o comando:

```cmd
$ iex -S mix
```

A partir daí já é possível iniciar o jogo.
Para dar inicio ao game é necessário gerar uma struct com as informações do jogador e passá-la para
o método de início da partida.

```cmd
p = ExMon.create_player("Mikasa", :chute, :soco, :cura)

ExMon.start_game(p)
```

Em seguida basta aguardar seu turno de ação e executar o comando:
```cmd
ExMon.make_move(:chute)
```

O terminal irá, a cada turno, exibir as informações do jogo, como pontos de vida, dano de ataque e etc.
