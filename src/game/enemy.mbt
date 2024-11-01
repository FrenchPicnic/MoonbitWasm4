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
  mut attack : Int
  mut defense : Int
  mut finish : Int
  hitbox : HitBox
  mut xpos : Int
  mut ypos : Int
}

struct HitBox {
  width : Int
  height : Int
}

fn EnemyStatus::draw(self : EnemyStatus, x : Int, y : Int) -> Unit {
  match self.name {
    Sheep =>
      if game.scene == Fight {
        @lib.draw_sheep(x, y, size=3)
      } else if game.scene == World {
        @lib.draw_sheep(x, y, size=1)
      }
    Pumpkin =>
      if game.scene == Fight {
        @lib.draw_pumpkin(x, y, size=3)
      } else if game.scene == World {
        @lib.draw_pumpkin(x, y, size=1)
      }
  }
}

fn EnemyStatus::ai(self : EnemyStatus) -> Unit {
  match self.name {
    Sheep => {
      match self.battle {
        Default => if rng.int(limit=10) == 10 { self.battle = Attack }
        Attack => sheep_stampede()
        Defense => if rng.int(limit=10) == 10 { self.battle = Attack }
      }
      @lib.draw_bits(1, 1)
    }
    Pumpkin => @lib.draw_bits(1, 1)
  }
}

fn EnemyStatus::pos(self : EnemyStatus, x : Int, y : Int) -> Unit {
  self.xpos = x
  self.ypos = y
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
  hitbox: { width: 12, height: 7 },
  xpos: 0,
  ypos: 0,
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
