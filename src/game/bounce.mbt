fn men() -> Unit {
  if gameStatus.konami == "uuddlrlrxz" {
    gameStatus.konami = ""
    gameStatus.scene = Secret
    gameStatus.buttontime = 0
  }
  if gameStatus.buttontime >= 200 {
    gameStatus.buttontime = 0
    gameStatus.scene = gameStatus.lscene
  }
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(3, index=2)
  drawMen(73, 15)
  @wasm.text("You Find The Code!", 10, 50)
  @wasm.text("Health Full", 20, 90)
  @wasm.text("Level MAX", 40, 90)
  @wasm.text("All skill is \nunlocked", 30, 120)
  // @wasm.text(gameStatus.buttontime.to_string(), 20, 120)
  gameStatus.buttontime += 1
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

fn critical(x : Int) -> Bool {
  return x >= rng.int(limit=101)
}
