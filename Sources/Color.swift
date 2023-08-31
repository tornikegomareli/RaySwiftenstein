import Raylib

public struct CustomColor {
  public var r, g, b, a: UInt8
  
  public init(r: UInt8, g: UInt8, b: UInt8, a: UInt8 = 255) {
    self.r = r
    self.g = g
    self.b = b
    self.a = a
  }


  public var raylibColor: Color {
    return Color(r: r, g: g, b: b, a: a)
  }
}

public extension CustomColor {
  static let clear = CustomColor(r: 0, g: 0, b: 0, a: 0)
  static let black = CustomColor(r: 0, g: 0, b: 0)
  static let white = CustomColor(r: 255, g: 255, b: 255)
  static let gray = CustomColor(r: 192, g: 192, b: 192)
  static let red = CustomColor(r: 255, g: 0, b: 0)
  static let green = CustomColor(r: 0, g: 255, b: 0)
  static let blue = CustomColor(r: 0, g: 0, b: 255)
}
