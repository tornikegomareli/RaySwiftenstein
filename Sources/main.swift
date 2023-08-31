// The Swift Programming Language
// https://docs.swift.org/swift-book

import Raylib

struct Main {
  var world = World()

  init() {
    Raylib.initWindow(Int32(world.size.x), Int32(world.size.y), "MyGame")
    Raylib.setTargetFPS(60)
  }

  mutating func startGame() {
    var renderer = Renderer(width: 10, height: 10)

    while Raylib.windowShouldClose == false {
      world.update()
      renderer.draw(world)
    }

    Raylib.closeWindow()
  }
}


var instance = Main()
instance.startGame()


