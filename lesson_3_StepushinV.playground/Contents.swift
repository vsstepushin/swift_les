import UIKit

enum CarBrand {
    case Nissan, Porsche, Audi, Hyundai, Ford, VolksWagen, Honda, BMW, Mercedes_Benz, Toyota, Kamaz, Lada, Man, Daf, Scania, Iveco, Volvo, Renault, Tatra, Mitsubishi
}
enum CarType {
    case SportCar, TrunkCar
}

enum StatusEngine: String {
    case launched = "Двигатель запущен"
    case drowned_out = "Двигатель заглушен"
    case broken = "Двигатель сломан"
}

enum StatusWindows: String {
    case open = "Окно открыто"
    case closed = "Окно закрыто"
}

struct Car {
    let car_brand: CarBrand
    let car_type: CarType
    var year_of_manufacture: Int
    let trunk_volume: Double
    var status_engine: StatusEngine {
        willSet {
                if newValue == .launched {
                    print("Двигатель \(self.car_brand) : \(self.car_type) запущен")
                } else if newValue == .drowned_out{
                    print("Двигатель \(self.car_brand) : \(self.car_type) заглушен")
                } else {
                    print("Двигатель \(self.car_brand) : \(self.car_type) сломан")
                }
            }
    }
    mutating func LaunchedEngine() {
        self.status_engine = .launched
    }
    mutating func DrownedOutEngine() {
        self.status_engine = .drowned_out
    }
    mutating func BrokenEngine() {
        self.status_engine = .broken
    }
    var status_windows: StatusWindows {
        willSet {
            if newValue == .open {
                    print("Окно \(self.car_brand) : \(self.car_type) открыто")
                } else {
                    print("Окно \(self.car_brand) : \(self.car_type) закрыто")
                }
            }
    }
    mutating func OpenWindows() {
        self.status_windows = .open
    }
    mutating func ClosedWindows() {
        self.status_windows = .closed
    }
    var boot_volume_filled: Double
    
    mutating func AddCargo(addCargo: Double) {
        if trunk_volume >= (boot_volume_filled + addCargo){ boot_volume_filled = boot_volume_filled + addCargo
            print("Автомобиль \(self.car_brand) : \(self.car_type) был загружен на \(addCargo) кг и общий вес загруженности составляет \(boot_volume_filled) кг")
        } else {
            var overload = boot_volume_filled + addCargo - trunk_volume
            print("Автомобиль \(self.car_brand) : \(self.car_type) перегружен! Уберите \(overload) лишних кг")
        }
    }
    mutating func RemoveCargo(remCargo: Double) {
        if (boot_volume_filled - remCargo) < 0 {
            var unload = remCargo - boot_volume_filled
            print("Автомобиль \(self.car_brand) : \(self.car_type) невозможно разгрузить более чем на \(unload) кг")
        } else {
        boot_volume_filled = boot_volume_filled - remCargo
        print("Автомобиль \(self.car_brand) : \(self.car_type) был разгружен на \(remCargo) кг и общий вес загруженности составляет \(boot_volume_filled) кг")
        }
    }
    
    func CarInfo() {
        print("Марка автомобиля: \(self.car_brand) | Тип автомобиля: \(self.car_type) | Год выпуска: \(self.year_of_manufacture) | грузоподъёмность (кг): \(self.trunk_volume) | Статус двигателя: \(self.status_engine.rawValue) | Положение окон: \(self.status_windows.rawValue) | Загруженность (кг): \(self.boot_volume_filled)")
    }
    
    init(car_brand: CarBrand, car_type: CarType, year_of_manufacture: Int, trunk_volume: Double, status_engine: StatusEngine, status_windows: StatusWindows, boot_volume_filled: Double) {
         self.car_brand = car_brand
         self.car_type = car_type
         self.trunk_volume = trunk_volume
         self.year_of_manufacture = year_of_manufacture
         self.status_engine = status_engine
         self.status_windows = status_windows
         self.boot_volume_filled = boot_volume_filled
     }
    init(car_brand: CarBrand, car_type: CarType, trunk_volume: Double) {
        self.car_brand = car_brand
        self.car_type = car_type
        year_of_manufacture = 2020
        self.trunk_volume = trunk_volume
        status_engine = .drowned_out
        status_windows = .closed
        boot_volume_filled = 0
    }
    init(car_brand: CarBrand, car_type: CarType,year_of_manufacture: Int, trunk_volume: Double) {
        self.car_brand = car_brand
        self.car_type = car_type
        self.trunk_volume = trunk_volume
        self.year_of_manufacture = year_of_manufacture
        status_engine = .drowned_out
        status_windows = .closed
        boot_volume_filled = 0
    }
    init(car_brand: CarBrand, car_type: CarType,year_of_manufacture: Int, trunk_volume: Double, status_engine: StatusEngine) {
        self.car_brand = car_brand
        self.car_type = car_type
        self.trunk_volume = trunk_volume
        self.year_of_manufacture = year_of_manufacture
        self.status_engine = status_engine
        status_windows = .closed
        boot_volume_filled = 0
    }
    init(car_brand: CarBrand, car_type: CarType,year_of_manufacture: Int, trunk_volume: Double, status_engine: StatusEngine, status_windows: StatusWindows) {
        self.car_brand = car_brand
        self.car_type = car_type
        self.trunk_volume = trunk_volume
        self.year_of_manufacture = year_of_manufacture
        self.status_engine = status_engine
        self.status_windows = status_windows
        boot_volume_filled = 0
    }
}

var car1 = Car(car_brand: .Audi, car_type: .SportCar, trunk_volume: 590)
var car2 = Car(car_brand: .Iveco, car_type: .TrunkCar, year_of_manufacture: 2001, trunk_volume: 45000)
var car3 = Car(car_brand: .BMW, car_type: .SportCar, year_of_manufacture: 2019, trunk_volume: 580, status_engine: .drowned_out)
var car4 = Car(car_brand: .Ford, car_type: .SportCar, year_of_manufacture: 2017, trunk_volume: 790, status_engine: .launched, status_windows: .closed)
var car5 = Car(car_brand: .BMW, car_type: .SportCar, year_of_manufacture: 2018, trunk_volume: 860, status_engine: .broken, status_windows: .closed, boot_volume_filled: 110)
var car6 = Car(car_brand: .Mercedes_Benz, car_type: .SportCar, year_of_manufacture: 2020, trunk_volume: 910, status_engine: .launched, status_windows: .closed, boot_volume_filled: 150)
var car7 = Car(car_brand: .Audi, car_type: .SportCar, trunk_volume: 480)
car7.CarInfo()
var car8 = Car(car_brand: .Daf, car_type: .TrunkCar, year_of_manufacture: 2000, trunk_volume: 45000, status_engine: .drowned_out, status_windows: .closed, boot_volume_filled: 35000)
car7.CarInfo()
print(car6.status_windows.rawValue)
car6.OpenWindows()
car6.DrownedOutEngine()
car6.AddCargo(addCargo: 100)
car6.CarInfo()
car6.RemoveCargo(remCargo: 500)
car6.CarInfo()
car2.CarInfo()

