

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}
protocol Flyable {
    var airspeed: Double { get }
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    let canFly = true
    
    var airspeed: Double {
        3 * frequency * amplitude
    }
}

struct Penguin: Bird {
  let name: String
  let canFly = false
}

struct SwiftBird: Bird, Flyable {
  var name: String { "Swift \(version)" }
  let canFly = true
  let version: Double
  private var speedFactor = 1000.0
  
  init(version: Double) {
    self.version = version
  }

  // Swift is FASTER with each version!
  var airspeed: Double {
    version * speedFactor
  }
}


print(FlappyBird(name: "amiro", amplitude: 39, frequency: 9))
