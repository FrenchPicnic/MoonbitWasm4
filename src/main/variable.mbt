struct Position {
  mut x : Int
  mut y : Int
}

struct PlayerStatus {
  mut hp : Int
  mut state : String
}

struct Choice {
  mut option : Int
}

struct Round {
  mut status : String
}

let pos : Position = { x: 0, y: 0 }

let size : Int = 5

let player : PlayerStatus = { hp: 100, state: "" }

let enemy : PlayerStatus = { hp: 200, state: "" }

let choice : Choice = { option: 1 }

let battleStatus = ["attack", "defense", "heal"]

let battleRound : Round = { status: "player" }

let rng : @random.Rand = @random.new()
