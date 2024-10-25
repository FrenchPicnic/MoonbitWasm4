pub fn fight(state : String) -> Unit {
  if state == "attack" {
    enemy.hp -= 10
  } else if state == "defense" {
    player.state = "defense"
  } else if state == "heal" {
    player.hp = @math.minimum(player.hp + 10, 100)
  }
}

pub fn round(round : Round) -> Unit {
  if round.status == "player" {
    // return true
  } else {
    choice.option = 0
    if player.state == "defense" {
      player.hp -= @math.minimum(1, rng.int(limit=11) / 2)
      player.state = ""
    } else {
      player.hp -= rng.int(limit=5)
    }
    round.status = "player"
    // return false
  }
}
