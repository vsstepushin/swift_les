import UIKit

//1.
// x2 − 8x + 12 = 0;
//ax2 − bx + c = 0
let a = 1.0
let b = -8.0
let c = 12.0
let d =  pow(b, 2) - (4 * a * c)
if d > 0 {
    let x1 = (-b  + sqrt(d))/(2*a)
    let x2 = (-b  - sqrt(d))/(2*a)
    print("D > 0 и имеет два корня ", x1, "и", x2)
} else if d == 1 {
    let x1 = (-b  + sqrt(d))/(2*a)
    print("D = 0 и имеет корень ", x1)
} else {
    print("D < 0 и не имеет корней")
}

//2.
//s=ab\2
//p=a+b+c
//c^2=b^2+b^2
let legA = Float.random(in: 1.0...100.0)
let legB = Float.random(in: 0..<100)
let areaS: Float = (legA * legB)/2
print("Площадь треугольника с катетами: ", legA," и ", legB, "равна:", areaS)
let hypC: Float = sqrt(pow(legA, 2) + pow(legB, 2))
print("Гипотенуза треугольника с катетами: ", legA," и ", legB, "равна:", hypC)
let perP: Float = legA+legB+hypC
print("Периметр треугольника с катетами: ", legA," и ", legB, "и гипотенузой", hypC, " равен", perP)


//3.
var sumDeposit: Float = 5000
var percDeposit: Float = 8
        
for i in 1...5 {
    var addPercDeposit = sumDeposit / 100 * percDeposit
    var dimDeposit = sumDeposit + (sumDeposit / 100 * percDeposit);
    sumDeposit = dimDeposit;
    print(i, " год. | Размер вклада: ", dimDeposit," | Начисленный процент: ", addPercDeposit)
}
        

