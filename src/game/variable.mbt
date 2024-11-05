struct PlayerStatus {
  mut hp : Int
  mut exp : Int
  mut max_hp : Int
  mut state : String
  pos : Coordinate
  hitbox : Coordinate
}

struct Choice {
  mut option : Int
}

struct Coordinate {
  mut x : Int
  mut y : Int
}

struct HitBox {
  width : Int
  height : Int
}

fn PlayerStatus::default() -> PlayerStatus {
  {
    hp: 300,
    exp: 0,
    max_hp: 300,
    state: "",
    pos: Coordinate::{ x: 20, y: 20 },
    hitbox: Coordinate::{ x: 10, y: 10 },
  }
}

let player : PlayerStatus = PlayerStatus::default()

let choice : Choice = { option: 0 }

let battleStatus = ["attack", "defense", "heal"]

let battleRound : Round = { status: "player", enemy: EnemyStatus::default() }

let rng : @random.Rand = @random.new()
