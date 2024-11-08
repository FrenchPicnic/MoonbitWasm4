struct Coordinate {
  mut x : Int
  mut y : Int
}

struct HitBox {
  width : Int
  height : Int
}

let battleStatus = ["attack", "defense", "heal"]

let battleRound : Round = { status: "player", enemy: EnemyStatus::default() }

let rng : @random.Rand = @random.new()
