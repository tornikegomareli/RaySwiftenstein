import Raylib

public struct World {
  public var player: Player!
  public var map: Tilemap

  public init(map: Tilemap) {
    self.map = map
    for y in 0 ..< map.height {
      for x in 0 ..< map.width {
        let position = Vector(x: Double(x) * scaleOfWorld, y: Double(y) * scaleOfWorld)
        let thing = map.things[y * map.width + x]
        switch thing {
        case .nothing:
          break
        case .player:
          self.player = Player(position: position)
        }
      }
    }
  }
}

public extension World {
  // Little bit bad naming, we are only updating player positions here
  // name update makes little bit miss understanding, someone will think that whole world positions are updated in that method
  // we will see what we will need in future and decide how to deal with that
  // For no let it be how it is.
  mutating func update(input: Input) {
    player.velocity = input.velocity * player.speed * scaleOfWorld
    player.position = player.position + player.velocity

    for y in 0 ..< map.height {
      for x in 0 ..< map.width where map[x, y].isWall {
        let rect = Rect(
          min: Vector(x: Double(x), y: Double(y)) * scaleOfWorld,
          max: Vector(x: Double(x + 1), y: Double(y + 1)) * scaleOfWorld
        )

        if Raylib.checkCollisionRecs(rect.toRaylibRectangle(), player.rect.toRaylibRectangle()) {
          print("Collision!")
          player.position = player.position - player.velocity
        }
      }
    }
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
