struct Choice {
  mut option : Int
}

let choice : Choice = { option: 0 }

fn health(enemy : EnemyStatus) -> Unit {
  @wasm.text("level " + player.level.to_string(), 0, 0)
  @wasm.text("level " + enemy.level.to_string(), 100, 0)
  // 外边框
  two_color(1, 3)
  @wasm.rect(5, 10, 50, 11)
  @wasm.rect(105, 10, 50, 11)

  // 实际血条

  two_color(2, 3)
  @wasm.rect(
    5,
    10,
    (50.0 * player.hp.to_double() / player.max_hp.to_double()).to_int(),
    11,
  )
  @wasm.rect(
    105,
    10,
    (50.0 * enemy.hp.to_double() / enemy.max_hp.to_double()).to_int(),
    11,
  )
  two_color(3, 0)
  @wasm.text(player.hp.to_string() + "/" + player.max_hp.to_string(), 7, 12)
  @wasm.text(enemy.hp.to_string() + "/" + enemy.max_hp.to_string(), 107, 12)
  if player.battle == Defense {
    shield(60, 10)
  }
  if enemy.battle == Defense {
    shield(90, 10)
  }
}

fn menu(enemy : EnemyStatus) -> Unit {
  two_color(0, 2)
  @wasm.rect(0, 80, 160, 80)
  two_color(2, 0)
  // @wasm.text(round.status, 10, 150)
  if round.status == "player" {
    @wasm.text("Fight", 10, 120 - 5 * (1 == choice.option).to_int())
    @wasm.text("Defense", 60, 120 - 5 * (2 == choice.option).to_int())
    @wasm.text("Heal", 120, 120 - 5 * (3 == choice.option).to_int())
  }
}

fn round_scene(enemy : EnemyStatus) -> Unit {
  menu(enemy)
  health(enemy)
}
