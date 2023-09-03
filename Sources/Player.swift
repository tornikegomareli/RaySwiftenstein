import Raylib

public struct Player {
  public var position: Vector
  public var velocity: Vector
  public var speed: Double = 100
  public let radius: Double = 0.5


  public init(position: Vector) {
    self.position = position
    self.velocity = Vector(x: 0, y: 0)
  }

  var rect: Rect {
    let halfSize = Vector(x: radius, y: radius)
    return Rect(min: position - halfSize, max: position + halfSize)
  }
}
