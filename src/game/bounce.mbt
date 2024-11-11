fn men() -> Unit {
  if game.konami == "uuddlrlrzx" {
    game.konami = ""
    game.scene = Secret
    game.p_time = 0
  }
  if game.p_time >= 200 {
    game.p_time = 0
    game.scene = game.lscene
  }
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  drawMen(73, 15)
  @wasm.set_draw_colors(0, index=2)
  @wasm.text("You Find The Code!", 10, 50)
  @wasm.text("Health Full", 20, 90)
  @wasm.text("Level MAX", 40, 110)
  @wasm.text("All skill is \nunlocked", 30, 130)
  player.max_hp = 1024
  player.hp = player.max_hp
  game.p_time += 1
}

fn drawMen(x : Int, y : Int) -> Unit {
  @wasm.rect(x, y + 1, 1, 1)
  @wasm.rect(x, y + 3, 1, 1)
  @wasm.rect(x, y + 4, 1, 1)
  @wasm.rect(x + 7, y, 1, 1)
  @wasm.rect(x + 7, y + 1, 1, 1)
  @wasm.rect(x + 7, y + 2, 1, 1)
  @wasm.rect(x + 7, y + 3, 1, 1)
  @wasm.rect(x + 7, y + 4, 1, 1)
  @wasm.rect(x + 7, y + 5, 1, 1)
  for i = x; i > x - 6; i = i - 1 {
    @wasm.rect(i, y, 1, 1)
    @wasm.rect(i, y + 2, 1, 1)
    @wasm.rect(i, y + 5, 1, 1)
    @wasm.rect(i + 13, y, 1, 1)
    @wasm.rect(i + 13, y + 2, 1, 1)
    @wasm.rect(i + 13, y + 5, 1, 1)
  }
  for i = y; i < y + 20; i = i + 1 {
    @wasm.rect(x - 6, i, 1, 1)
    @wasm.rect(x + 13, i, 1, 1)
  }
  for i = 1; i <= 3; i = i + 1 {
    @wasm.rect(x + 13 - i, y + 20 - i, 1, 1)
  }
}

fn critical(x : Int) -> Int {
  let r = @random.new(seed=sed[game.g_time % 9])
  for i = 0; i < game.rng + 2; i = i + 1 {
    game.rng = r.int(limit=101)
  }
  if x >= game.rng {
    return 2
  }
  game.rng = r.int(limit=101) + r.int(limit=101) + 1
  return 1
}

fn level_up() -> Unit {
  if player.finish == 0 {
    player.finish = game.g_time
    for ; player.exp > 100; {
      player.level += 1
      player.max_hp += 50
      player.hp = player.max_hp
      player.exp -= 100
    }
  }
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(0, index=2)
  @wasm.text("Level Up!", 50, 20)
  @wasm.text("HP MAX", 50, 40)
  @wasm.text("MAX_HP UP!", 50, 60)
  if game.g_time - player.finish >= 70 {
    player.finish = 0
    game.bscene = None
    game.scene = game.lscene
  }
}
