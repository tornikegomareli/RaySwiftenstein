import Raylib

public struct Player {
  public var position: Vector
  public var velocity: Vector
  public let radius: Double = 0.5


  public init(position: Vector) {
    self.position = position
    self.velocity = Vector(x: 100, y: 100)
  }

  var rect: Rect {
    let halfSize = Vector(x: radius, y: radius)
    return Rect(min: position - halfSize, max: position + halfSize)
  }
}
