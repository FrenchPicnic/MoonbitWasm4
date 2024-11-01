struct World {
  enemylist : Array[EnemyStatus]
}

fn World::new() -> World {
  sheep.pos(90, 90)
  return { enemylist: [sheep] }
}

fn world_generate() -> Unit {
  for k in world.enemylist {
    k.draw(k.xpos, k.ypos)
  }
  @lib.draw_hero(player.xpos, player.ypos)
  check_collision()
}

fn check_collision() -> Unit {
  for k in world.enemylist {
    if (player.xpos >= k.xpos && player.xpos <= k.xpos + k.hitbox.width) ||
      (player.ypos >= k.ypos && player.ypos <= k.ypos + k.hitbox.height) {
      game.lscene = World
      game.scene = Fight
      return
    }
  }
}
