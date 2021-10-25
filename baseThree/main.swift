
//

import Foundation

//print("Hello, World!")
//



//1 Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar
//2 Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника
//3 Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема
//4 Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия
//5 Инициализировать несколько экземпляров структур. Применить к ним различные действия
//6 Вывести значения свойств экземпляров в консоль.


enum EngineWork {
    case start, stop
}

enum WindowsOpen {
    case open, close
}

enum TrunkCar {
    case full, empty
}

struct Car {
    let brandAuto : String
    var color : String
    mutating func changeColor(color:String) {
        switch color {
        case "Белый":
            self.color = "Белый"
        case "Черный":
            self.color = "Черный"
        case "Серый":
            self.color = "Серый"
        case "Красный":
            self.color = "Красный"
        default:
            print("Ошибка цвета")
        }
    }
    let yearOfManufacture : Int
    var trunkVolume : Double {
        willSet {
            if (trunkCar == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brandAuto) в багажнике свободно: \(space)")
            } else { print("Ошибка с цветом или у \(brandAuto) багажник переполнен.")}
        }
    }
    var engineWork : EngineWork {
        willSet {
            if newValue == .start {
                print ("\(brandAuto) двигатель работает")
            } else {print("\(brandAuto) двигатель выключен")}
        }
    }
    var WindowsOpen : WindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandAuto) открыто окно")
            } else { print("\(brandAuto) окна закрыты") }
        }
    }
    var trunkCar : TrunkCar
    mutating func emptyTrunck() {
        self.trunkCar = .empty
        print ("\(brandAuto) багажник пуст")
    }
}

struct truck {
    let brandTruck : String
    var color : String
    mutating func changeColor(color:String) {
        switch color {
        case "Белый":
            self.color = "Белый"
        case "Черный":
            self.color = "Черный"
        case "Серый":
            self.color = "Серый"
        case "Красный":
            self.color = "Красный"
        default:
            print("Ошибка цвета")
        }
    }
    let yearOfManufacture : Int
    var truckVolume : Double {
        willSet {
            if (trunkCar == .empty) && (truckVolume > 0) && (truckVolume != 0) && (newValue < truckVolume) {
                let space = truckVolume - newValue
                print ("\(brandTruck) в багажнике свободно: \(space)")
            } else { print("Ошибка с цветом или у \(brandTruck) багажник переполнен.")}
        }
    }
    var engineWork : EngineWork {
        willSet {
            if newValue == .start {
                print ("\(brandTruck) работает двигатель")
            } else {print("\(brandTruck) двигатель выключен")}
        }
    }
    var windowsOpen : WindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandTruck) открыто окно")
            } else { print("\(brandTruck) окна закрыты") }
        }
    }
    var trunkCar : TrunkCar
    mutating func emptyTrunck() {
        self.trunkCar = .empty
        print ("\(brandTruck) багажник пуст")
    }
}

var car1 = Car(brandAuto: "BMW M5",  color: "Синий", yearOfManufacture: 2020, trunkVolume: 480.0 , engineWork: .stop, WindowsOpen: .open, trunkCar: .empty)
var car2 = Car(brandAuto: "Audi RS6",  color: "Серый", yearOfManufacture: 2018, trunkVolume: 580.0, engineWork: .stop, WindowsOpen: .close, trunkCar: .full)

var truck1 = truck (brandTruck: "Volkswagen Trasporter",  color: "Черный", yearOfManufacture: 2020, truckVolume: 100000.0, engineWork: .start, windowsOpen: .open, trunkCar: .full)
var truck2 = truck (brandTruck: "Ford Transit",  color: "Белый", yearOfManufacture: 2017, truckVolume: 150000.0, engineWork: .start, windowsOpen: .close, trunkCar: .empty)


car1.engineWork = .start
car1.trunkVolume = 340.0
car1.changeColor(color: "Серый")
car2.trunkVolume = 770.0
car2.emptyTrunck()
car2.trunkVolume = 90.9
car2.WindowsOpen = .open
car2.changeColor(color: "Черный")

truck1.engineWork = .stop
truck1.windowsOpen = .close
truck2.windowsOpen = .open
truck2.engineWork = .stop
truck2.truckVolume = 98635
truck2.changeColor(color: "Белый")
