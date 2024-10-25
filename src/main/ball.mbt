pub fn ball() -> Unit {
  if @wasm.get_gamepad(index=1).button_right && pos.x + size < 100 {
    pos.x += 1
  } else if @wasm.get_gamepad(index=1).button_down && pos.y + size < 100 {
    pos.y += 1
  } else if @wasm.get_gamepad(index=1).button_left && pos.x >= 0 {
    pos.x -= 1
  } else if @wasm.get_gamepad(index=1).button_up && pos.y >= 0 {
    pos.y -= 1
  }
  if pos.x == 50 && pos.y == 50 {
    player.hp -= 10
  }
}
