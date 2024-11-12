fn shield(x : Int, y : Int) -> Unit {
  two_color(2, 3)
  @wasm.rect(x, y, 1, 1)
  @wasm.rect(x - 1, y, 1, 1)
  @wasm.rect(x - 2, y + 1, 1, 1)
  @wasm.rect(x - 3, y + 1, 1, 1)
  @wasm.rect(x - 4, y + 2, 1, 1)
  @wasm.rect(x - 4, y + 3, 1, 1)
  @wasm.rect(x - 4, y + 4, 1, 1)
  @wasm.rect(x - 3, y + 5, 1, 1)
  @wasm.rect(x - 3, y + 6, 1, 1)
  @wasm.rect(x - 2, y + 7, 1, 1)
  @wasm.rect(x - 1, y + 8, 1, 1)
  @wasm.rect(x, y + 9, 1, 1)
  @wasm.rect(x + 1, y, 1, 1)
  @wasm.rect(x + 2, y + 1, 1, 1)
  @wasm.rect(x + 3, y + 1, 1, 1)
  @wasm.rect(x + 4, y + 2, 1, 1)
  @wasm.rect(x + 4, y + 3, 1, 1)
  @wasm.rect(x + 4, y + 4, 1, 1)
  @wasm.rect(x + 3, y + 5, 1, 1)
  @wasm.rect(x + 3, y + 6, 1, 1)
  @wasm.rect(x + 2, y + 7, 1, 1)
  @wasm.rect(x + 1, y + 8, 1, 1)
}

// fn sword(x : Int, y : Int) -> Unit {
//   @wasm.set_draw_colors(2, index=1)
//   @wasm.set_draw_colors(3, index=2)
//   for i = 0; i < 3; i = i + 1 {
//     @wasm.rect(x - i, y, 1, 1)
//     @wasm.rect(x, y + i, 1, 1)
//   }
//   for i = 1; i < 7; i = i + 1 {
//     @wasm.rect(x - 2 - i, y + i, 1, 1)
//     @wasm.rect(x - i, y + 2 + i, 1, 1)
//   }
//   for i = 0; i < 7; i = i + 1 {
//     @wasm.rect(x - 11 + i, y + 5 + i, 1, 1)
//   }
//   for i = 0; i < 3; i = i + 1 {
//     @wasm.rect(x - 9 - i, y + 9 + i, 1, 1)
//   }
// }
