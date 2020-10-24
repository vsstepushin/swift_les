import UIKit

enum TypeEngine {
    case petrol, diesel, electric, hybrid
}
enum NumberOfDoors {
    case two, three, four, five
}
enum DriveUnit {
    case front, rear, full
}
enum TransmissionType {
    case automatic, variator, robotic, MT
}
enum Colors {
    case white, black, blue, red, green, purple, pink, yellow, orange
}
enum SteeringWheelLocation {
    case right, left
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

class Properties_Car {
    let nominal_vehicle: Int
    let number_of_doors: NumberOfDoors
    let number_of_seats: Int
    let drive_unit: DriveUnit
    let transmission_type: TransmissionType
    var mileage: Int
    let colors: Colors
    let year_of_issue: Int
    let steering_wheel: SteeringWheelLocation
    let engine_power: Int
    let volume_of_the_tank: Int
    var status_engine: StatusEngine
    var status_windows: StatusWindows
    
    

    init(nominal_vehicle: Int, number_of_doors: NumberOfDoors, numbers_of_seats: Int, drive_unit: DriveUnit, transmission_type: TransmissionType, mileage: Int, colors: Colors, yar_of_issue: Int, steering_wheel: SteeringWheelLocation, engine_power: Int, volume_of_the_tank: Int, status_engine: StatusEngine, status_windows: StatusWindows)  {
        self.nominal_vehicle = nominal_vehicle
        self.number_of_doors = number_of_doors
        self.number_of_seats = numbers_of_seats
        self.drive_unit = drive_unit
        self.transmission_type = transmission_type
        self.mileage = mileage
        self.colors = colors
        self.year_of_issue = yar_of_issue
        self.steering_wheel = steering_wheel
        self.engine_power = engine_power
        self.volume_of_the_tank = volume_of_the_tank
        self.status_engine = status_engine
        self.status_windows = status_windows
        
    }
    func handleCargo(cargo: Cargo) {
    }
    func handleEngine(engine: StatusEngine){
        switch engine {
        case .launched:
            print("Двигатель запущен")
        case .drowned_out:
            print("Двигатель заглушен")
        case .broken:
            print("Двигатель сломан")
        }
    }
    func handleWindows(windows: StatusWindows){
        switch windows {
        case .open:
            print("Окна открыты")
        case .closed:
            print("Окна закрыты")
        }
    }
}
enum MakePassenger {
    case Nissan, Porsche, Audi, Hyundai, Ford, VolksWagen, Honda, BMW, Mercedes_Benz, Toyota, Lada, Volvo, Renault, Mitsubishi
}
enum MakeFreight {
    case KamAZ, GAZ, ZIL, URAL, KRAZ, MAZ, MercedesBenz, Man, Daf, Scania, Iveco, Volvo, Renault, Nissan, Tatra, Mitsubishi
}
enum BodyTypePassenger{
    case Sedan, Hatchback, Wagon, Liftback, Coupe, Convertible, Roadster, Stretch, Targa, SUV, Crossover, Pickup, Van, Minivan
}
enum BodyTypeFreight{
    case tilt_semi_trailer, jumbo, auto_coupler, refrigerated_van, isothermal_van, open_platform, tank_truck
}


enum Cargo {
    case AddCargo(amount: Int)
    case RemoveCargo(amount: Int)
}
class passenger_car: Properties_Car {
    let make_car: MakePassenger
    let trunk_volume: Int
    let body_type: BodyTypePassenger
    var actions_with_the_trunk: Int
    
    
    
    init(make_car: MakePassenger, trunk_volume: Int, body_type: BodyTypePassenger, actions_with_the_trunk: Int, nominal_vehicle: Int, number_of_doors: NumberOfDoors, numbers_of_seats: Int, drive_unit: DriveUnit, transmission_type: TransmissionType, mileage: Int, colors: Colors, yar_of_issue: Int, steering_wheel: SteeringWheelLocation, engine_power: Int, volume_of_the_tank: Int, status_engine: StatusEngine, status_windows: StatusWindows) {
        self.make_car = make_car
        self.trunk_volume = trunk_volume
        self.body_type = body_type
        self.actions_with_the_trunk = actions_with_the_trunk
        super.init(nominal_vehicle: nominal_vehicle, number_of_doors: number_of_doors, numbers_of_seats: numbers_of_seats, drive_unit: drive_unit, transmission_type: transmission_type, mileage: mileage, colors: colors, yar_of_issue: yar_of_issue, steering_wheel: steering_wheel, engine_power: engine_power, volume_of_the_tank: volume_of_the_tank, status_engine: status_engine, status_windows: status_windows)
    }
    override func handleCargo(cargo action: Cargo) {
        switch action {
        case .AddCargo(amount: let amount):
            if self.trunk_volume > (self.actions_with_the_trunk + amount){
                self.actions_with_the_trunk += amount
                print("Автомобиль \(self.make_car)  был загружен на \(amount) литров и общий объём загруженности составляет \(self.actions_with_the_trunk) литров")
            } else {
                var overload = self.actions_with_the_trunk + amount - trunk_volume
                print("Автомобиль \(self.make_car) перегружен! Уберите \(overload) лишних литров ")
            }
        case .RemoveCargo(amount: let amount):
            if (self.trunk_volume - amount) < 0 {
                var unload = amount - self.trunk_volume
                print("Автомобиль \(self.make_car) невозможно разгрузить более чем на \(unload) литров")
                } else {
                    self.actions_with_the_trunk -= amount
                    print("Автомобиль \(self.make_car) был разгружен на \(amount) литров и общий объём загруженности составляет \(self.actions_with_the_trunk) литров")
                }
            }
        }
}
class freight_car: Properties_Car {
    let make_car: MakeFreight
    let carrying_capacity: Int
    let body_type: BodyTypeFreight
    var body_action: Int
    
    
    init(make_car: MakeFreight, carrying_capacity: Int, body_type: BodyTypeFreight, body_action: Int, nominal_vehicle: Int, number_of_doors: NumberOfDoors, numbers_of_seats: Int, drive_unit: DriveUnit, transmission_type: TransmissionType, mileage: Int, colors: Colors, yar_of_issue: Int, steering_wheel: SteeringWheelLocation, engine_power: Int, volume_of_the_tank: Int, status_engine: StatusEngine, status_windows: StatusWindows) {
        self.make_car = make_car
        self.carrying_capacity = carrying_capacity
        self.body_type = body_type
        self.body_action = body_action
        super.init(nominal_vehicle: nominal_vehicle, number_of_doors: number_of_doors, numbers_of_seats: numbers_of_seats, drive_unit: drive_unit, transmission_type: transmission_type, mileage: mileage, colors: colors, yar_of_issue: yar_of_issue, steering_wheel: steering_wheel, engine_power: engine_power, volume_of_the_tank: volume_of_the_tank, status_engine: status_engine, status_windows: status_windows)
    }
    override func handleCargo(cargo action: Cargo) {
        switch action {
        case .AddCargo(amount: let amount):
            if self.carrying_capacity >= (self.body_action + amount){
                self.body_action += amount
                print("Автомобиль \(self.make_car)  был загружен на \(amount) кг и общий вес загруженности составляет \(self.body_action) кг")
            } else {
                var overload = self.body_action + amount - carrying_capacity
                print("Автомобиль \(self.make_car) перегружен! Уберите \(overload) лишних кг ")
            }
        case .RemoveCargo(amount: let amount):
            if (self.body_action - amount) <= 0 {
                var unload = amount - self.body_action
                print("Автомобиль \(self.make_car) невозможно разгрузить более чем на \(unload) кг")
                } else {
                    self.body_action -= amount
                    print("Автомобиль \(self.make_car) был разгружен на \(amount) кг и общий вес загруженности составляет \(self.body_action) кг")
                }
            }
        }
}
var car1 = freight_car(make_car: .KamAZ, carrying_capacity: 10000, body_type: .refrigerated_van, body_action: 0, nominal_vehicle: 450, number_of_doors: .two, numbers_of_seats: 6, drive_unit: .rear, transmission_type: .MT, mileage: 134999, colors: .green, yar_of_issue: 1975, steering_wheel: .left, engine_power: 450, volume_of_the_tank: 4500, status_engine: .drowned_out, status_windows: .closed)
car1.handleCargo(cargo: .AddCargo(amount: 10000))
car1.handleEngine(engine: .launched)
car1.handleWindows(windows: .open)
