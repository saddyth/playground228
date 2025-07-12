//
//  main.swift
//  playground228
//
//  Created by pulino4ka on 11.7.2025.
//

import Foundation

//Task 1.1
//Простая распаковка
//Создайте опциональную переменную optionalNumber: Int? и присвойте ей значение 5.
//Используя if let, выведите значение, если оно существует.

let optionalNumber: Int? = 5

if let usualNumber = optionalNumber {
    print(usualNumber + 5)
} else {
    print("Nil")
}


//Task 1.2.
//Присваивание по умолчанию
//Создайте опциональную переменную optionalName: String? и присвойте ей nil.
//Используя оператор объединения с nil (??), выведите "Anonymous", если значение отсутствует.

let optionalName: String? = nil

print(optionalName ?? "Anonymous")


//Task 1.3
//Проверка существования
//Создайте опциональную переменную optionalBool: Bool? и присвойте ей значение true.
//Проверьте, существует ли значение, и выведите его.

let optionalBool: Bool? = true

if let usualBool = optionalBool {
    print(usualBool)
} else {
    print("Не существует")
}


//Task 1.4
//Сложение опционалов
//Создайте две опциональные переменные a: Int? и b: Int?. Присвойте им значения 3 и nil.
//Если оба значения существуют, сложите их и выведите

let a: Int? = 3
let b: Int? = 5

if let b,
   let a {
    print(a + b)
} else {
    print("nil")
}


//Task 1.5
//Безопасная распаковка массива
//Создайте массив [Int?] с элементами [1, nil, 3].
//Используя if let, проверьте каждый элемент и выведите только не-nil значения.

var array: [Int?] = [1, nil, 3]

for value in array {
    if let value {
        print(value)
    }
}


//Task 2.1
//Цепочка опционалов
//Создайте структуру Person с опциональным свойством address: String?.
//Создайте экземпляр Person и используйте цепочку (?.) для безопасного доступа к адресу.

struct Person {
    var address: String?
}

let person1 = Person(address: "Nevskiy")
if let address = person1.address?.uppercased() {
    print(address)
} else {
    print("Адрес не указан")
}

//Task 2.2
//Распаковка нескольких опционалов
//Создайте три опциональные переменные x: Int?, y: Int? и z: Int?.
//Если все три значения существуют, вычислите их сумму.

let x: Int? = 5
let y: Int? = 10
let z: Int? = nil

if let x,
   let y,
   let z {
    print(x + y + z)
} else {
    print("Nil")
}

//Task 2.3
//Обработка ошибок с опционалами
//Создайте функцию, которая принимает строку и возвращает число (Int?), если строка содержит цифры.
//Используйте if let для обработки результата.

let text = ""
func countNumber(str: String) -> Int? {
    var count = 0
    for char in str {
        if char.isNumber {
            count += 1
        }
    }
    if count > 0 {
        return count
    } else {
        return nil
    }
   
}

if let count = countNumber(str: text) {
    print(count)
} else {
    print("Строка не содержит цифр")
}


//Task 2.4
//Фильтрация массива опционалов
//Создайте массив [Int?] с элементами [1, nil, 3, nil, 5].
//Используя метод .compactMap, удалите все nil значения из массива.

var optionalArr: [Int?] = [1, nil, 3, nil, 5]
var notOptionalArr = optionalArr.compactMap {$0}
print(notOptionalArr)

//Task 2.5
//Опциональные аргументы функции
//Создайте функцию, которая принимает опциональный параметр name: String? и выводит приветствие, если имя существует.

func greeting(name: String?) {
    if let name {
        print("Hello \(name)")
    } else {
        print("Введено неверное имя")
    }
}

greeting(name: nil)


//Task 3.1
//Создайте вложенное опциональное значение nestedOptional: Int?? и присвойте ему значение 5??.
//Распакуйте его и выведите результат.


var nestedOptional: Int?? = 5

print(nestedOptional!)
print(nestedOptional!!)


//Task 3.2
//Генерация случайных опционалов
//Создайте функцию, которая генерирует случайное число от 1 до 10 и возвращает его как опционал (Int?).
//В 50% случаев функция должна возвращать nil.
func randNum() -> Int? {
    if Bool.random() {
        return nil
    } else {
        return Int.random(in: 1...10)
    }
}


if let randResult = randNum() {
    print(randResult)
} else {
    print("nil")
}


//Task 3.3
//Обработка JSON данных
//Создайте словарь json: [String: Any]? с данными о пользователе (имя, возраст).
//Используя опциональные конструкции, безопасно достаньте и выведите данные.

let json: [String: Any]? = ["name": "Polina", "age": 52]

if let json {
    if let name = json["name"] as? String,
       let age = json["age"] as? Int
    {
        print(name, age)
    }
   
} else {
    print("nil")
}

//Task 3.4
//Цепочка вызовов
//Создайте класс User с опциональным свойством email: String?.
//Создайте экземпляр User и используйте цепочку (?.) для безопасного доступа к email.

class User {
    var username: String
    var email: String?
    init(username: String, email: String?) {
        self.username = username
        self.email = email
    }
    
}

var user1 = User(username: "aaa", email: nil)

if let email = user1.email?.uppercased() {
    print(email)
} else {
    print("nil")
}

//Task 3.5
//Обработка коллекций опционалов
//Создайте массив опциональных строк [String?] и используйте .compactMap для преобразования их в массив чисел ([Int]), если строки содержат цифры.

let stringArray: [String?] = ["1", "fbn", "544fmm", "33", nil]

func arrTransform(optionalArr: [String?]) -> [Int] {
    
    var newArr = optionalArr.compactMap {$0}
    
    
    let numberArr = newArr.map {str  -> String in
        let digits = str.filter { $0.isNumber}
        return digits
    }
    
    return numberArr.compactMap{Int($0)}

}

print(arrTransform(optionalArr: stringArray))


//Task 4.1
//Задание 1: Сумма только существующих значений
//Создайте массив [Int?] из 10 случайных чисел от 1 до 100, часть которых — nil (примерно половина).
//Отфильтруйте значения и получите массив [Int].
//Вычислите сумму и выведите результат в формате:Сумма: X, элементов: N

var optionalIntArr: [Int?] = []

for i in 1...10 {
    if Bool.random() {
        optionalIntArr.append(Int.random(in: 1...100))
    } else {
        optionalIntArr.append(nil)
    }
}

let newIntArr = optionalIntArr.compactMap {$0}.compactMap {Int($0)}

let sum = newIntArr.reduce(0,+)
print("Сумма: \(sum), элементов: \(newIntArr.count)")

//Task 4.2
//Задание 2: Безопасное обращение к базе данных
//Создайте словарь [String: String?], где ключ — ID пользователя, значение — его email (может быть nil).
//Напишите функцию getEmail(for userID: String) -> String, которая:
//Безопасно извлекает email по ключу;
//Если email есть — возвращает его;
//Если email равен nil — возвращает "Email не указан";
//Если пользователя нет в словаре — возвращает "Пользователь не найден".
//Проверьте функцию на разных кейсах.


let emailDict: [String: String?] = ["123" : "abcd@mail.ru"]

func getEmail(for userID: String) -> String {
    if let email = emailDict[userID]  {
        return email ?? "Email не указан"
    } else {
        return "Пользователь не найден"
    }
}

print(getEmail(for: "123"))
print(getEmail(for: "126"))

//Task 4.3
//Задание 3: Обработка опциональных параметров функции
//Напишите функцию greet(user name: String?, age: Int?), которая:
//Если указано имя и возраст — выводит: Привет, <name>, тебе <age> лет.
//Если только имя — Привет, <name>!
//Если только возраст — Возраст указан: <age>
//Если ничего не указано — Нет данных для приветствия
//Вызовите функцию с разными комбинациями параметров (все nil, только имя, только возраст и т.д.)

func greet(user name: String?, age: Int?) {
    if let name,
       let age {
        print("Привет, \(name), тебе \(age) лет")
    } 
    else if let name {
        print("Привет, \(name)")
    }
    else if let age {
        print("Возраст указан: \(age)")
        }
    else {
        print("Нет данных для приветствия")
    }
}

greet(user: "Polina", age: 25)
greet(user: nil, age: 25)
greet(user: "Polina", age: nil)
greet(user: nil, age: nil)


//Task 4.4
//Задание 4: Работа с массивом опциональных словарей
//Создайте массив опциональных словарей, где каждый словарь представляет информацию о пользователе
//Извлеките из этого массива только те элементы, где и имя, и возраст существуют и имеют значения.
// Выведите массив пользователей, в котором содержатся только те элементы, где имя и возраст корректно извлечены.

var optionalArrOfDict: [[String?: Any?]?] = [
       ["name": "Polina", "age": 25],
       ["name": "Ivan", "age": 30],
       nil,
       ["name": nil],
       ["age": 22]
]

var usersArray: [[String: Any]] = []
for user in optionalArrOfDict {
    if let user {
       if let name = user["name"] as? String ,
          let age = user["age"] as? Int {
           usersArray.append([name: age])
       }
    }
}

print(usersArray)
