//
//  NetworkManager.swift
//  SwiftyJokes
//
//  Created by Mark Henrich on 8/18/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import Foundation

class NetworkManager {
    
    func loadJoke(completion: @escaping (Joke?) -> ()) {
        let apiURL = "https://sv443.net/jokeapi/v2/joke/Any?type=single"
        
        guard let url = URL(string: apiURL) else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let joke = try? JSONDecoder().decode(Joke.self, from: data)
            
            DispatchQueue.main.async {
                completion(joke)
            }
            
        }.resume()
        
    }
}

