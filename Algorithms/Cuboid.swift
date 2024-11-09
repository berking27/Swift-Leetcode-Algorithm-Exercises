//
//  CubiqQuiz.swift
//  Algorithms
//
//  Created by Berkin Demirel on 9.11.2024.
//

import Foundation

class Rectangle {
    
    fileprivate var width: Double
    fileprivate var length: Double
    
    init() {
        self.width = 1.0
        self.length = 1.0
    }
    
    init(width: Double, length: Double) {
        self.width = width
        self.length = length
    }
    
    
    func getArea() -> Double {
        return width * length
    }
    
}

class Cuboid: Rectangle {
    private var height: Double = 1.0
    
    override init() {
        self.height = 1.0
        super.init()
    }
    
    init(width: Double, length: Double, height: Double) {
        super.init(width: width, length: length)
        self.height = height
    }
    
    func getVolume() -> Double {
        return width * length * height
    }
    
    func getHeight() -> Double {
        return height
    }
    
    func getSurfaceArea() -> Double {
        return 2 * (width * length + length * height + width * height)
    }
}

class ColoredCuboid: Cuboid {
    private var color: String
    
    override init() {
        self.color = "white"
        super.init()
    }
    
    init(width: Double, length: Double, height: Double, color: String) {
        self.color = color
        super.init(width: width, length: length, height: height)
    }
    
    func displayDetails() {
        
        var area: Double = 0.0
        var volume: Double = 0.0
        
        area = getSurfaceArea()
        volume = getVolume()
        
        let details = "Width: \(width), Length: \(length), Height: \(getHeight()), Color: \(color), Area: \(area), Volume: \(volume)"
        print(details)
    }
    
}
