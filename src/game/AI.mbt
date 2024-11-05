fn EnemyStatus::sheep_stampede(self : EnemyStatus) -> Unit {
  let animetime = sheep.anime.get("mie").unwrap()
  match sheep.round {
    Anime =>
      if game.r_time <= animetime {
        sheep.draw(x=120 - game.r_time * 2, y=self.round_pos.y, Fight)
      } else if sheep.finish == 0 {
        sheep.finish = game.r_time
        sheep.round = Fight
      } else if game.r_time - sheep.finish <= animetime {
        sheep.draw(
          x=60 + (game.r_time - sheep.finish) * 2,
          y=self.round_pos.y,
          Fight,
        )
      } else {
        sheep.round = Default
      }
    Fight => {
      sheep.draw(x=60, y=60, Fight)
      if sheep.battle == Attack {
        if player.state == "defense" {
          player.hp -= (rng.int(limit=7) + 4) / 2
          player.state = ""
        } else {
          let damage = rng.int(limit=7) + 4
          if critical(5) {
            player.hp -= damage * 2
          } else {
            player.hp -= damage
          }
        }
        sheep.attack += 1
        sheep.defense += 1
        sheep.round = Anime
      }
    }
    Default => {
      sheep.draw(x=120, y=60, Fight)
      battleRound.status = "player"
      sheep.battle = Default
      sheep.finish = 0
      return
    }
  }
}
