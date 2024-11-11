struct Game {
  mut scene : Scene
  mut lscene : Scene
  mut bscene : BounsScene
  mut g_time : Int
  mut r_time : Int
  mut p_time : Int
  mut a_time : Int
  mut konami : String
  mut flag : Bool
  mut rng : Int
}

struct Big {
  mut wld : World
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
    bscene: None,
    flag: true,
    rng: 0,
  }
}

fn Game::reset(self : Game) -> Unit {
  self.p_time = 0
  self.g_time = 0
  self.r_time = 0
  self.scene = Welcome
  self.lscene = Welcome
  self.konami = ""
  self.rng = 0
}

let game : Game = Game::default()

let world : Big = Big::{ wld: World::new() }

pub fn start() -> Unit {
  gameReset()
}

pub fn update() -> Unit {
  game.g_time += 1
  background()
  control()
  checkStatus()
}

fn gameReset() -> Unit {
  player.exp = 0
  player.max_hp = 50
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
      // @wasm.text("Game is under\n development", 10, 60)
      @wasm.text("Press X to Map", 30, 80)
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
    Bonus => check_Bouns()
    World => {
      if player.exp >= 100 {
        game.lscene = World
        game.scene = Bonus
        game.bscene = LevelUp
        return
      }
      if game.flag == true {
        world.wld = World::new()
        game.flag = false
      }
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

fn check_Bouns() -> Unit {
  match game.bscene {
    LevelUp => level_up()
  }
}
