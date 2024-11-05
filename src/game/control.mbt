enum Button {
  Left
  Right
  Up
  Down
  X
  Z
} derive(Eq)

struct Control {
  button : Button
  pressed : Bool
  move : Button
}

fn Control::move(self : Control) -> Unit {
  match self.button {
    Left => ()
  }
}

fn control() -> Unit {
  let gamepad : @wasm.GamePad = @wasm.get_gamepad()
  if game.scene == Fight {
    fight_control(gamepad)
  } else if game.scene == World {
    world_control(gamepad)
  }
  if game.konami == "uuddlrlrxz" {
    game.lscene = game.scene
    game.scene = Secret
  }
  game.gamepad = gamepad
}

fn fight_control(gamepad : @wasm.GamePad) -> Unit {
  if gamepad.button_left != game.gamepad.button_left && gamepad.button_left {
    game.konami += "l"
    game.p_time = game.g_time
    if game.scene == Fight && battleRound.status == "player" {
      choice.option = @math.maximum(1, choice.option - 1)
    }
  } else if gamepad.button_right != game.gamepad.button_right &&
    gamepad.button_right {
    if game.scene == Fight && battleRound.status == "player" {
      choice.option = @math.minimum(3, choice.option + 1)
    }
    game.konami += "r"
    game.p_time = game.g_time
  } else if gamepad.button_up != game.gamepad.button_up && gamepad.button_up {
    game.konami += "u"
    game.p_time = game.g_time
  } else if gamepad.button_down != game.gamepad.button_down &&
    gamepad.button_down {
    if game.scene == World {
      player.pos.y += 1
    }
    game.konami += "d"
    game.p_time = game.g_time
  }
  if gamepad.button_1 != game.gamepad.button_1 &&
    gamepad.button_1 &&
    choice.option > 0 {
    if battleRound.status == "player" {
      fight(battleStatus[choice.option - 1])
      battleRound.status = "enemy"
    }
    game.konami += "x"
    game.p_time = game.g_time
  }
  if gamepad.button_2 != game.gamepad.button_2 && gamepad.button_2 {
    game.konami += "z"
    game.p_time = game.g_time
  }
}

fn world_control(gamepad : @wasm.GamePad) -> Unit {
  if gamepad.button_left {
    player.pos.x -= 1
  } else if gamepad.button_right {
    player.pos.x += 1
  } else if gamepad.button_up {
    player.pos.y -= 1
  } else if gamepad.button_down {
    player.pos.y += 1
  }
}
