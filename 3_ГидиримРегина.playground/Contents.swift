import UIKit

var greeting = "Hello, playground"

//1// Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

//2// Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3// Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//4// Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

//5// Инициализировать несколько экземпляров структур. Применить к ним различные действия.

//6// Вывести значения свойств экземпляров в консоль.

enum Engine: String {
    case on = "заведен"
    case off = "заглушен"
}

enum actionEngine {
    case start
    case turnOff
}

enum Windows: String {
    case open = "открыты"
    case close = "закрыты"
}

enum Kuzov {
    case pustKuz(empty: String)
    case fullKuz(full: String)
    case chastKuz(kg: Double)
}

struct SportCar {
    var brand: String
    var yearOfRelease: Int
    var obemKuz: Kuzov
    var engine: Engine
    var windows: Windows
    var obemFullKuz: Double
    
    mutating func acEng(action: Engine) {
        switch action {
        case .off:
            print(action.rawValue)
            self.engine = .off
        case .on:
            print(action.rawValue)
            self.engine = .on
        }
   
    }
    
    func description(){
        print("Автомобиль \(brand), \(yearOfRelease) года выпуска. Сейчас двигатель \(engine.rawValue). Кузов \(obemKuz).")
    }
}

struct TrunkCar {
    var brand: String
    var yearOfRelease: Int
    var obemKuz: Kuzov
    var engine: Engine
    var windows: Windows
    var obemFullKuz: Double
    
    mutating func actionEng(action: actionEngine){
        switch action {
        case .start:
            self.engine = .off
        case .turnOff:
            self.engine = .on
        }
    }
    func printEngine() {
        print(engine.rawValue)
    }
    func description(){
        print("Автомобиль \(brand), \(yearOfRelease) года выпуска. Сейчас двигатель \(engine.rawValue). Кузов \(obemKuz).")
    }
}

var sportCar1 = SportCar(brand: "Toyota", yearOfRelease: 1966, obemKuz: .fullKuz(full: "Кузов полный"), engine: .on, windows: .close, obemFullKuz: 39.2)
var sportCar2 = SportCar(brand: "Lexus", yearOfRelease: 2015, obemKuz: .chastKuz(kg: 162.0), engine: .off, windows: .open, obemFullKuz: 44.8)

var trunkCar1 = TrunkCar(brand: "Volvo", yearOfRelease: 2011, obemKuz: .fullKuz(full: "Кузов полный"), engine: .on, windows: .open, obemFullKuz: 650)
var trunkCar2 = TrunkCar(brand: "Nissan", yearOfRelease: 2000, obemKuz: .pustKuz(empty: "Кузов пустой"), engine: .off, windows: .close, obemFullKuz: 600)

sportCar1.brand
sportCar1.obemKuz
sportCar1.yearOfRelease
sportCar2.acEng(action: .off)
sportCar2.acEng(action: .off)
sportCar2.acEng(action: .off)
sportCar2.acEng(action: .on)

sportCar2.description()

trunkCar2.brand
trunkCar2.obemKuz
print(trunkCar1.obemFullKuz)
trunkCar2.windows
trunkCar2.printEngine()

trunkCar1.description()
trunkCar2.description()
