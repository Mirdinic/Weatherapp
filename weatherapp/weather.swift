//
//  weather.swift
//  weatherapp
//
//  Created by Mirdin Sadykov on 8/16/21.
//

import Foundation

struct WeatherResponse: Decodable {
    var lat: Double
    var lon: Double
    var current: Weather
    var hourly: [Weather]
}

struct  Weather: Decodable, Identifiable {
    var id: UUID?
    var dt: Double
    var temp: Double
}
