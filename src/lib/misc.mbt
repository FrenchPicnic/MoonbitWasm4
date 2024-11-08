pub fn draw_pixel(x : Int, y : Int) -> Unit {
  if checkOutmap(x, y) {
    @wasm.rect(x, y, 1, 1)
  }
}

pub type DrawEnemy (Int, Int, Int) -> Unit

pub let draw_default : DrawEnemy = fn(x : Int, y : Int, size : Int) -> Unit {
  @wasm.rect(x, y, size, size)
}

fn checkOutmap(x : Int, y : Int) -> Bool {
  if x > 160 || y > 160 || x < 0 || y < 0 {
    return false
  }
  return true
}
