struct Game {
  mut scene : Scene
  mut lscene : Scene
  mut g_time : Int
  mut r_time : Int
  mut p_time : Int
  mut a_time : Int
  mut gamepad : @wasm.GamePad
  mut konami : String
}

fn Game::default() -> Game {
  {
    g_time: 0,
    r_time: 0,
    p_time: 0,
    a_time: 0,
    gamepad: @wasm.get_gamepad(),
    konami: "",
    scene: Welcome,
    lscene: Welcome,
  }
}

fn Game::reset(self : Game) -> Unit {
  self.p_time = 0
  self.g_time = 0
  self.r_time = 0
  self.scene = Welcome
  self.lscene = Welcome
  self.gamepad = @wasm.get_gamepad()
  self.konami = ""
}

let game : Game = Game::default()

let world : World = World::new()

pub fn gameLive() -> Unit {
  control()
  checkStatus()
}

pub fn start() -> Unit {
  gameReset()
}

pub fn update() -> Unit {
  game.g_time += 1
  background()
  gameLive()
  // info()
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
      round()
      if game.g_time - game.p_time > 20 {
        game.konami = ""
      }
    }
    Welcome => {
      welcome()
      return
    }
    Bonus => game.scene = Bonus
    World => {
      generate()
      return
    }
    FightAnime => {
      fight_anime()
      return
    }
    Secret => {
      men()
      return
    }
  }
}
