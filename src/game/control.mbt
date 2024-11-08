enum Button {
  Left
  Right
  Up
  Down
  X
  Z
  None
} derive(Eq)

struct Control {
  mut button : Button
  mut pressed : Bool
  mut la_button : Button
}

let keyboard : Control = Control::{
  button: None,
  pressed: false,
  la_button: None,
}

fn Control::button() -> Unit {
  let pad = @wasm.get_gamepad()
  keyboard.button = if pad.button_right {
    Right
  } else if pad.button_left {
    Left
  } else if pad.button_up {
    Up
  } else if pad.button_down {
    Down
  } else if pad.button_1 {
    X
  } else if pad.button_2 {
    Z
  } else {
    None
  }
  keyboard.pressed = keyboard.button != keyboard.la_button
  keyboard.la_button = keyboard.button
}

fn control() -> Unit {
  button()
  if game.scene == Fight && keyboard.pressed {
    fight_control()
    game.p_time = game.g_time
  } else if game.scene == World {
    world_control()
  }
  if game.konami == "uuddlrlrxz" {
    game.lscene = game.scene
    game.scene = Secret
  }
}

fn fight_control() -> Unit {
  match keyboard.button {
    Left => {
      game.konami += "l"
      if battleRound.status == "player" {
        choice.option = @math.maximum(1, choice.option - 1)
      }
    }
    Right => {
      if battleRound.status == "player" {
        choice.option = @math.minimum(3, choice.option + 1)
      }
      game.konami += "r"
    }
    Up => game.konami += "u"
    Down => game.konami += "d"
    X => {
      game.konami += "x"
      if choice.option > 0 {
        if battleRound.status == "player" {
          player.selfround = true
        }
      }
    }
    Z => game.konami += "z"
    _ => ()
  }
}

fn world_control() -> Unit {
  match keyboard.button {
    Left => player.map_pos.x -= 1
    Right => player.map_pos.x += 1
    Up => player.map_pos.y -= 1
    Down => player.map_pos.y += 1
    _ => ()
  }
}
