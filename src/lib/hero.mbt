pub fn draw_hero(x : Int, y : Int, ~size : Int = 1) -> Unit {
  @wasm.set_draw_colors(4, index=2)
  for i = 0; i < 1 * size; i = i + 1 {
    for j = 0; j < 1 * size; j = j + 1 {

      // 头发
      draw_pixel(x + i + 2 * size, y + j)
      draw_pixel(x + i + 3 * size, y + j)
      draw_pixel(x + i + 1 * size, y + j + 1 * size)
      draw_pixel(x + i + 1 * size, y + j + 2 * size)
      draw_pixel(x + i + 1 * size, y + j + 3 * size)
      draw_pixel(x + i + 2 * size, y + j + 2 * size)
      draw_pixel(x + i + 2 * size, y + j + 3 * size)

      // 帽子和眼睛
      draw_pixel(x + i + 5 * size, y + j)
      draw_pixel(x + i + 2 * size, y + j + 5 * size)
      draw_pixel(x + i + 3 * size, y + j + 5 * size)
      draw_pixel(x + i + 4 * size, y + j + 5 * size)
      draw_pixel(x + i + 5 * size, y + j + 5 * size)
      draw_pixel(x + i, y + j + 7 * size)
      draw_pixel(x + i + 1 * size, y + j + 6 * size)
      draw_pixel(x + i + 1 * size, y + j + 7 * size)
      draw_pixel(x + i + 4 * size, y + j + 2 * size)
      draw_pixel(x + i + 6 * size, y + j + 2 * size)

      // 脚和剑
      draw_pixel(x + i + 1 * size, y + j + 8 * size)
      draw_pixel(x + i + 2 * size, y + j + 8 * size)
      draw_pixel(x + i + 5 * size, y + j + 8 * size)
      draw_pixel(x + i + 6 * size, y + j + 8 * size)
      draw_pixel(x + i + 7 * size, y + j + 4 * size)
      draw_pixel(x + i + 8 * size, y + j + 4 * size)
      draw_pixel(x + i + 9 * size, y + j + 4 * size)
    }
  }
  @wasm.set_draw_colors(2, index=2)
  for i = 0; i < 1 * size; i = i + 1 {
    for j = 0; j < 1 * size; j = j + 1 {
      draw_pixel(x + i, y + j + 4 * size)
      draw_pixel(x + i, y + j + 5 * size)
      draw_pixel(x + i + 2 * size, y + j + 4 * size)
      draw_pixel(x + i + 3 * size, y + j + 2 * size)
      draw_pixel(x + i + 3 * size, y + j + 3 * size)
      draw_pixel(x + i + 3 * size, y + j + 4 * size)
      draw_pixel(x + i + 4 * size, y + j + 3 * size)
      draw_pixel(x + i + 5 * size, y + j + 2 * size)
      draw_pixel(x + i + 5 * size, y + j + 3 * size)
      draw_pixel(x + i + 5 * size, y + j + 4 * size)
      draw_pixel(x + i + 7 * size, y + j + 5 * size)
      draw_pixel(x + i + 8 * size, y + j + 5 * size)
      draw_pixel(x + i + 1 * size, y + j + 8 * size)
      draw_pixel(x + i + 2 * size, y + j + 8 * size)
      draw_pixel(x + i + 5 * size, y + j + 8 * size)
      draw_pixel(x + i + 6 * size, y + j + 8 * size)
    }
  }
  @wasm.set_draw_colors(3, index=2)
  for i = 0; i < 1 * size; i = i + 1 {
    for j = 0; j < 1 * size; j = j + 1 {

      // 头盔和剑其他部分
      draw_pixel(x + i + 4 * size, y + j)
      draw_pixel(x + i + 2 * size, y + j + 1 * size)
      draw_pixel(x + i + 3 * size, y + j + 1 * size)
      draw_pixel(x + i + 4 * size, y + j + 1 * size)
      draw_pixel(x + i + 5 * size, y + j + 1 * size)
      draw_pixel(x + i + 8 * size, y + j)
      draw_pixel(x + i + 8 * size, y + j + 1 * size)
      draw_pixel(x + i + 8 * size, y + j + 2 * size)
      draw_pixel(x + i + 8 * size, y + j + 3 * size)
      draw_pixel(x + i + 8 * size, y + j + 6 * size)

      // 衣服
      draw_pixel(x + i + 1 * size, y + j + 5 * size)
      draw_pixel(x + i + 2 * size, y + j + 6 * size)
      draw_pixel(x + i + 2 * size, y + j + 7 * size)
      draw_pixel(x + i + 3 * size, y + j + 6 * size)
      draw_pixel(x + i + 3 * size, y + j + 7 * size)
      draw_pixel(x + i + 4 * size, y + j + 6 * size)
      draw_pixel(x + i + 4 * size, y + j + 7 * size)
      draw_pixel(x + i + 5 * size, y + j + 6 * size)
      draw_pixel(x + i + 5 * size, y + j + 7 * size)
      draw_pixel(x + i + 6 * size, y + j + 5 * size)
    }
  }
}
