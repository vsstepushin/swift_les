import UIKit

protocol Car: AnyObject {
    var statusEngine: Bool { get set }
    var statusWindows: Bool { get set }
    var handbrakeStatus: Bool { get set }
    var hoodStatus: Bool { get set }
    var doorStatus: Bool { get set }
    var doorBlockStatus: Bool { get set }
}

extension Car  {
    func handleEngine() {
        statusEngine = (statusEngine ? false : true)
    }
    func handleWindows() {
        statusWindows = (statusWindows ? false : true)
    }
    func handleHandbrake() {
        handbrakeStatus = (handbrakeStatus ? false : true)
    }
    func handleHood() {
        hoodStatus = (hoodStatus ? false : true)
    }
    func handleDoor() {
        doorStatus = (doorStatus ? false : true)
    }
    func handleBlockDoor() {
        doorBlockStatus = (doorBlockStatus ? false : true)
    }
}
protocol ConsolePrintable: CustomStringConvertible{
    func printDescription()
}
extension ConsolePrintable{
    func printDescription() {
        print(description)
    }
}
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
class Properties_Car {
    let nominalVehicle: Int
    let numberOfDoors: NumberOfDoors
    let numberOfSeats: Int
    let driveUnit: DriveUnit
    let transmissionType: TransmissionType
    var mileage: Int
    let colors: UIColor
    let yearOfIssue: Int
    let steeringWheel: SteeringWheelLocation
    let enginePower: Int
    let volumeOfTheTank: Int
    var typeEngine: TypeEngine

    init(nominalVehicle: Int, numberOfDoors: NumberOfDoors, numbersOfSeats: Int, driveUnit: DriveUnit, transmissionType: TransmissionType, mileage: Int, colors: UIColor, yarOfIssue: Int, steeringWheel: SteeringWheelLocation, enginePower: Int, volumeOfTheTank: Int, typeEngine: TypeEngine)  {
        self.nominalVehicle = nominalVehicle
        self.numberOfDoors = numberOfDoors
        self.numberOfSeats = numbersOfSeats
        self.driveUnit = driveUnit
        self.transmissionType = transmissionType
        self.mileage = mileage
        self.colors = colors
        self.yearOfIssue = yarOfIssue
        self.steeringWheel = steeringWheel
        self.enginePower = enginePower
        self.volumeOfTheTank = volumeOfTheTank
        self.typeEngine = typeEngine
        
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
    case tiltSemiTrailer, jumbo, autoCoupler, refrigeratedVan, isothermalVan, openPlatform, tankTruck
}


enum Cargo {
    case AddCargo(amount: Int)
    case RemoveCargo(amount: Int)
}
class PassengerCar: Properties_Car, Car, ConsolePrintable {
    
    var description: String{
        return String(describing:"""
Статус элементов автомобиля:
Статус двигателя(запущен/заглушен):\(statusEngine) | Статус окон(открыты/закрыты):\(statusWindows) |
Статус ручника(включен/выключен):\(handbrakeStatus) | Статус капота(открыт/закрыт):\(hoodStatus) |
Статус дверей(открыты/закрыты):\(doorStatus) | Статус блокировки дверей(разблокированы/заблокированы):\(doorBlockStatus) |
---------------------------------------------------------------------------------------------------------------------------
""")
}
    
    var statusEngine: Bool = false
    
    var statusWindows: Bool = false
    
    var handbrakeStatus: Bool = true
    
    var hoodStatus: Bool = false
    
    var doorStatus: Bool = true
    
    var doorBlockStatus: Bool = false
    
    let makeCar: MakePassenger
    let trunkVolume: Int
    let bodyType: BodyTypePassenger
    var actionsWithTheTrunk: Int
    
    init(makeCar: MakePassenger, trunkVolume: Int, bodyType: BodyTypePassenger, actionsWithTheTrunk: Int, nominalVehicle: Int, numberOfDoors: NumberOfDoors, numbersOfSeats: Int, driveUnit: DriveUnit, transmissionType: TransmissionType, mileage: Int, colors: UIColor, yarOfIssue: Int, steeringWheel: SteeringWheelLocation, enginePower: Int, volumeOfTheTank: Int, typeEngine: TypeEngine) {
        self.makeCar = makeCar
        self.trunkVolume = trunkVolume
        self.bodyType = bodyType
        self.actionsWithTheTrunk = actionsWithTheTrunk
        
        super.init (nominalVehicle: nominalVehicle, numberOfDoors: numberOfDoors, numbersOfSeats: numbersOfSeats, driveUnit: driveUnit, transmissionType: transmissionType, mileage: mileage, colors: colors, yarOfIssue: yarOfIssue, steeringWheel: steeringWheel, enginePower: enginePower, volumeOfTheTank: volumeOfTheTank, typeEngine: typeEngine)
    }
    func handleCargo(cargo action: Cargo) {
        switch action {
        case .AddCargo(amount: let amount):
            if self.trunkVolume > (self.actionsWithTheTrunk + amount){
                self.actionsWithTheTrunk += amount
                print("Автомобиль \(self.makeCar)  был загружен на \(amount) литров и общий объём загруженности составляет \(self.actionsWithTheTrunk) литров")
            } else {
                var overload = self.actionsWithTheTrunk + amount - trunkVolume
                print("Автомобиль \(self.makeCar) перегружен! Уберите \(overload) лишних литров ")
            }
        case .RemoveCargo(amount: let amount):
            if (self.trunkVolume - amount) < 0 {
                var unload = amount - self.trunkVolume
                print("Автомобиль \(self.makeCar) невозможно разгрузить более чем на \(unload) литров")
                } else {
                    self.actionsWithTheTrunk -= amount
                    print("Автомобиль \(self.makeCar) был разгружен на \(amount) литров и общий объём загруженности составляет \(self.actionsWithTheTrunk) литров")
                }
            }
        }
    //, statusEngine: Bool, statusWindows: Bool, handbrakeStatus: Bool, hoodStatus: Bool, doorStatus: Bool
    //, statusEngine: statusEngine, statusWindows: statusWindows, handbrakeStatus: handbrakeStatus, hoodStatus: hoodStatus, doorStatus: doorStatus
}
class FreightCar: Properties_Car, Car, ConsolePrintable {
    
    var description: String{
        return String(describing:"""
Статус элементов автомобиля:
Статус двигателя(запущен/заглушен):\(statusEngine) | Статус окон(открыты/закрыты):\(statusWindows) |
Статус ручника(включен/выключен):\(handbrakeStatus) | Статус капота(открыт/закрыт):\(hoodStatus) |
Статус дверей(открыты/закрыты):\(doorStatus) | Статус блокировки дверей(разблокированы/заблокированы):\(doorBlockStatus) |
---------------------------------------------------------------------------------------------------------------------------
""")
}
    
    var statusEngine: Bool = false
    
    var statusWindows: Bool = false
    
    var handbrakeStatus: Bool = true
    
    var hoodStatus: Bool = false
    
    var doorStatus: Bool = false
    
    var doorBlockStatus: Bool = false
    
    let makeCar: MakeFreight
    let carryingCapacity: Int
    let bodyType: BodyTypeFreight
    var bodyAction: Int
    
    
    init(makeCar: MakeFreight, carryingCapacity: Int, bodyType: BodyTypeFreight, bodyAction: Int, nominalVehicle: Int, numberOfDoors: NumberOfDoors, numbersOfSeats: Int, driveUnit: DriveUnit, transmissionType: TransmissionType, mileage: Int, colors: UIColor, yarOfIssue: Int, steeringWheel: SteeringWheelLocation, enginePower: Int, volumeOfTheTank: Int, typeEngine : TypeEngine) {
        self.makeCar = makeCar
        self.carryingCapacity = carryingCapacity
        self.bodyType = bodyType
        self.bodyAction = bodyAction
       
        super.init (nominalVehicle: nominalVehicle, numberOfDoors: numberOfDoors, numbersOfSeats: numbersOfSeats, driveUnit: driveUnit, transmissionType: transmissionType, mileage: mileage, colors: colors, yarOfIssue: yarOfIssue, steeringWheel: steeringWheel, enginePower: enginePower, volumeOfTheTank: volumeOfTheTank, typeEngine: typeEngine )
    }
    func handleCargo(cargo action: Cargo) {
        switch action {
        case .AddCargo(amount: let amount):
            if self.carryingCapacity >= (self.bodyAction + amount){
                self.bodyAction += amount
                print("Автомобиль \(self.makeCar)  был загружен на \(amount) кг и общий вес загруженности составляет \(self.bodyAction) кг")
            } else {
                var overload = self.bodyAction + amount - carryingCapacity
                print("Автомобиль \(self.makeCar) перегружен! Уберите \(overload) лишних кг ")
            }
        case .RemoveCargo(amount: let amount):
            if (self.bodyAction - amount) <= 0 {
                var unload = amount - self.bodyAction
                print("Автомобиль \(self.makeCar) невозможно разгрузить более чем на \(unload) кг")
                } else {
                    self.bodyAction -= amount
                    print("Автомобиль \(self.makeCar) был разгружен на \(amount) кг и общий вес загруженности составляет \(self.bodyAction) кг")
                }
            }
        }
}
var car1 = PassengerCar(makeCar: .BMW, trunkVolume: 350, bodyType: .Coupe, actionsWithTheTrunk: 0, nominalVehicle: 247, numberOfDoors: .three, numbersOfSeats: 4, driveUnit: .full, transmissionType: .automatic, mileage: 12789, colors: .black, yarOfIssue: 2019, steeringWheel: .left, enginePower: 247, volumeOfTheTank: 65, typeEngine: .petrol)
car1.handleHood()
car1.handleWindows()
car1.printDescription()
car1.handleHood()
car1.handleBlockDoor()
car1.printDescription()

var car2 = FreightCar(makeCar: .Man, carryingCapacity: 300000, bodyType: .jumbo, bodyAction: 0, nominalVehicle: 780, numberOfDoors: .two, numbersOfSeats: 8, driveUnit: .full, transmissionType: .MT, mileage: 1234876, colors: .darkGray, yarOfIssue: 1987, steeringWheel: .left, enginePower: 780, volumeOfTheTank: 450, typeEngine: .diesel)
car2.handleBlockDoor()
car2.printDescription()
car2.handleHandbrake()
car2.handleHood()
car2.printDescription()
