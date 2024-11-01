struct PlayerStatus {
  mut hp : Int
  mut exp : Int
  mut max_hp : Int
  mut state : String
  mut xpos : Int
  mut ypos : Int
}

struct Choice {
  mut option : Int
}

struct Round {
  mut status : String
}

fn PlayerStatus::default() -> PlayerStatus {
  { hp: 300, exp: 0, max_hp: 300, state: "", xpos: 20, ypos: 20 }
}

let player : PlayerStatus = PlayerStatus::default()

let choice : Choice = { option: 0 }

let battleStatus = ["attack", "defense", "heal"]

let battleRound : Round = { status: "player" }

let rng : @random.Rand = @random.new()
