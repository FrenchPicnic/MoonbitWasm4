enum EnemyType {
  Normal
} derive(Eq)

enum EnemyName {
  Sheep
} derive(Eq)

enum RoundStatus {
  Anime
  Fight
  Default
} derive(Eq, Show)

enum FightStatus {
  // Heal
  Defense
  Attack
  Default
} derive(Eq, Show)

fn EnemyStatus::draw(self : EnemyStatus, x : Int, y : Int) -> Unit {
  if self.name == Sheep {
    if self.danger == Normal {
      drawSheep(x, y)
    }
  }
}

let sheep : EnemyStatus = {
  hp: 200,
  state: Default,
  status: Default,
  danger: Normal,
  anime: { "mie": 30 },
  max_hp: 200,
  name: Sheep,
  attack: 0,
  defense: 0,
  finish: 0,
}

fn drawSheep(x : Int, y : Int) -> Unit {
  @wasm.set_draw_colors(3, index=2)
  for i = 0; i < 9; i = i + 1 {
    for j = 0; j < 6; j = j + 1 {
      draw_bits(x + i, y + j)
    }
  }
  draw_bits(x + 9, y + 2)
  draw_bits(x + 10, y + 2)
  draw_bits(x + 10, y + 3)
  draw_bits(x + 10, y + 4)
  @wasm.set_draw_colors(1, index=2)
  draw_bits(x, y)
  draw_bits(x, y + 5)
  draw_bits(x + 8, y)
  draw_bits(x + 8, y + 5)
  @wasm.set_draw_colors(4, index=2)
  draw_bits(x, y + 1)
  draw_bits(x + 4, y + 1)
  draw_bits(x + 5, y + 1)
  draw_bits(x + 5, y + 1)
  draw_bits(x + 3, y + 6)
  draw_bits(x + 7, y + 6)
  for i = 1; i < 4; i = i + 1 {
    draw_bits(x + i, y + 2)
    draw_bits(x + i, y + 3)
    draw_bits(x + i, y + 4)
  }
  @wasm.set_draw_colors(2, index=2)
  draw_bits(x + 1, y + 3)
  draw_bits(x + 3, y + 3)
}

fn sheep_Mie() -> Unit {
  let animetime = sheep.anime.get("mie").unwrap()
  match sheep.status {
    Anime =>
      if gameStatus.roundtime <= animetime {
        sheep.draw(120 - gameStatus.roundtime * 2, 60)
      } else if sheep.finish == 0 {
        sheep.finish = gameStatus.roundtime
        sheep.status = Fight
      } else if gameStatus.roundtime - sheep.finish <= animetime {
        sheep.draw(60 + (gameStatus.roundtime - sheep.finish) * 2, 60)
      } else {
        sheep.status = Default
      }
    Fight =>
      if sheep.state == Attack {
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
        sheep.status = Anime
      }
    Default => {
      battleRound.status = "player"
      sheep.state = Default
      sheep.finish = 0
      return
    }
  }
}
