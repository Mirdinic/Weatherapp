//
//  weathermodel.swift
//  weatherapp
//
//  Created by Mirdin Sadykov on 8/14/21.
//

import Foundation

class WeatherModel: ObservableObject {
    @Published var weather: WeatherResponse?
    
    init(){
        //make request to the api
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=42.882004&lon=74.582748&exclude=minutely,alerts&appid=7984bca3de152d1da932039951ceab9a&units=metric")
        let task = session.dataTask(with: url!) {data, response, error in
            //check for the errors and data
             if data != nil && error == nil {
            
            //parse the response into weather objects
            let decoder = JSONDecoder()
                do{
                    var weatherResponse = try decoder.decode(WeatherResponse.self, from: data!)
                    
                    //add uuids to the hourly weather objects
                     
                    for i in 0..<weatherResponse.hourly.count{
                        weatherResponse.hourly[i].id = UUID()
                    }
                    //update the UI from the main thread
                    DispatchQueue.main.async {
                        //set weather property with the parsed objects
                            self.weather = weatherResponse
                    }}
                
                catch{
                    
                }
            
              
              
                }
         
            }
        
        task.resume()
    }
}
