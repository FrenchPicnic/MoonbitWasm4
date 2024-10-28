pub fn fight(state : String) -> Unit {
  if state == "attack" {
    if sheep.state == Defense {
      sheep.hp -= 5
    } else {
      sheep.hp -= 10
    }
  } else if state == "defense" {
    player.state = "defense"
  } else if state == "heal" {
    player.hp = @math.minimum(player.hp + 10, player.max_hp)
  }
}

pub fn round() -> Unit {
  if battleRound.status == "player" {
    sheep.draw(120, 60)
    gameStatus.roundtime = 0
  } else {
    gameStatus.roundtime += 1
    choice.option = 0
    if sheep.status == Default && sheep.state == Default {
      sheep.status = Anime
      sheep.state = Attack
    }
    sheep_Mie()
  }

  // return false
}

fn buttonPress() -> Unit {
  let gamepad : @wasm.GamePad = @wasm.get_gamepad()
  if gamepad.button_left != gameStatus.gamepad.button_left &&
    gamepad.button_left {
    choice.option = @math.maximum(1, choice.option - 1)
    gameStatus.konami += "l"
    gameStatus.buttontime = gameStatus.globaltime
  } else if gamepad.button_right != gameStatus.gamepad.button_right &&
    gamepad.button_right {
    choice.option = @math.minimum(3, choice.option + 1)
    gameStatus.konami += "r"
    gameStatus.buttontime = gameStatus.globaltime
  } else if gamepad.button_up != gameStatus.gamepad.button_up &&
    gamepad.button_up {
    gameStatus.konami += "u"
    gameStatus.buttontime = gameStatus.globaltime
  } else if gamepad.button_down != gameStatus.gamepad.button_down &&
    gamepad.button_down {
    gameStatus.konami += "d"
    gameStatus.buttontime = gameStatus.globaltime
  }
  if gamepad.button_1 != gameStatus.gamepad.button_1 &&
    gamepad.button_1 &&
    choice.option > 0 {
    if battleRound.status == "player" {
      fight(battleStatus[choice.option - 1])
      battleRound.status = "enemy"
    }
    gameStatus.konami += "x"
    gameStatus.buttontime = gameStatus.globaltime
  }
  if gamepad.button_2 != gameStatus.gamepad.button_2 && gamepad.button_2 {
    gameStatus.konami += "z"
    gameStatus.buttontime = gameStatus.globaltime
  }
  if gameStatus.konami == "uuddlrlrxz" {
    gameStatus.lscene = gameStatus.scene
    gameStatus.scene = Secret
  }
  gameStatus.gamepad = gamepad
}

fn shield(x : Int, y : Int) -> Unit {
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  @wasm.rect(x, y, 1, 1)
  @wasm.rect(x - 1, y, 1, 1)
  @wasm.rect(x - 2, y + 1, 1, 1)
  @wasm.rect(x - 3, y + 1, 1, 1)
  @wasm.rect(x - 4, y + 2, 1, 1)
  @wasm.rect(x - 4, y + 3, 1, 1)
  @wasm.rect(x - 4, y + 4, 1, 1)
  @wasm.rect(x - 3, y + 5, 1, 1)
  @wasm.rect(x - 3, y + 6, 1, 1)
  @wasm.rect(x - 2, y + 7, 1, 1)
  @wasm.rect(x - 1, y + 8, 1, 1)
  @wasm.rect(x, y + 9, 1, 1)
  @wasm.rect(x + 1, y, 1, 1)
  @wasm.rect(x + 2, y + 1, 1, 1)
  @wasm.rect(x + 3, y + 1, 1, 1)
  @wasm.rect(x + 4, y + 2, 1, 1)
  @wasm.rect(x + 4, y + 3, 1, 1)
  @wasm.rect(x + 4, y + 4, 1, 1)
  @wasm.rect(x + 3, y + 5, 1, 1)
  @wasm.rect(x + 3, y + 6, 1, 1)
  @wasm.rect(x + 2, y + 7, 1, 1)
  @wasm.rect(x + 1, y + 8, 1, 1)
}

fn sword(x : Int, y : Int) -> Unit {
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  for i = 0; i < 3; i = i + 1 {
    @wasm.rect(x - i, y, 1, 1)
    @wasm.rect(x, y + i, 1, 1)
  }
  for i = 1; i < 7; i = i + 1 {
    @wasm.rect(x - 2 - i, y + i, 1, 1)
    @wasm.rect(x - i, y + 2 + i, 1, 1)
  }
  for i = 0; i < 7; i = i + 1 {
    @wasm.rect(x - 11 + i, y + 5 + i, 1, 1)
  }
  for i = 0; i < 3; i = i + 1 {
    @wasm.rect(x - 9 - i, y + 9 + i, 1, 1)
  }
}
