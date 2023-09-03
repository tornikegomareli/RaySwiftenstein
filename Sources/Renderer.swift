import Raylib

public struct Renderer {
  public private(set) var playerBitmap: Bitmap
  public private(set) var scale: Double

  public init(width: Int, height: Int, scale: Double) {
    // Scale player bitmap based on scale of world
    self.playerBitmap = Bitmap(width: width + Int(scale), height: height + Int(scale), color: .blue)
    self.scale = scale
  }
}

public extension Renderer {
  mutating func draw(_ world: World) {
    Raylib.beginDrawing()
    Raylib.clearBackground(.black)

    // Draw map
    drawMap(world: world, scale: scale)
    //drawPlayer(player: world.player, scale: scale)

    // Draw Player
    var rect = world.player.rect
    rect.min *= scale
    rect.max *= scale
    playerBitmap.fill(rect: rect, color: .blue)
    drawPlayerBitmap(playerBitmap, x: Int(world.player.position.x), y: Int(world.player.position.y))



    Raylib.drawFPS(10, 10)
    Raylib.endDrawing()
  }

  func drawPlayerBitmap(_ bitmap: Bitmap, x: Int, y: Int) {
    for i in 0..<bitmap.height {
      for j in 0..<bitmap.width {
        let pixelColor = bitmap[i, j]
        Raylib.drawPixel(Int32(x + j), Int32(y + i), pixelColor.raylibColor)
      }
    }
  }

//  func drawPlayer(player: Player, scale: Double) {
//    for y in 0 ..< Int32(player.position.y) {
//      for x in 0 ..< Int32(player.position.x) {
//        let rect = Rect(
//          min: Vector(x: Double(x), y: Double(y)),
//          max: Vector(x: Double(x + 1), y: Double(y + 1))
//        )
//
//        Raylib.drawRectangle(Int32(player.position.x + Double(x)), Int32(player.position.y + Double(y)), Int32(rect.toRaylibRectangle().width), Int32(rect.toRaylibRectangle().height), .blue)
//      }
//    }
//  }

  func drawMap(world: World, scale: Double) {
    for y in 0 ..< world.map.height {
      for x in 0 ..< world.map.width where world.map[x, y].isWall {
        let rect = Rect(
          min: Vector(x: Double(x), y: Double(y)) * scale,
          max: Vector(x: Double(x + 1), y: Double(y + 1)) * scale
        )

        Raylib.drawRectangleRec(rect.toRaylibRectangle(), .white)
      }
    }
  }
}
