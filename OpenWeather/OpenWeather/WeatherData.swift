//
//  Data.swift
//  OpenWeather
//
//  Created by nastasya on 29.06.2023.
//

import Foundation

let weather = [ Weather(date: "28.06", temperature: "+23", weatherType: .rain),
                Weather(date: "29.06", temperature: "+22", weatherType: .rain),
                Weather(date: "30.06", temperature: "+20", weatherType: .rain),
                Weather(date: "01.07", temperature: "+25", weatherType: .cloudy),
                Weather(date: "02.07", temperature: "+23", weatherType: .murky),
                Weather(date: "03.07", temperature: "+10", weatherType: .thunderstorm),
                Weather(date: "04.07", temperature: "+26", weatherType: .sunny),
                Weather(date: "05.07", temperature: "+26", weatherType: .cloudy),
                Weather(date: "06.07", temperature: "+25", weatherType: .sunny),
                Weather(date: "07.07", temperature: "+24", weatherType: .rain),
                Weather(date: "28.06", temperature: "+23", weatherType: .rain),
                Weather(date: "29.06", temperature: "+22", weatherType: .rain),
                Weather(date: "30.06", temperature: "+20", weatherType: .rain),
                Weather(date: "01.07", temperature: "+25", weatherType: .cloudy),
                Weather(date: "02.07", temperature: "+23", weatherType: .murky),
                Weather(date: "03.07", temperature: "+10", weatherType: .thunderstorm),
                Weather(date: "04.07", temperature: "+26", weatherType: .sunny),
                Weather(date: "05.07", temperature: "+26", weatherType: .cloudy),
                Weather(date: "06.07", temperature: "+25", weatherType: .sunny),
                Weather(date: "07.07", temperature: "+24", weatherType: .rain)
]

var cities = [
    City(name: "Москва", time: "00:00", weather: weather),
    City(name: "Санкт-Петербург", time: "00:00", weather: weather),
    City(name: "Новосибирск", time: "00:00", weather: weather),
    City(name: "Екатеринбург",time: "00:00",  weather: weather),
    City(name: "Нижний Новгород",time: "00:00",  weather: weather),
    City(name: "Красноярск",time: "00:00",  weather: weather),
    City(name: "Челябинск",time: "00:00",  weather: weather),
    City(name: "Уфа",time: "00:00",  weather: weather),
    City(name: "Ростов-на-Дону",time: "00:00",  weather: weather),
    City(name: "Краснодар",time: "00:00",  weather: weather),
    City(name: "Омск",time: "00:00",  weather: weather),
    City(name: "Воронеж",time: "00:00",  weather: weather),
    City(name: "Пермь",time: "00:00",  weather: weather),
    City(name: "Волгоград",time: "00:00",  weather: weather)
]

