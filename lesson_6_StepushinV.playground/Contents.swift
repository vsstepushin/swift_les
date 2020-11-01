import UIKit



protocol Weight {
    var weight: Double { get set }
}
class Car: Weight {
    var weight: Double
    var baggageWeight: Double
    var passengersWeight: Double
    
    func calculateTotalWeight() -> Double {
        return weight + baggageWeight + passengersWeight
    }
    init(weight: Double, baggageWeight: Double, passengersWeight: Double) {
        self.weight = weight
        self.baggageWeight = baggageWeight
        self.passengersWeight = passengersWeight
    }
}
class CargoCar: Weight {
    var weight: Double
    var cargoWeight: Double
    
    func calculateTotalWeight() -> Double {
        return weight + cargoWeight
    }
    init(weight: Double, cargoWeight: Double) {
        self.weight = weight
        self.cargoWeight = cargoWeight
    }
}
struct Stack<T: Weight> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    var wholeWeght : Double {
        var totalWeght = 0.0
        for element in elements {
            totalWeght += element.weight
        }
        return totalWeght
    }
//    var resultWeight = 0.0
    
    subscript(indexes: UInt ...) -> Double? {
        var weight = 0.0
        var resultWeight: Double? = 0.0
        for index in indexes { if index < self.elements.count {
                weight += self.elements[Int(index)].weight
        } else {
            resultWeight = nil
        }
            }
        if resultWeight != nil {
        return weight
        } else {
            return resultWeight
        }
    }
}
var stackCar = Stack<Car>()
var stackCargoCar = Stack<CargoCar>()
stackCar.push(Car(weight: 1201, baggageWeight: 236, passengersWeight: 136))
stackCar.push(Car(weight: 1202, baggageWeight: 237, passengersWeight: 137))
stackCar.push(Car(weight: 1203, baggageWeight: 238, passengersWeight: 138))
stackCar.push(Car(weight: 1204, baggageWeight: 239, passengersWeight: 139))
stackCargoCar.push(CargoCar(weight: 4501, cargoWeight: 8001))
stackCargoCar.push(CargoCar(weight: 4501, cargoWeight: 8001))
stackCargoCar.push(CargoCar(weight: 4502, cargoWeight: 8002))
stackCargoCar.push(CargoCar(weight: 4503, cargoWeight: 8003))
stackCar.pop()
stackCargoCar.pop()
stackCar[0,6]
stackCargoCar[0,2]
stackCar.wholeWeght
stackCargoCar.wholeWeght

