struct BounsLevel {
  control : LevelControl
}

struct BonusTime {
  mut b0_time : Int
  mut tenzor : Int
  mut level_time : Int
}

let bonus_time : BonusTime = { b0_time: 0, tenzor: 0, level_time: 0 }

fn check_Bouns() -> Unit {
  match game.bscene {
    LevelUp => level_up()
    None => return
  }
}

fn men() -> Unit {
  if game.konami == "uuddlrlrzx" && bonus_time.tenzor == 0 {
    game.konami = ""
    game.scene = Secret
    player.max_hp = 1024
    player.level = 19
    player.hp = player.max_hp
  }
  if bonus_time.tenzor >= 200 {
    bonus_time.tenzor = 0
    game.scene = game.lscene
  }
  two_color(2, 0)
  @wasm.text("You Find The Code!", 10, 50)
  @wasm.text("Health Full", 20, 90)
  @wasm.text("Level MAX", 40, 110)
  bonus_time.tenzor += 1
}

fn level_up() -> Unit {
  if bonus_time.level_time == 0 {
    bonus_time.level_time = game.g_time
    player.level += 1
    player.max_hp += 50
    player.hp += 20
  }
  two_color(2, 0)
  @wasm.text("Level Up!", 50, 30)
  @wasm.text("MAX_HP UP!", 45, 60)
  if game.g_time - bonus_time.level_time >= 70 {
    bonus_time.level_time = 0
    game.bscene = None
    game.scene = game.lscene
  }
}

struct Pipe {
  pos : Coordinate
  hitbox : Coordinate
  move : Int
}

let b0_pipes : Array[Pipe] = Array::new()

fn b0_pipe_init() -> Unit {
  b0_pipes.clear()
  for i = 0; i < 8; i = i + 1 {
    b0_pipes.push(
      {
        pos: { x: -15 * (i + 1), y: 80 },
        hitbox: { x: 5, y: 70 - 5 * (i + 1) },
        move: 1,
      },
    )
    b0_pipes.push(
      {
        pos: { x: 160 + 15 * (i + 1), y: 160 - 6 * (i + 1) },
        hitbox: { x: 5, y: 6 * (i + 1) },
        move: -1,
      },
    )
  }
}

fn bonus_0(speed : Int) -> Bool {
  if bonus_time.b0_time == 0 {
    player.bonus_pos.x = 85
    player.bonus_pos.y = 150
    bonus_time.b0_time = game.g_time
    b0_pipe_init()
  } else {
    for i = 0; i < b0_pipes.length(); i = i + 1 {
      if (game.g_time - bonus_time.b0_time) % (4 / speed) == 0 {
        b0_pipes[i].pos.x += b0_pipes[i].move
      }
      @wasm.rect(
        b0_pipes[i].pos.x,
        b0_pipes[i].pos.y,
        b0_pipes[i].hitbox.x,
        b0_pipes[i].hitbox.y,
      )
      if (
          player.bonus_pos.x + 8 <= b0_pipes[i].pos.x ||
          player.bonus_pos.x >= b0_pipes[i].pos.x + b0_pipes[i].hitbox.x
        ) ||
        player.bonus_pos.y + 8 <= b0_pipes[i].pos.y ||
        player.bonus_pos.y >= b0_pipes[i].pos.y + b0_pipes[i].hitbox.y {
        continue
      } else {
        bonus_time.b0_time = 0
        return false
      }
    }
  }
  if b0_pipes[0].pos.x >= 160 {
    return false
  }
  return true
}

fn bonus_1() -> Unit {

}
