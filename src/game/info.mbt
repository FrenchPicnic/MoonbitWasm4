pub fn info() -> Unit {
  @wasm.text(
    "now" + game.roundtime.to_string() + game.buttontime.to_string(),
    10,
    30,
  )
  @wasm.text("now" + game.globaltime.to_string() + "  ", 10, 50)
  @wasm.text(
    sheep.attack.to_string() + "  " + sheep.defense.to_string(),
    10,
    60,
  )
}

pub fn trashvar() -> Unit {
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.text("now" + player.state + "  ", 10, 60)
  @wasm.text("now" + choice.option.to_string() + "  ", 10, 60)
  @wasm.text(battleRound.status + "  " + sheep.finish.to_string(), 10, 70)
  @wasm.text(sheep.battle.to_string() + " " + sheep.battle.to_string(), 10, 80)
  @wasm.text(game.konami, 10, 90)
  @wasm.text(sheep.danger.to_string(), 10, 90)
  @wasm.text(sheep.ypos.to_string(), 10, 90)
  @wasm.text(sheep.xpos.to_string(), 10, 90)
  @wasm.text(sheep.hitbox.height.to_string(), 10, 90)
  @wasm.text(sheep.hitbox.width.to_string(), 10, 90)
  @wasm.text(Pumpkin.to_string(), 10, 90)
  @lib.draw_pumpkin(70, 60, size=3)
  shield(75, 45)
  sheep.xpos += 1
  sheep.ypos += 1
  sword(75, 65)
}
