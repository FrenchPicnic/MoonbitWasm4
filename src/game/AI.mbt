let default_ai : AI = fn(self) { @wasm.text(self.name.to_string(), 60, 60) }

let sheep_ai : AI = fn(self) {
  // 每两次咩咩冲击进行一次防御
  if self.attack != 0 && self.attack % 2 == 0 {
    self.battle = Defense
    self.attack = 0
    self.round_reset()
  } else {
    if self.round == Default && self.battle == Default {
      self.round = Anime
      self.battle = Attack
    }
    let ski = self.skill.get("stampede").unwrap()
    (ski.anime._)(self, ski)
  }
}
