import Raylib

public struct Bitmap {
  public private(set) var pixels: [CustomColor]
  public let width: Int
  
  public init(width: Int, pixels: [CustomColor]) {
    self.width = width
    self.pixels = pixels
  }

  init(width: Int, height: Int, color: CustomColor) {
    self.pixels = Array(repeating: color, count: width * height)
    self.width = width
  }

  mutating func fill(rect: Rect, color: CustomColor) {
    for y in Int(rect.min.y) ..< Int(rect.max.y) {
      for x in Int(rect.min.x) ..< Int(rect.max.x) {
        self[x, y] = color
      }
    }
  }
}

public extension Bitmap {
  var height: Int {
    return pixels.count / width
  }
  
  subscript(x: Int, y: Int) -> CustomColor {
    get { return pixels[y * width + x] }
    set {
      guard x >= 0, y >= 0, x < width, y < height else {
        return
      }
      pixels[y * width + x] = newValue
    }
  }
}
