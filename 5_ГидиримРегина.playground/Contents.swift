import UIKit

var greeting = "Hello, playground"

// // // //
import Foundation

enum windows {
    case open,close
}

enum engine {
    case running, off
}
//1// Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car: AnyObject {
    var model: String { get }
    var yearOfRelease: Int { get }
    var windows: windows { get set }
    var engine: engine { get set }
}
//2// Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д.
extension Car {
    func Windows(status: windows) {
        switch status {
        case .open:
            print("\(model): windows are opening...")
            self.windows = .open
        case .close:
            print("\(model): windows are closing...")
            windows = .close
        }
    }
    func Engine(status: engine) {
        switch status {
        case .running:
            print("\(model): engine switching on...")
            self.engine = .running
        case .off:
            print("\(model): engine switching off...")
            self.engine = .off
        }
    }
}

protocol TrunkCar: Car {
    var bodyVolume: Int { get }
    var bodyFreeSpace: Int { get }
    var cargoVolume: Int { get set }
}

extension TrunkCar {
    func PutCargoToBody(volume: Int) {
        if bodyFreeSpace >= volume {
            print("\(model): cargo volume \(volume) putting to the body...")
            self.cargoVolume += volume
        } else {
            print("?\(model): Not enough space in the body for cargo volume \(volume)")
        }
    }
    
    func RemoveCargoFromBody(volume: Int) {
        if self.bodyVolume >= volume {
            print("\(model): cargo volume \(volume) removing from the body...")
            self.cargoVolume -= volume
        } else {
            print("?\(model): No such amount of cargo(\(volume)) in the body")
        }
    }
}

protocol SportCar: Car {
    var maxSpeed: Int { get }
    var currentSpeed: Int { get set }
}
extension SportCar {
    func IncreaseSpeed(speed: Int) {
        if speed + currentSpeed <= maxSpeed {
            Swift.print("\(model): burns to speed \(speed)...")
            self.currentSpeed += speed
        } else {
            Swift.print("?\(model): can't accelerate to speed \(speed + currentSpeed) maximum speed - \(maxSpeed)")
    }
    func ReduceSpeed(speed: Int) {
        if self.currentSpeed >= speed {
            Swift.print("\(model): slow down at \(speed)...")
            self.currentSpeed -= speed
        } else {
            Swift.print("?\(model): stops...")
            self.currentSpeed = 0
        }
    }
}
//3// Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class trunkCar: TrunkCar {
    var model: String
    var yearOfRelease: Int
    var windows: windows
    var engine: engine
    let bodyVolume: Int
    var bodyFreeSpace: Int {
        get {
            return bodyVolume - cargoVolume
        }
    }
    var cargoVolume: Int
        
    init(model: String, yearOfRelease: Int, bodyVolume: Int) {
        self.bodyVolume = bodyVolume
        self.cargoVolume = 0
        self.model = model
        self.yearOfRelease = yearOfRelease
        self.engine = .off
        self.windows = .open
    }
}
class sportCar: SportCar {
    let maxSpeed: Int
    var currentSpeed: Int
    var model: String
    var yearOfRelease: Int
    var windows: windows
    var engine: engine
    
    init(model: String, yearOfRelease: Int, maxSpeed: Int) {
        self.maxSpeed = maxSpeed
        self.currentSpeed = 0
        self.model = model
        self.yearOfRelease = yearOfRelease
        self.windows = .close
        self.engine = .running
    }
}
//4// Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension trunkCar: CustomStringConvertible {
    var description: String {
        return "Automobile: \(model)\n" +
            "yearOfRelease: \(yearOfRelease)\n" +
            "engine status: \(engine)\n" +
            "windows status: \(windows)\n" +
            "body volume: \(bodyVolume)\n" +
            "cargo volume: \(cargoVolume)\n"
    }
}
extension sportCar: CustomStringConvertible {
    var description: String {
        return "Automobile: \(model)\n" +
            "yearOfRelease: \(yearOfRelease)\n" +
            "engine status: \(engine)\n" +
            "windows status: \(windows)\n" +
            "max speed: \(maxSpeed)\n" +
            "current speed: \(currentSpeed)\n"
    }
}
//5// Создать несколько объектов каждого класса. Применить к ним различные действия.
print("\nTask #5.")
print("Creating multiple class objects...")
var sportCar1 = sportCar(model: "Cadillac DTS", yearOfRelease: 2006, maxSpeed: 300)
var sportCar2 = sportCar(model: "Lotus Excel", yearOfRelease: 1984, maxSpeed: 200)
var trunkCar1 = trunkCar(model: "Hyundai Mighty", yearOfRelease: 2017, bodyVolume: 1000)
var trunkCar2 = trunkCar(model: "ISUZU ELF", yearOfRelease: 2016, bodyVolume: 2000)
print("\nObject control...")
sportCar1.Engine(status: .off)
sportCar1.Windows(status: .close)
sportCar2.IncreaseSpeed(speed: 33)
sportCar1.IncreaseSpeed(speed: 333)
sportCar2.ReduceSpeed(speed: 11)
    
trunkCar1.PutCargoToBody(volume: 4444)
trunkCar1.PutCargoToBody(volume: 4)
trunkCar2.Engine(status: .running)
trunkCar2.Windows(status: .close)
    
    //6// Вывести сами объекты в консоль.
print("\nTask #6.")
print("Print descriptions...")
print(sportCar1)
print(sportCar2)
print(trunkCar1)
print(trunkCar2)
print("All tasks completed.")

