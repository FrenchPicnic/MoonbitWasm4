struct PlayerStatus {
  mut hp : Int
  mut max_hp : Int
  mut level : Int
  map_pos : Coordinate
  round_pos : Coordinate
  bonus_pos : Coordinate
  mut battle : BattleStatus
  mut round : RoundStatus
  mut finish : Int
  mut selfround : Bool
}

let player : PlayerStatus = PlayerStatus::default()

fn PlayerStatus::default() -> PlayerStatus {
  {
    hp: 50,
    level: 1,
    max_hp: 50,
    map_pos: Coordinate::{ x: 20, y: 10 },
    round_pos: Coordinate::{ x: 20, y: 35 },
    bonus_pos: Coordinate::{ x: 0, y: 0 },
    battle: Default,
    round: Default,
    finish: 0,
    selfround: false,
  }
}

fn draw_hero(
  x : Int,
  y : Int,
  ~size : Int = 1,
  ~scene : RoundStatus = Default
) -> Unit {
  @lib.hero_body(x, y, ~size)
  if scene == Default {
    @lib.hero_sword(x, y, ~size)
  }
}

fn sword_attack(enemy : EnemyStatus) -> Unit {
  match player.round {
    Anime =>
      if game.r_time < 50 {
        draw_hero(player.round_pos.x + game.r_time, player.round_pos.y, size=3)
      } else if game.r_time >= 51 && game.r_time < 57 {
        draw_hero(
          player.round_pos.x + 50,
          player.round_pos.y,
          size=3,
          scene=Anime,
        )
        @lib.sword_1(player.round_pos.x + 50, player.round_pos.y, size=3)
      } else if game.r_time >= 57 && game.r_time < 63 {
        draw_hero(
          player.round_pos.x + 50,
          player.round_pos.y,
          size=3,
          scene=Anime,
        )
        @lib.sword_2(player.round_pos.x + 50, player.round_pos.y, size=3)
      } else if game.r_time >= 63 && game.r_time < 70 {
        draw_hero(
          player.round_pos.x + 50,
          player.round_pos.y,
          size=3,
          scene=Anime,
        )
        @lib.sword_3(player.round_pos.x + 50, player.round_pos.y, size=3)
        if game.r_time == 69 {
          player.round = Action
        }
      } else if game.r_time >= 70 && game.r_time < 120 {
        draw_hero(
          player.round_pos.x + (120 - game.r_time),
          player.round_pos.y,
          size=3,
          scene=Default,
        )
      } else if game.r_time >= 120 {
        draw_hero(player.round_pos.x, player.round_pos.y, size=3, scene=Default)
        round.status = "enemy"
        enemy.battle = Default
        enemy.round = Default
        player.battle = Default
        player.round = Default
        player.selfround = false
        game.r_time = 0
      }
    Action => {
      draw_hero(player.round_pos.x + 50, player.round_pos.y, size=3)
      damage_enemy(player.level * 10, 0, enemy)
      player.round = Anime
    }
    Default => return
  }
}
