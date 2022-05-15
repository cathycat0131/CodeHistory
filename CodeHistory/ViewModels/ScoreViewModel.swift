//
//  ScoreViewModel.swift
//  CodeHistory
//
//  Created by Cathy Chen on 2022-05-14.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100) / (correctGuesses + incorrectGuesses)
    }
    var displayMessage: Bool {
        return (percentage == 100)
    }
    
}
