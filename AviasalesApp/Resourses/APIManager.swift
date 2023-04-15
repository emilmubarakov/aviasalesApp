//
//  API.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 15.04.2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    
    func getData(from url: String, completion: @escaping ([StoryElement]) -> Void) {
        
        let url = URL(string: url)!
        let request = URLRequest(url: url)
            
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data else { return }
            if let weatherData = try? JSONDecoder().decode(Story.self, from: data) {
                completion(weatherData)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}

