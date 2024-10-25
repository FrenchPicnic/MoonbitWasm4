pub fn gamelive() -> Unit {
  if player.hp <= 0 {
    @wasm.text("Game Over", 50, 50)
    @wasm.text("Press R to restart", 10, 70)
    return
  }
  if enemy.hp <= 0 {
    @wasm.text("You Win", 50, 50)
    @wasm.text("Press R to restart", 10, 70)
    return
  }
  if @wasm.get_gamepad().button_left && choice.option >= 10 {
    choice.option = @math.maximum(choice.option - 2, 10)
  } else if @wasm.get_gamepad().button_right && choice.option <= 30 {
    choice.option = @math.minimum(choice.option + 2, 30)
  }
  menu(choice.option - choice.option % 10)
  if @wasm.get_gamepad().button_1 &&
    choice.option >= 10 &&
    choice.option <= 30 &&
    battleRound.status == "player" {
    fight(battleStatus[(choice.option - choice.option % 10) / 10 - 1])
    battleRound.status = "enemy"
  }
  round(battleRound)
  // ball()
  @wasm.text("Player HP: " + player.hp.to_string(), 10, 10)
  @wasm.text("Enemy HP: " + enemy.hp.to_string(), 10, 20)
  // @wasm.oval(pos.x, pos.y, size, size)
}

pub fn start() -> Unit {
  @wasm.set_draw_colors(1, index=1)
  @wasm.set_draw_colors(2, index=2)
  @wasm.set_draw_colors(4, index=3)
}

pub fn update() -> Unit {
  gamelive()
}
