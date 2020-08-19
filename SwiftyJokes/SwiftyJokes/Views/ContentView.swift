//
//  ContentView.swift
//  SwiftyJokes
//
//  Created by Mark Henrich on 8/18/20.
//  Copyright © 2020 Mark Henrich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var jokeVM = JokeViewModel()
    
    var body: some View {
        VStack {
            Text("\(jokeVM.jokeText)")
                .font(.custom("Times New Roman", size: 20))
                .padding()
            Button("New Joke") {
                self.jokeVM.getNewJoke()
            }
            .font(.custom("Times New Roman", size: 20))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
