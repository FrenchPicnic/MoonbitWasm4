fn sheep_stampede() -> Unit {
  let animetime = sheep.anime.get("mie").unwrap()
  match sheep.round {
    Anime =>
      if game.roundtime <= animetime {
        sheep.draw(120 - game.roundtime * 2, 60)
      } else if sheep.finish == 0 {
        sheep.finish = game.roundtime
        sheep.round = Fight
      } else if game.roundtime - sheep.finish <= animetime {
        sheep.draw(60 + (game.roundtime - sheep.finish) * 2, 60)
      } else {
        sheep.round = Default
      }
    Fight => {
      sheep.draw(60, 60)
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
      sheep.draw(120, 60)
      battleRound.status = "player"
      sheep.battle = Default
      sheep.finish = 0
      return
    }
  }
}
