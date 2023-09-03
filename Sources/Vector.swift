//
//  File.swift
//
//
//  Created by Tornike on 31/08/2023.
//

import Foundation
import Raylib

public struct Vector {
  public var x, y: Double

  public init(x: Double, y: Double) {
    self.x = x
    self.y = y
  }
}

public extension Vector {
  func toRaylibVector() -> Vector2 {
    return Vector2.init(x: Float(self.x), y: Float(self.y))
  }
  
  var length: Double {
    return (x * x + y * y).squareRoot()
  }

  static func + (lhs: Vector, rhs: Vector) -> Vector {
    return Vector(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
  }

  static func - (lhs: Vector, rhs: Vector) -> Vector {
    return Vector(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
  }

  static func * (lhs: Vector, rhs: Double) -> Vector {
    return Vector(x: lhs.x * rhs, y: lhs.y * rhs)
  }

  static func / (lhs: Vector, rhs: Double) -> Vector {
    return Vector(x: lhs.x / rhs, y: lhs.y / rhs)
  }

  static func * (lhs: Double, rhs: Vector) -> Vector {
    return Vector(x: lhs * rhs.x, y: lhs * rhs.y)
  }

  static func / (lhs: Double, rhs: Vector) -> Vector {
    return Vector(x: lhs / rhs.x, y: lhs / rhs.y)
  }

  static func += (lhs: inout Vector, rhs: Vector) {
    lhs.x += rhs.x
    lhs.y += rhs.y
  }

  static func -= (lhs: inout Vector, rhs: Vector) {
    lhs.x -= rhs.x
    lhs.y -= rhs.y
  }

  static func *= (lhs: inout Vector, rhs: Double) {
    lhs.x *= rhs
    lhs.y *= rhs
  }

  static func /= (lhs: inout Vector, rhs: Double) {
    lhs.x /= rhs
    lhs.y /= rhs
  }

  static prefix func - (rhs: Vector) -> Vector {
    return Vector(x: -rhs.x, y: -rhs.y)
  }
}
