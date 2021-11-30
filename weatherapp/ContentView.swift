//
//  ContentView.swift
//  weatherapp
//
//  Created by Mirdin Sadykov on 8/14/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = WeatherModel()
    var body: some View {
        if let weather = model.weather {
            Text("Pogoda v Bishekeke: \(tempToString(weather.current.temp)) celcui")
            List(weather.hourly){
                hour in
                Text("Hour: \(secondstoHour(hour.dt)), Temp: \(tempToString(hour.temp))")
            }
        }
        else{
            ProgressView()
        }
    }
    func secondstoHour(_ unix: Double) -> String{
        let date = Date(timeIntervalSince1970: unix)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "h:mm a"
        
        return dateFormater.string(from: date)
    }
    func tempToString(_ temp: Double) -> String{
        return String(format: "%.2f", temp)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
