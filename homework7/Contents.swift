import Foundation
//Реализуйте проверяльщик примеров.
//Есть массив строк. Но это не обычные строки - это примеры.
//Пример - это строка формата «32 + 16 = 48». В нём два числа слева от равно, одно число справа. Операции: сложение и вычитание.
enum CheckResult{
    case goodJob(message: String )
    case incorrect(result: Double)
}
enum CheckError: Error {
    case invalid(message: String)
}
let pattern = "-?\\d+\\s[+-]\\s-?\\d+\\s=\\s-?\\d+"
//    Функция checkTask:
//    1. Принимает пример
//    2. Если это не пример - надо кинуть исключение
//    3. Если пример решён правильно - возвращаем строку с похвалой
//    4. Если нет - возвращаем ошибку с правильным ответом
func checkTask(_ example: String) throws -> CheckResult{
    var isValid = example.range(
        of:  pattern,
        options: .regularExpression)
    != nil
    var isCorrect = false;
    var result: Double = 0;
    if (isValid) {
        let parts = example.filter({
            $0 != " "
        })
        .components(separatedBy: "=")
        let exp: NSExpression = NSExpression(format: parts[0])
        result = exp.expressionValue(with:nil, context: nil) as! Double
        if (result.isNaN) {
            isValid = false;
        }
        else {
            isCorrect = result == Double(parts.last!)
        }
    }

    if (!isValid) {
        throw CheckError.invalid(message: "Такое я считать не умею")
    }

    if (!isCorrect) {
        return .incorrect(result:result)
    }

    return .goodJob(message: "молодец")
}
//   Функция checkHomework:
//    1. Принимает массив примеров
//    2. Возвращает:
//        1) Если больше 75% ошибок в примерах - функция возвращает список всех примеров с ошибками и подписью «делай заново»
//        2) Если пример решён верно - возвращает строку «молодец»
//        3) Если нет примеров - возвращает строку «нет примеров»
//    3. Если ей на вход дать хотя бы один невалидный пример - выводит "переделывай" и не оценивает другие примеры
func getRet(_ tasks: Array<Task>, withoutErrors: Bool) -> String {
    let ret = tasks.reduce("", {
        (i, result) in
        if (!withoutErrors && result.1 != nil) {
            return i + result.0 + "\n"
        }
        else if (withoutErrors) {
            return i + result.0 + (result.1 == nil ? " молодец" : "") + "\n"
        }
        return i + ""
    })

    return ret
}
typealias Task = (String, Double?, String)
func checkHomework(_ tasks: Array<String>) -> String {
    if (tasks.count == 0) {
        return "Нет примеров :("
    }

    var incorrectsCount = 0;
    var checkedTasks = [Task]()
    for task in tasks {
        do {
            let ok = try checkTask(task)
            switch(ok) {
                case CheckResult.incorrect(let result):
                checkedTasks.append((task, result, "Делай заново"));
                incorrectsCount += 1
                case CheckResult.goodJob(let msg):
                checkedTasks.append((task, nil, msg));
            }
        }
        catch CheckError.invalid(_) {
            return "Переделывай"
        }
        catch {
            exit(-1)
        }
    }

    var ret = "";
    if (incorrectsCount * 100 / tasks.count > 75) {
        ret = checkedTasks.reduce("", {
            (i, result) in
            if ( result.1 != nil) {
                return i + result.0 + "\n"
            }
            return i + ""
        })

        ret += "делай заново"
    }
    else {
        ret=checkedTasks.reduce("", {
            (i, result) in
            return i + result.0 + (result.1 == nil ? " молодец" : "") + "\n"
        })

    }
    return ret
}
