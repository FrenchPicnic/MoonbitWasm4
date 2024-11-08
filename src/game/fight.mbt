struct Round {
  mut status : String
  mut enemy : EnemyStatus
}

let round : Round = Round::default()

fn Round::default() -> Round {
  { status: "player", enemy: EnemyStatus::default() }
}

fn Round::fight(state : String, enemy : EnemyStatus) -> Unit {
  game.r_time += 1
  if state == "attack" {
    if player.round == Default && player.battle == Default {
      player.round = Anime
      player.battle = Attack
    }
    sword_attack(enemy)
  } else if state == "defense" {
    player.state = "defense"
    battleRound.status = "enemy"
    enemy.battle = Default
    enemy.round = Default
    player.selfround = false
    game.r_time = 0
  } else if state == "heal" {
    player.hp = @math.minimum(player.hp + 10, player.max_hp)
    battleRound.status = "enemy"
    enemy.battle = Default
    enemy.round = Default
    player.selfround = false
    game.r_time = 0
  }
}

fn Round::battle(enemy : EnemyStatus) -> Unit {
  if player.hp <= 0 {
    game.scene = Defeat
  }
  if sheep.hp <= 0 {
    game.scene = Victory
    world.enemylist = delete_enemy(world.enemylist, round.enemy.name)
    round.enemy = EnemyStatus::default()
  }
  round_scene()
  // @wasm.set_draw_colors(2, index=1)
  // @wasm.set_draw_colors(1, index=2)
  // @wasm.text(player.round.to_string() + "  " + game.r_time.to_string(), 50, 100)
  if battleRound.status == "player" {
    enemy.draw(x=enemy.round_pos.x, y=enemy.round_pos.y, Fight)
    if player.selfround {
      fight(battleStatus[choice.option - 1], round.enemy)
    } else {
      game.r_time = 0
      draw_hero(player.round_pos.x, player.round_pos.y, size=3)
    }
  } else {
    draw_hero(player.round_pos.x, player.round_pos.y, size=3)
    game.r_time += 1
    choice.option = 0
    (enemy.ai._)(enemy)
  }

  // return false
}

fn damage_enemy(power : Int, crit : Int, enemy : EnemyStatus) -> Unit {
  let damage = power * critical(crit)
  if enemy.battle == Defense {
    enemy.hp -= damage / 2
  } else {
    enemy.hp -= damage
  }
}

fn damage_player(power : Int, crit : Int, hero : PlayerStatus) -> Unit {
  let damage = power * critical(crit)
  if hero.state == "defense" {
    hero.hp -= damage / 2
  } else {
    hero.hp -= damage
  }
}
