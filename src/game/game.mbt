struct Game {
  mut scene : Scene
  mut lscene : Scene
  mut globaltime : Int
  mut roundtime : Int
  mut buttontime : Int
  mut gamepad : @wasm.GamePad
  mut konami : String
}

fn Game::default() -> Game {
  {
    globaltime: 0,
    roundtime: 0,
    buttontime: 0,
    gamepad: @wasm.get_gamepad(),
    konami: "",
    scene: Welcome,
    lscene: Welcome,
  }
}

fn Game::reset(self : Game) -> Unit {
  self.buttontime = 0
  self.globaltime = 0
  self.roundtime = 0
  self.scene = Welcome
  self.lscene = Welcome
  self.gamepad = @wasm.get_gamepad()
  self.konami = ""
}

let game : Game = Game::default()

let world : World = World::new()

pub fn gamelive() -> Unit {
  control()
  checkStatus()
}

pub fn start() -> Unit {
  gameReset()
}

pub fn update() -> Unit {
  game.globaltime += 1
  background()
  gamelive()
}

fn gameReset() -> Unit {
  player.exp = 0
  player.max_hp = 300
  game.reset()
}

fn checkStatus() -> Unit {
  match game.scene {
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
        game.scene = Defeat
      }
      if sheep.hp <= 0 {
        game.scene = Victory
      }
      roundScene()
      // playerinfo()
      round()
      if game.globaltime - game.buttontime > 20 {
        game.konami = ""
      }
    }
    Welcome => {
      welcome()
      return
    }
    Bonus => game.scene = Bonus
    World => {
      world_generate()
      return
    }
    Secret => {
      men()
      return
    }
  }
}
