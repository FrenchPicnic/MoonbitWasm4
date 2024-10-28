struct Position {
  mut x : Int
  mut y : Int
}

struct PlayerStatus {
  mut hp : Int
  mut exp : Int
  mut max_hp : Int
  mut state : String
}

struct Choice {
  mut option : Int
}

struct Round {
  mut status : String
}

struct EnemyStatus {
  mut hp : Int
  mut state : FightStatus
  mut status : RoundStatus
  danger : EnemyType
  anime : Map[String, Int]
  max_hp : Int
  name : EnemyName
  mut attack : Int
  mut defense : Int
  mut finish : Int
}

let pos : Position = { x: 0, y: 0 }

let size : Int = 5

let player : PlayerStatus = { hp: 300, exp: 0, max_hp: 300, state: "" }

let choice : Choice = { option: 0 }

let battleStatus = ["attack", "defense", "heal"]

let battleRound : Round = { status: "player" }

let rng : @random.Rand = @random.new()

let gameStatus : GameStatus = {
  globaltime: 0,
  roundtime: 0,
  buttontime: 0,
  gamepad: @wasm.get_gamepad(),
  konami: "",
  scene: Welcome,
  lscene: Welcome,
}

pub fn draw_bits(x : Int, y : Int) -> Unit {
  @wasm.rect(x, y, 1, 1)
}
