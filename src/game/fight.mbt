struct Round {
  mut status : String
  mut enemy : EnemyStatus
}

fn Round::fight(state : String) -> Unit {
  if state == "attack" {
    if sheep.battle == Defense {
      sheep.hp -= 5
    } else {
      sheep.hp -= 10
    }
  } else if state == "defense" {
    player.state = "defense"
  } else if state == "heal" {
    player.hp = @math.minimum(player.hp + 10, player.max_hp)
  }
}

fn Round::round() -> Unit {
  roundScene()
  if battleRound.status == "player" {
    sheep.draw(x=120, y=50, Fight)
    game.r_time = 0
  } else {
    game.r_time += 1
    choice.option = 0
    if sheep.round == Default && sheep.battle == Default {
      sheep.round = Anime
      sheep.battle = Attack
    }
    sheep_stampede(sheep)
  }

  // return false
}
