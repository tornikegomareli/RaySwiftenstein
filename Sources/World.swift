import Raylib

public struct World {
  public var player: Player
  public var map: Tilemap

  public init(map: Tilemap) {
    self.map = map
    self.player = Player(position: map.size / 2)
  }
}

public extension World {
  mutating func update() {
    player.position = player.position + (player.velocity / 60)

    // Don't let player frame update to be bigger then scale of world
    // And truncate it.
    player.position.x.formTruncatingRemainder(dividingBy: size.x * scaleOfWorld)
    player.position.y.formTruncatingRemainder(dividingBy: size.y * scaleOfWorld)
  }

  var size: Vector {
    return map.size
  }

  var scaleOfWorld: Double {
    let gridWidth = Double(map.width)
    let gridHeight = Double(map.height)

    let desiredCoverageRatio = 1.0  // 100% coverage
    
    let scaleX = (windowWidth * desiredCoverageRatio) / gridWidth
    let scaleY = (windowHeight * desiredCoverageRatio) / gridHeight

    let scale = min(scaleX, scaleY)
    return scale
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
