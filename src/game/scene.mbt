enum Scene {
  Welcome
  Fight
  Victory
  Defeat
  Bonus
  World
  Secret
} derive(Eq)

fn background() -> Unit {
  @wasm.set_draw_colors(1, index=1)
  @wasm.set_draw_colors(2, index=2)
  @wasm.set_draw_colors(4, index=3)
}

fn welcome() -> Unit {
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(1, index=2)
  @wasm.text("Up Dungeons", 35, 30)
  @wasm.text("Press X to start", 20, 100)
  let gamepad : @wasm.GamePad = @wasm.get_gamepad()
  if gamepad.button_1 {
    game.scene = World
    return
  }
}
