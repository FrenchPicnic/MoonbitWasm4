// 敌人稀有度
enum EnemyType {
  Normal
} derive(Eq, Show)

// 敌人列表
enum EnemyName {
  Sheep
  Pumpkin
} derive(Eq, Show)

// 回合状态
// 动画/行动/默认
enum RoundStatus {
  Anime
  Action
  Default
} derive(Eq, Show)

// 战斗状态
// 防御/攻击/治疗/默认
enum BattleStatus {
  Heal
  Defense
  Attack
  Default
} derive(Eq, Show)

type Anime (EnemyStatus, Skill) -> Unit

type AI (EnemyStatus) -> Unit

struct EnemyStatus {
  mut hp : Int
  max_hp : Int
  danger : EnemyType
  name : EnemyName
  draw : @lib.DrawEnemy
  map_pos : Coordinate
  hitbox : HitBox
  mut battle : BattleStatus
  mut round : RoundStatus
  mut attack : Int
  mut defense : Int
  // mut heal:Int
  mut finish : Int
  round_pos : Coordinate
  ai : AI
  skill : Map[String, Skill]
}

struct Skill {
  anime_time : Int
  anime : Anime
  battle_type : BattleStatus
  damage : Int
  critical : Int
}

fn delete_enemy(
  enemylist : Array[EnemyStatus],
  name : EnemyName
) -> Array[EnemyStatus] {
  for i, x in enemylist {
    if x.name == name {
      let _ = enemylist.remove(i)
      return enemylist
    }
  }
  return enemylist
}

fn EnemyStatus::draw(
  self : EnemyStatus,
  ~x : Int = self.map_pos.x,
  ~y : Int = self.map_pos.y,
  scene : Scene
) -> Unit {
  if scene == Fight {
    (self.draw._)(x, y, 3)
  } else if scene == World {
    (self.draw._)(x, y, 1)
  }
}

fn EnemyStatus::pos(self : EnemyStatus, x : Int, y : Int) -> Unit {
  self.map_pos.x = x
  self.map_pos.y = y
}

fn EnemyStatus::round_reset(self : EnemyStatus) -> Unit {
  self.round = Default
  self.finish = 0
  game.r_time = 0
  self.draw(x=self.round_pos.x, y=self.round_pos.y, Fight)
  battleRound.status = "player"
}

fn EnemyStatus::default() -> EnemyStatus {
  {
    hp: 0,
    round: Default,
    battle: Default,
    danger: Normal,
    max_hp: 0,
    name: Sheep,
    attack: 0,
    defense: 0,
    finish: 0,
    map_pos: Coordinate::{ x: 0, y: 0 },
    round_pos: Coordinate::{ x: 0, y: 0 },
    hitbox: { width: 0, height: 0 },
    draw: @lib.draw_default,
    skill: {},
    ai: default_ai,
  }
}

let sheep : EnemyStatus = {
  hp: 200,
  round: Default,
  battle: Default,
  danger: Normal,
  max_hp: 200,
  name: Sheep,
  attack: 0,
  defense: 0,
  finish: 0,
  map_pos: Coordinate::{ x: 20, y: 20 },
  round_pos: Coordinate::{ x: 110, y: 50 },
  hitbox: { width: 12, height: 7 },
  draw: @lib.draw_sheep,
  skill: {
    "stampede": Skill::{
      anime_time: 30,
      anime: sheep_stampede,
      battle_type: Attack,
      damage: 10,
      critical: 5,
    },
  },
  ai: sheep_ai,
}

// let pumpkin : EnemyStatus = {
//   hp: 200,
//   round: Default,
//   battle: Default,
//   danger: Normal,
//   anime: { "stampede": 30 },
//   max_hp: 200,
//   name: Pumpkin,
//   attack: 0,
//   defense: 0,
//   finish: 0,
//   hitbox: { width: 0, height: 0 },
//   xpos: 0,
//   ypos: 0,
// }
