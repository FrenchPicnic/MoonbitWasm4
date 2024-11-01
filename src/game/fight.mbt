pub fn fight(state : String) -> Unit {
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

pub fn round() -> Unit {
  @lib.draw_hero(30, 60, size=3)
  if battleRound.status == "player" {
    sheep.draw(120, 60)
    game.roundtime = 0
  } else {
    game.roundtime += 1
    choice.option = 0
    if sheep.round == Default && sheep.battle == Default {
      sheep.round = Anime
      sheep.battle = Attack
    }
    sheep_stampede()
  }

  // return false
}
