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
  Fight
  Default
} derive(Eq, Show)

// 战斗状态
// 防御/攻击/治疗/默认
enum BattleStatus {
  // Heal
  Defense
  Attack
  Default
} derive(Eq, Show)

struct EnemyStatus {
  mut hp : Int
  mut battle : BattleStatus
  mut round : RoundStatus
  danger : EnemyType
  anime : Map[String, Int]
  max_hp : Int
  name : EnemyName
  draw : @lib.DrawEnemy
  mut attack : Int
  mut defense : Int
  mut finish : Int
  map_pos : Coordinate
  hitbox : HitBox
  round_pos : Coordinate
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

fn EnemyStatus::ai(self : EnemyStatus) -> Unit {
  match self.name {
    Sheep => {
      match self.battle {
        Default => if rng.int(limit=10) == 10 { self.battle = Attack }
        Attack => sheep_stampede(self)
        Defense => if rng.int(limit=10) == 10 { self.battle = Attack }
      }
      @lib.draw_pixel(1, 1)
    }
    Pumpkin => @lib.draw_pixel(1, 1)
  }
}

fn EnemyStatus::pos(self : EnemyStatus, x : Int, y : Int) -> Unit {
  self.map_pos.x = x
  self.map_pos.y = y
}

fn EnemyStatus::default() -> EnemyStatus {
  {
    hp: 0,
    round: Default,
    battle: Default,
    danger: Normal,
    anime: {},
    max_hp: 0,
    name: Sheep,
    attack: 0,
    defense: 0,
    finish: 0,
    map_pos: Coordinate::{ x: 0, y: 0 },
    round_pos: Coordinate::{ x: 0, y: 0 },
    hitbox: { width: 0, height: 0 },
    draw: @lib.draw_sheep,
  }
}

let sheep : EnemyStatus = {
  hp: 200,
  round: Default,
  battle: Default,
  danger: Normal,
  anime: { "mie": 30 },
  max_hp: 200,
  name: Sheep,
  attack: 0,
  defense: 0,
  finish: 0,
  map_pos: Coordinate::{ x: 80, y: 80 },
  round_pos: Coordinate::{ x: 110, y: 50 },
  hitbox: { width: 12, height: 7 },
  draw: @lib.draw_sheep,
}

// let pumpkin : EnemyStatus = {
//   hp: 200,
//   round: Default,
//   battle: Default,
//   danger: Normal,
//   anime: { "mie": 30 },
//   max_hp: 200,
//   name: Pumpkin,
//   attack: 0,
//   defense: 0,
//   finish: 0,
//   hitbox: { width: 0, height: 0 },
//   xpos: 0,
//   ypos: 0,
// }
