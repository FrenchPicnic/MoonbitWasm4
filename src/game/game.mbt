struct Game {
  mut scene : Scene
  mut lscene : Scene
  mut g_time : Int
  mut r_time : Int
  mut p_time : Int
  mut a_time : Int
  mut konami : String
  mut flag : Bool
}

fn Game::default() -> Game {
  {
    g_time: 0,
    r_time: 0,
    p_time: 0,
    a_time: 0,
    konami: "",
    scene: Welcome,
    lscene: Welcome,
    flag: true,
  }
}

fn Game::reset(self : Game) -> Unit {
  self.p_time = 0
  self.g_time = 0
  self.r_time = 0
  self.scene = Welcome
  self.lscene = Welcome
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
      @wasm.set_draw_colors(2, index=1)
      @wasm.set_draw_colors(0, index=2)
      @wasm.text("You Win", 50, 50)
      @wasm.text("Game is under\n development", 10, 60)
      @wasm.text("Press X to Map", 20, 80)
      @wasm.text("Press R to restart", 10, 100)
      if keyboard.button == X && keyboard.pressed {
        game.scene = World
      }
      return
    }
    Fight => {
      battle(round.enemy)
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
