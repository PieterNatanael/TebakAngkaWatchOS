//
//  ContentView.swift
//  TebakAngkaWatchOS Watch App
//
//  Created by Pieter Yoshua Natanael on 25/09/23.
//

import SwiftUI


struct NumberWizardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var targetNumber = Int.random(in: 1...100)
    @State private var userGuess = ""
    @State private var message = ""
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("NumberWizard")
                .font(.headline)
                .padding()

            Text("Guess 1-100")
                .font(.subheadline)
                .padding()

            TextField("Enter your guess", text: $userGuess)
                .padding()

            Button("Submit Guess") {
                checkGuess()
            }
            .padding()

            Text(message)
                .font(.subheadline)
                .foregroundColor(messageColor())
                .padding()

        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Congratulations!"),
                message: Text("You guessed  \(targetNumber)!"),
                dismissButton: .default(Text("Play Again")) {
                    resetGame()
                }
            )
        }
    }

    func checkGuess() {
        guard let guess = Int(userGuess) else {
            message = "Please enter a valid number."
            return
        }

        if guess < 1 || guess > 100 {
            message = "Please enter a number between 1 and 100."
        } else if guess == targetNumber {
            message = "Congratulations! You guessed the number \(targetNumber)!"
            showAlert = true
        } else if guess < targetNumber {
            message = "Try a higher number."
        } else {
            message = "Try a lower number."
        }
    }

    func resetGame() {
        targetNumber = Int.random(in: 1...100)
        userGuess = ""
        message = ""
    }

    func messageColor() -> Color {
        if message.contains("Congratulations") {
            return .green
        } else {
            return .red
        }
    }
}



/*
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
