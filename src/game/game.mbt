struct GameStatus {
  mut scene : Scene
  mut lscene : Scene
  mut globaltime : Int
  mut roundtime : Int
  mut buttontime : Int
  mut gamepad : @wasm.GamePad
  mut konami : String
}

pub fn gamelive() -> Unit {
  checkStatus()

  // info()
}

pub fn start() -> Unit {
  reset()
}

pub fn update() -> Unit {
  gameStatus.globaltime += 1
  background()
  gamelive()
}

fn reset() -> Unit {
  player.exp = 0
  player.max_hp = 300
  gameStatus.scene = Welcome
}

fn checkStatus() -> Unit {
  match gameStatus.scene {
    Defeat => {
      @wasm.text("Game Over", 50, 50)
      @wasm.text("Press R to restart", 10, 70)
      return
    }
    Victory => {
      @wasm.text("You Win", 50, 50)
      @wasm.text("Press R to restart", 10, 70)
      return
    }
    Fight => {
      if player.hp <= 0 {
        gameStatus.scene = Defeat
      }
      if sheep.hp <= 0 {
        gameStatus.scene = Victory
      }
      buttonPress()
      roundScene()
      // playerinfo()
      round()
      pos.x += 1
      if gameStatus.globaltime - gameStatus.buttontime > 20 {
        gameStatus.konami = ""
      }
    }
    Welcome => {
      welcome()
      return
    }
    Bonus => gameStatus.scene = Bonus
    World => gameStatus.scene = World
    Secret => {
      men()
      return
    }
  }
}
