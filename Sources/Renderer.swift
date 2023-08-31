import Raylib

public struct Renderer {
  public private(set) var bitmap: Bitmap


  public init(width: Int, height: Int) {
    self.bitmap = Bitmap(width: width, height: height, color: .blue)
  }
}

public extension Renderer {
  mutating func draw(_ world: World) {
    let scale = Double(bitmap.height) / world.size.y

    Raylib.beginDrawing()
    Raylib.clearBackground(.rayWhite)

    var rect = world.player.rect
    rect.min *= scale
    rect.max *= scale
    bitmap.fill(rect: rect, color: .blue)
    drawBitmap(bitmap, x: Int(world.player.position.x), y: Int(world.player.position.y))
    Raylib.drawFPS(10, 10)

    Raylib.endDrawing()
  }

  func drawBitmap(_ bitmap: Bitmap, x: Int, y: Int) {
    for i in 0..<bitmap.height {
      for j in 0..<bitmap.width {
        let pixelColor = bitmap[i, j]
        Raylib.drawPixel(Int32(x + j), Int32(y + i), pixelColor.raylibColor)
      }
    }
  }
}
