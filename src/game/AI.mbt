let default_ai : AI = fn(self) { @wasm.text(self.name.to_string(), 60, 60) }

let sheep_ai : AI = fn(self) {
  // 每两次咩咩冲击进行一次防御
  if self.battle == Special {
    draw_hero(player.bonus_pos.x, player.bonus_pos.y, size=1)
    if not(bonus_0(1)) {
      if bonus_time.b0_time != 0 {
        self.round_reset()
        bonus_time.b0_time = 0
        return
      }
      self.battle = Default
    }
  } else {
    game.r_time += 1
    draw_hero(player.round_pos.x, player.round_pos.y, size=3)
    if self.attack != 0 && self.attack % 2 == 0 {
      self.battle = Defense
      self.attack = 0
      self.round_reset()
    } else {
      if self.round == Default && self.battle == Default {
        self.round = Anime
        self.battle = Attack
      }
      (self.skill.anime._)(self, self.skill)
    }
  }
}
