//
//  Globals.swift
//
//
//  Created by Tornike on 03/09/2023.
//

import Foundation

// GLOBAL VARIABLES
let windowWidth = 640.0
let windowHeight = 640.0
let wasdMovementRadius: Double = 40

func loadMap() -> Tilemap {
  let jsonData = try! Data(contentsOf: URL(fileURLWithPath: "/Users/tornikegomareli/Development/RaySwiftenstein/Map.json"))
  return try! JSONDecoder().decode(Tilemap.self, from: jsonData)
}
