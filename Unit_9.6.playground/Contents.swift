import UIKit
import     PlaygroundSupport

//Переменные

//Автопилот
var isAutopilotOn = false
//Система обработки ошибок
enum AutoError: Error {
    case isLost // заблудился
    case lowBattery // низкая батарея
    case brokeAutoDrive // проблемы с управлением машины
}
var isLost: Bool = false
var lowBattery: Bool = false
var brokeAutoDrive: Bool = false
//Управление музыкой
let maxMusicVolume = 30
let minMusicVolume = 0
var currentMusicVolume = minMusicVolume
let maxRadioStationNumber = 10
let minRadioStationNumber = 1
var currentRadioStationNumber = minRadioStationNumber
//Управление люком
let maxSunroofOpeningDegree = 100
let minSunroofOpeningDegree = 0
var currentSunroofOpeningDegree = minSunroofOpeningDegree
//Управление климатом
let maxFanSpeed = 4
let minFanSpeed = 0
var currentFanSpeed = minFanSpeed
let maxSeatHeatingPower = 3
let minSeatHeatingPower = 0
var currentSeatHeatingPower = minSeatHeatingPower

//Заряд батареи
var batteryCharge = 4
let maxBatteryCharge = 100
let criticalBatteryCharge = 20
var distanceToChargingStation: Double = 1


//Характеристики автомобиля
let weight = 2108
let length = 4976
let width = 1963
let height = 1435
let wheelbase = 2959
let clearance = 154.9
let trunkVolume = 900

//Функционал

//Управление музыкой
func increaseCurrentMusicVolume() {
    if currentMusicVolume < maxMusicVolume {
        currentMusicVolume += 1
        print("Громкость музыки: \(currentMusicVolume)")
    } else {
        print("Установлена максимальная громкость музыки")
    }
}
func decreaseCurrentMusicVolume() {
    if currentMusicVolume > minMusicVolume {
        currentMusicVolume -= 1
        print("Громкость музыки: \(currentMusicVolume)")
    } else {
        print("Установлена минимальная громкость музыки")
    }
}
func nextRadiostation() {
    if currentRadioStationNumber < maxRadioStationNumber {
        currentRadioStationNumber += 1
    } else {
        currentRadioStationNumber = minRadioStationNumber
    }
    print("Номер радиостанции: \(currentRadioStationNumber)")
}
func previousRadiostation() {
    if currentRadioStationNumber > minRadioStationNumber {
        currentRadioStationNumber -= 1
    } else {
        currentRadioStationNumber = maxRadioStationNumber
    }
    print("Номер радиостанции: \(currentRadioStationNumber)")
}

//Управление люком
func increaseSunroofOpeningDegree() {
    if currentSunroofOpeningDegree < maxSunroofOpeningDegree {
        currentSunroofOpeningDegree += 1
        print("Степень открытия люка: \(currentSunroofOpeningDegree)%")
    } else {
        print("Люк открыт полностью")
    }
}
func decreaseSunroofOpeningDegree() {
    if currentSunroofOpeningDegree > minSunroofOpeningDegree {
        currentSunroofOpeningDegree -= 1
        print("Степень открытия люка: \(currentSunroofOpeningDegree)%")
    } else {
        print("Люк закрыт полностью")
    }
}

//Управление климатом
func increaseFanSpeed() {
    if currentFanSpeed < maxFanSpeed {
        currentFanSpeed += 1
        print("Скорость вентилятора обдува: \(currentFanSpeed)")
    }
    else {
        print("Установлена максимальная скорость вентилятора обдува")
    }
}
func decreaseFanSpeed() {
    if currentFanSpeed > minFanSpeed {
        currentFanSpeed -= 1
        print("Скорость вентилятора обдува: \(currentFanSpeed)")
    }
    else {
        print("Вентилятор обдува выключен")
    }
}
func increaseHeatingPower() {
    if currentSeatHeatingPower < maxSeatHeatingPower {
        currentSeatHeatingPower += 1
        print("Мощность подогрева сидений: \(currentSeatHeatingPower)")
    }
    else {
        print("Установлена максимальная мощность подогрева сидений \(currentSeatHeatingPower)")
    }
}
func decreaseHeatingPower() {
    if currentSeatHeatingPower > minSeatHeatingPower {
        currentSeatHeatingPower -= 1
        print("Мощность подогрева сидений: \(currentSeatHeatingPower)")
    }
    else {
        print("Подогрев сидений выключен")
    }
}

//Включение или выключение автопилота
func turnOnAutopilot() {
    isAutopilotOn = true;
    print("Предупреждение! Автопилот активирован. Следите за дорогой.")
}
func turnOffAutopilot() {
    isAutopilotOn = false
    print("Автопилот отключен")
}

//Система обработки ощшибок

if batteryCharge <= criticalBatteryCharge {
    lowBattery = true
}

func autoDrive() throws {
    if isLost {
        throw AutoError.isLost
    }
 
    if lowBattery {
        throw AutoError.lowBattery
    }
 
    if brokeAutoDrive {
        throw AutoError.brokeAutoDrive
    }
}
 
do {
    try autoDrive()
} catch AutoError.isLost {
    print("Вы заблудились! Включаю GPS")
} catch AutoError.lowBattery {
    print("Низкий заряд батареи! До ближайшей зарядной станции \(distanceToChargingStation) км")
} catch AutoError.brokeAutoDrive {
    print("Режим автопилота поврежден. Переходим в режим ручного управления!")
}

//Перечень функций
//increaseCurrentMusicVolume()
//decreaseCurrentMusicVolume()
//nextRadiostation()
//previousRadiostation()
//increaseSunroofOpeningDegree()
//decreaseSunroofOpeningDegree()
//increaseFanSpeed()
//decreaseFanSpeed()
//increaseHeatingPower()
//decreaseHeatingPower()
//turnOnAutopilot()
//turnOffAutopilot()
