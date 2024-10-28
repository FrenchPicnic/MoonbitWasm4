pub fn info() -> Unit {
  @wasm.text(
    "now" + gameStatus.roundtime.to_string() + gameStatus.buttontime.to_string(),
    10,
    30,
  )
  @wasm.text("now" + gameStatus.globaltime.to_string() + "  ", 10, 50)
  @wasm.text(
    sheep.attack.to_string() + "  " + sheep.defense.to_string(),
    10,
    60,
  )
}

pub fn playerinfo() -> Unit {
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.text("now" + player.state + "  ", 10, 60)
  @wasm.text("now" + choice.option.to_string() + "  ", 10, 60)
  @wasm.text(battleRound.status + "  " + sheep.finish.to_string(), 10, 70)
  @wasm.text(sheep.state.to_string() + " " + sheep.status.to_string(), 10, 80)
  @wasm.text(gameStatus.konami, 10, 90)
  shield(75, 45)
  sword(75, 65)
}
