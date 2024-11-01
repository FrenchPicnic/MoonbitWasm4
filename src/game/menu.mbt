fn health(enemy : EnemyStatus) -> Unit {

  // 外边框

  @wasm.set_draw_colors(1, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.rect(5, 30, 50, 5)
  @wasm.rect(100, 30, 50, 5)
  @wasm.text(player.hp.to_string() + "/" + player.max_hp.to_string(), 5, 20)
  @wasm.text(enemy.hp.to_string() + "/" + enemy.max_hp.to_string(), 100, 20)

  // 实际血条
  @wasm.set_draw_colors(4, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.rect(
    5,
    30,
    (50.0 * player.hp.to_double() / player.max_hp.to_double()).to_int(),
    5,
  )
  @wasm.rect(
    100,
    30,
    (50.0 * enemy.hp.to_double() / enemy.max_hp.to_double()).to_int(),
    5,
  )
  if player.state == "defense" {
    shield(60, 30)
  }
}

fn exp() -> Unit {

  // 经验外边框
  @wasm.set_draw_colors(4, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.rect(25, 0, 30, 5)
  @wasm.text("exp", 0, 0)

  // 实际边框
  @wasm.set_draw_colors(4, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.rect(25, 0, (30.0 * player.exp.to_double() / 100.0).to_int(), 5)
  @wasm.text("level" + " " + player.exp.to_string(), 100, 0)
}

fn menu() -> Unit {
  @wasm.rect(0, 100, 160, 60)
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.text("Fight", 10, 120 - 5 * (1 == choice.option).to_int())
  @wasm.text("Defense", 60, 120 - 5 * (2 == choice.option).to_int())
  @wasm.text("Heal", 120, 120 - 5 * (3 == choice.option).to_int())
}

fn roundScene() -> Unit {
  menu()
  health(sheep)
  exp()
}
