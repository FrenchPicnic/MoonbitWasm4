let sheep_stampede : Anime = fn(self, sk) {
  let animetime = self.skill.get("stampede").unwrap().anime_time
  match self.round {
    Anime =>
      if game.r_time <= animetime {
        self.draw(x=110 - game.r_time * 2, y=self.round_pos.y, Fight)
      } else if self.finish == 0 {
        self.draw(x=50, y=self.round_pos.y, Fight)
        self.round = Action
      } else if game.r_time - self.finish <= animetime {
        self.draw(
          x=50 + (game.r_time - self.finish) * 2,
          y=self.round_pos.y,
          Fight,
        )
      } else {
        self.battle = Default
        self.attack += 1
        self.round_reset()
        return
      }
    Action => {
      self.draw(x=50, y=self.round_pos.y, Fight)
      if self.battle == Attack {
        damage_player(sk.damage, sk.critical, player)
        self.round = Anime
        self.finish = game.r_time
      }
    }
    Default => {
      self.round_reset()
      return
    }
  }
}
