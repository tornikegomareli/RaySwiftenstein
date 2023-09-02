import Raylib

public struct Rect {
  var min, max: Vector

  public init(min: Vector, max: Vector) {
    self.min = min
    self.max = max
  }
}

extension Rect {
  func toRaylibRectangle() -> Rectangle {
    return Rectangle(
      x: Float32(self.min.x),
      y: Float32(self.min.y),
      width: Float32(self.max.x - self.min.x),
      height: Float32(self.max.y - self.min.y)
    )
  }
}
