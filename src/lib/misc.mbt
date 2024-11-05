pub fn draw_pixel(x : Int, y : Int) -> Unit {
  if checkOutmap(x, y) {
    @wasm.rect(x, y, 1, 1)
  }
}

pub type DrawEnemy (Int, Int, Int) -> Unit

fn checkOutmap(x : Int, y : Int) -> Bool {
  if x > 160 || y > 160 || x < 0 || y < 0 {
    return false
  }
  return true
}
