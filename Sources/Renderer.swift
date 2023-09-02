import Raylib

public struct Renderer {
  public private(set) var bitmap: Bitmap
  public private(set) var scale: Double

  public init(width: Int, height: Int, scale: Double) {
    self.bitmap = Bitmap(width: width, height: height, color: .blue)
    self.scale = scale
  }
}

public extension Renderer {
  mutating func draw(_ world: World) {
    Raylib.beginDrawing()
    Raylib.clearBackground(.rayWhite)

    // Draw Player
    var rect = world.player.rect
    rect.min *= scale
    rect.max *= scale
    bitmap.fill(rect: rect, color: .blue)

    drawMap(world: world, scale: scale)
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

  func drawMap(world: World, scale: Double) {
    for y in 0 ..< world.map.height {
      for x in 0 ..< world.map.width where world.map[x, y].isWall {
        let rect = Rect(
          min: Vector(x: Double(x), y: Double(y)) * scale,
          max: Vector(x: Double(x + 1), y: Double(y + 1)) * scale
        )

        Raylib.drawRectangleRec(rect.toRaylibRectangle(), .black)
      }
    }
  }
}
