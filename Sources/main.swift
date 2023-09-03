// The Swift Programming Language
// https://docs.swift.org/swift-book

import Raylib
import Foundation

struct Main {
  var world = World(map: loadMap())

  init() {
    Raylib.initWindow(Int32(windowWidth), Int32(windowHeight), "RaySwiftenstein")
    Raylib.setTargetFPS(60)
  }

  mutating func startGame() {
    var renderer = Renderer(width: 10, height: 10, scale: world.scaleOfWorld)

    while Raylib.windowShouldClose == false {
      world.update()
      if Raylib.isKeyDown(.letterW) {
        print("WWWWWWWWWWWWWWWWWWWWW")
      }
      renderer.draw(world)
    }

    Raylib.closeWindow()
  }
}

var instance = Main()
instance.startGame()


