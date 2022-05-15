//
//  GameViewModel.swift
//  CodeHistory
//
//  Created by Cathy Chen on 2022-05-14.
//

import SwiftUI

//1
class GameViewModel: ObservableObject {
    
    @Published private var game = Game()
    
    var guessWasMade: Bool {
        if let _ = game.guesses[currentQuestion] {
            return true
        } else {
            return false
        }
    }
    
    var gameIsOver: Bool {
        game.isOver
    }
    
    //Mark: - Published properties
    //2
    func makeGuess(atIndex index: Int) {
        game.makeGuessForCurrentQuestion(atIndex: index)
    }
    //Mark: - Internal Properties
    //3
    func displayNextScreen() {
        game.updateGameStatus()
    }
    
    func color(forOptionIndex optionIndex: Int) -> Color {
        if let guessedIndex = game.guesses[currentQuestion] {
            if guessedIndex != optionIndex {
                return GameColor.main
            } else if guessedIndex == currentQuestion.correctAnswerIndex {
                return GameColor.correctGuess
            } else {
                return GameColor.incorretGuess
            }
        }else {
            return GameColor.main
        }
    }
    var currentQuestion: Question {
        game.currentQuestions
    }
    
    //4
    var questionProgressText: String {
        "\(game.currentQuestionIndex + 1)/ \(game.numberofQuestion)"
    }
    
    var correctGuesses: Int {
        game.guessCount.correct
    }
    
    var incorrectGuesses: Int {
        game.guessCount.incorrect
    }
}
