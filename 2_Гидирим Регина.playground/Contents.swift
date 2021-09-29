import UIKit

//1// Написать функцию, которая определяет, четное число или нет.
var numberArray = [34, 53, 87, 77, 22, 49, 68, 93, 7]
for sorting in numberArray{
    if sorting % 2 == 0 {
        print("\(sorting) четное число")
    } else {
        print("\(sorting) нечетное число")
    }
}
//2// Написать функцию, которая определяет, делится ли число без остатка на 3.
func divisionByThree (_ number: Int) -> () {
    var n: Int = number
    n = n % 3
    if (n == 0) {
        print("Число делится на 3 без остатка")
    } else {
        print("Число не делится на 3 без остатка")
    }
}

divisionByThree(98)

//3// Создать возрастающий массив из 100 чисел.
var array = [Int](1...100)
print("Возрастающий массив: \(array)")
 
//4// Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var delete = array.filter {$0 % 2 != 0 && $0 % 3 == 0}
print("Измененный вид возрастающего массива: \(delete)")

//5// Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
func fibonachiArray(_ n: Int) -> [Double] {
    var fibonachi: [Double] = [1, 1]
    (2...n).forEach{ g in
        fibonachi.append(fibonachi[g - 1] + fibonachi[g - 2])
    }
    return fibonachi
}
print("Числа фибоначчи: \(fibonachiArray(50))")

//6// Заполнить массив из 100 элементов различными простыми числами.
var firstArray = [Int](2...600)

for divider in firstArray {
    for element in firstArray {
        if element % divider == 0 && element != divider {
            firstArray.remove(at: firstArray.firstIndex(of: element)!)
        }
    }
    
    if firstArray.count > 100 {
        firstArray.removeLast()
    }
}
print("Простые числа: \(firstArray)")
