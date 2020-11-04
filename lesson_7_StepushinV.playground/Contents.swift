import UIKit


//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.


enum ErrorsEngine: String, Error {
    case workStarter = "Неисправность стартера. Обратитесь в сервисный центр"
    case workIgnition = "Неисправность зажигания. Обратитесь в сервисный центр"
    case jammedEngine = "Ваш двигатель заклинило. Обратитесь в сервисный центр"
}

enum ErrorsDefectEngine: String, Error {
    case noSpark = "Нет искры. Замените неисправные свечи"
    case noOil = "Низкий уровень масла. Добавте масло в двигателью"
    case noFuel = "Нет топлива. Заправьтесь"
    case checkEngine = "Прочии ошибки двигателя. Проведите диагностику автомобиля"
}


    func engine(_ value: Int) throws -> String {
        var answer = ""
        switch value {
        case 1:
            print((ErrorsEngine.workStarter).rawValue)
            throw ErrorsEngine.workStarter
        case 2:
            print((ErrorsEngine.workIgnition).rawValue)
            throw ErrorsEngine.workIgnition
        case 3:
            print((ErrorsEngine.jammedEngine).rawValue)
            throw ErrorsEngine.jammedEngine
        case 4:
            print((ErrorsDefectEngine.noSpark).rawValue)
            throw ErrorsDefectEngine.noSpark
        case 5:
            print((ErrorsDefectEngine.noOil).rawValue)
            throw ErrorsDefectEngine.noOil
        case 6:
            print((ErrorsDefectEngine.noFuel).rawValue)
            throw ErrorsDefectEngine.noFuel
        case 7:
            print((ErrorsDefectEngine.checkEngine).rawValue)
            throw ErrorsDefectEngine.checkEngine
        default:
            answer = "Неизвестная ошибка"
            print(answer)
        }
        return answer

    }

do {
    try engine(8)
} catch {
    
}


struct User {
    var mail: String
    var pass: String
}

enum UserError: String, Error {

    case notUserName = "Имя пользователя не найдено"
    case notMail = "Пользователя с данной почтой не существует"
    case notPass = "Неверный пароль"
    
}

class AllUsers {
    
    var contUsers = [
        "Vitalya": User(mail: "vit@mail.ru", pass: "Qq1234"),
        "Stas": User(mail: "st@gmail.com", pass: "Aa1234"),
        "Katya": User(mail: "kate@ro.ru", pass: "Zz1234")
        ]
    
    func logIn(uName user: String, uMail mail: String, uPass pass: String) throws -> String {
        guard let u = contUsers[user] else {
            return (UserError.notUserName.rawValue)
            }
        guard mail == u.mail else {
            return (UserError.notMail.rawValue)
            }
        guard pass == u.pass else {
            return (UserError.notPass.rawValue)
            }
            return ("Вход выполнен")
        }
}

let allUsers = AllUsers()

try allUsers.logIn(uName: "Stas", uMail: "st@gmail.com", uPass: "Aa1234")
try allUsers.logIn(uName: "Stas", uMail: "st@mail.ru", uPass: "Aa1234")

