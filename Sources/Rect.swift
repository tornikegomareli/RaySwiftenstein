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

  func intersection(with rect: Rect) -> Vector? {
    let left = Vector(x: max.x - rect.min.x, y: 0)
    if left.x <= 0 {
      return nil
    }
    let right = Vector(x: min.x - rect.max.x, y: 0)
    if right.x >= 0 {
      return nil
    }
    let up = Vector(x: 0, y: max.y - rect.min.y)
    if up.y <= 0 {
      return nil
    }
    let down = Vector(x: 0, y: min.y - rect.max.y)
    if down.y >= 0 {
      return nil
    }
    return [left, right, up, down]
      .sorted(by: { $0.length < $1.length }).first
  }
}
