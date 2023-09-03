public struct Tilemap: Decodable {
  private let tiles: [Tile]
  public let width: Int
  public let things: [Thing]
}

public extension Tilemap {
  var height: Int {
    return tiles.count / width
  }

  var size: Vector {
    return Vector(x: Double(width), y: Double(height))
  }

  subscript(x: Int, y: Int) -> Tile {
    return tiles[y * width + x]
  }
}
