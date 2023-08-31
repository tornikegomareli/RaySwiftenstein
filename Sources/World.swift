import Raylib

public struct World {
  public let size: Vector
  public var player: Player

  public init() {
    self.size = Vector(x: 450, y: 450)
    self.player = Player(position: Vector(x: 4, y: 4))
  }
}

public extension World {
  mutating func update() {
    player.position = player.position + (player.velocity / 60)
    player.position.x.formTruncatingRemainder(dividingBy: size.x)
    player.position.y.formTruncatingRemainder(dividingBy: size.y)
  }
}


extension Vector2 {
  static func / (lhs: Vector2, rhs: Int) -> Vector2 {
    return Vector2.init(x: lhs.x / Float(rhs), y: lhs.y / Float(rhs))
  }

  // Vector + Vector
  static func + (lhs: Vector2, rhs: Vector2) -> Vector2 {
      return Vector2(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }

  // Vector + Float
  static func + (lhs: Vector2, rhs: Float) -> Vector2 {
      return Vector2(x: lhs.x + rhs, y: lhs.y + rhs)
  }

  // Float + Vector
  static func + (lhs: Float, rhs: Vector2) -> Vector2 {
      return rhs + lhs
  }

  // Vector - Vector
  static func - (lhs: Vector2, rhs: Vector2) -> Vector2 {
      return Vector2(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
  }

  // Vector - Float
  static func - (lhs: Vector2, rhs: Float) -> Vector2 {
      return Vector2(x: lhs.x - rhs, y: lhs.y - rhs)
  }

  // Float - Vector (This will negate the Vector components)
  static func - (lhs: Float, rhs: Vector2) -> Vector2 {
      return Vector2(x: lhs - rhs.x, y: lhs - rhs.y)
  }

  // Vector * Vector (Component-wise multiplication)
  static func * (lhs: Vector2, rhs: Vector2) -> Vector2 {
      return Vector2(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
  }

  // Vector * Float
  static func * (lhs: Vector2, rhs: Float) -> Vector2 {
      return Vector2(x: lhs.x * rhs, y: lhs.y * rhs)
  }

  // Float * Vector
  static func * (lhs: Float, rhs: Vector2) -> Vector2 {
      return rhs * lhs
  }

  // Vector / Vector (Component-wise division)
  static func / (lhs: Vector2, rhs: Vector2) -> Vector2 {
      return Vector2(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
  }

  // Vector / Float
  static func / (lhs: Vector2, rhs: Float) -> Vector2 {
      return Vector2(x: lhs.x / rhs, y: lhs.y / rhs)
  }

  // Float / Vector (This will invert the Vector components)
  static func / (lhs: Float, rhs: Vector2) -> Vector2 {
      return Vector2(x: lhs / rhs.x, y: lhs / rhs.y)
  }
}
