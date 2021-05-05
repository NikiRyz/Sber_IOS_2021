import UIKit

protocol Arithmetic {
    static func+ (_lhs: Self, _rhs: Self) -> Self
}

func sumTwoValues<T: Arithmetic>(_ a: T, _ b: T) -> T{
    return a + b
}
extension String: Arithmetic {}
extension Int: Arithmetic {}
extension Float: Arithmetic {}
extension Double: Arithmetic {}

let a = 25.0
let b = 34.0
let c = "ABC"
let d = "DEF"

print(sumTwoValues(a, b))
print(sumTwoValues(c, d))
