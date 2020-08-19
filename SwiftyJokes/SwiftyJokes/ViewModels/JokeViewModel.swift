//
//  JokeViewModel.swift
//  SwiftyJokes
//
//  Created by Mark Henrich on 8/18/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import Foundation
import Combine

class JokeViewModel: ObservableObject {
    @Published var joke = Joke(joke: "no joke found")
    
    var jokeText: String {
        return joke.joke
    }
    
    func getNewJoke() {
        NetworkManager().loadJoke() { joke in
            guard let newJoke = joke else { return }
            self.joke = newJoke
        }
    }
}
