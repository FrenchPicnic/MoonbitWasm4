struct World {
  mut enemylist : Array[EnemyStatus]
  mut xpos : Int
  mut ypos : Int
}

fn World::new() -> World {
  return { enemylist: [sheep], xpos: 0, ypos: 0 }
}

fn World::generate() -> Unit {
  for k in world.enemylist {
    k.draw(World)
  }
  draw_hero(player.map_pos.x, player.map_pos.y)
  if game.scene == World {
    check_collision()
  }
}

fn World::fight_anime() -> Unit {
  if game.a_time >= 180 {
    game.scene = Fight
    battle(round.enemy)
    return
  }
  if game.a_time <= 70 {
    generate()
    @wasm.set_draw_colors(3, index=2)
    for i = 0; i <= 160; i = i + 8 {
      for k = 0; k < 4; k = k + 1 {
        for j = 0; j < game.a_time * 4; j = j + 1 {
          @lib.draw_pixel(i + k, j)
          @lib.draw_pixel(i + k + 4, 160 - j)
        }
      }
    }
  } else if game.a_time <= 110 {
    @wasm.set_draw_colors(3, index=1)
    @wasm.set_draw_colors(3, index=2)
    @wasm.rect(0, 0, 160, 160)
    enemy_small(round.enemy)
  } else {
    battle(round.enemy)
    @wasm.set_draw_colors(3, index=2)
    for i = 0; i <= 160; i = i + 8 {
      for k = 0; k < 4; k = k + 1 {
        for j = 0; j < (180 - game.a_time) * 4; j = j + 1 {
          @lib.draw_pixel(i + k + 4, j)
          @lib.draw_pixel(i + k, 160 - j)
        }
      }
    }
  }
  game.a_time += 1
}

// 伪碰撞箱检测
fn check_collision() -> Unit {
  for k in world.enemylist {
    if (
        player.map_pos.x + 8 <= k.map_pos.x ||
        player.map_pos.x >= k.map_pos.x + k.hitbox.width
      ) ||
      player.map_pos.y + 8 <= k.map_pos.y ||
      player.map_pos.y >= k.map_pos.y + k.hitbox.height {
      continue
    } else {
      game.lscene = World
      game.scene = FightAnime
      game.r_time = 0
      round.enemy = k
      return
    }
  }
}

fn enemy_small(self : EnemyStatus) -> Unit {
  @wasm.set_draw_colors(1, index=1)
  @wasm.set_draw_colors(3, index=2)
  // @wasm.text()
  @wasm.rect(50, 50, 50, 50)
  @wasm.set_draw_colors(2, index=1)
  @wasm.set_draw_colors(0, index=2)
  @wasm.text(self.name.to_string(), 55, 60)
  (self.draw._)(70, 80, 1)
}
