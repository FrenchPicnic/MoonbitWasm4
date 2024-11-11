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
    player.battle = Defense
    round_enemy(enemy)
  } else if state == "heal" {
    player.hp = @math.minimum(player.hp + 10, player.max_hp)
    round_enemy(enemy)
  }
}

fn Round::battle(enemy : EnemyStatus) -> Unit {
  if player.hp <= 0 {
    game.scene = Defeat
  }
  if enemy.hp <= 0 {
    game.scene = Victory
    player.exp += enemy.level * 50
    delete_enemy(round.enemy.level)
    round.round_reset()
    return
  }
  round_scene(enemy)
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
}

fn damage_enemy(power : Int, crit : Int, enemy : EnemyStatus) -> Unit {
  let damage = power * critical(crit)
  if enemy.battle == Defense {
    enemy.hp -= damage / 2
    enemy.battle = Default
  } else {
    enemy.hp -= damage
  }
}

fn damage_player(power : Int, crit : Int, hero : PlayerStatus) -> Unit {
  let damage = power * critical(crit)
  if hero.battle == Defense {
    hero.hp -= damage / 2
    hero.battle = Default
  } else {
    hero.hp -= damage
  }
}

fn Round::round_reset(self : Round) -> Unit {
  self.status = "player"
  player.hp = player.max_hp
  player.battle = Default
  choice.option = 0
  player.selfround = false
  self.enemy = EnemyStatus::default()
}

fn Round::round_enemy(enemy : EnemyStatus) -> Unit {
  battleRound.status = "enemy"
  enemy.battle = Default
  enemy.round = Default
  player.selfround = false
  game.r_time = 0
  draw_hero(player.round_pos.x, player.round_pos.y, size=3)
}
