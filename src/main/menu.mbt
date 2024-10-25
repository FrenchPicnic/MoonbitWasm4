pub fn menu(ch : Int) -> Unit {
  let mut tmp = ch
  if ch > 4 && ch < 10 {
    tmp = 10
  }
  @wasm.rect(0, 100, 160, 60)
  @wasm.text("Fight", 10, 120 - 5 * (1 == tmp / 10).to_int())
  @wasm.text("Defense", 60, 120 - 5 * (2 == tmp / 10).to_int())
  @wasm.text("Heal", 120, 120 - 5 * (3 == tmp / 10).to_int())
}
