public struct Tilemap: Decodable {
  private let tiles: [Tile]
  private let width: Int

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

