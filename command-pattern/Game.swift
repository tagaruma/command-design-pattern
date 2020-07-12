//
//  Game.swift
//  command-pattern
//
//  Created by Ruslan on 10.07.2020.
//  Copyright © 2020 Ruslan. All rights reserved.
//

import Foundation

struct Game {
    var difficulty: Difficulty = .easy
    var animationDuration: TimeInterval { difficulty.animationDuration }

    var task: [String] {
        var steps: [String] = []

        for _ in 0..<difficulty.stepsCount {
            guard let element = difficulty.stepsOptions.randomElement() else { continue }
            steps.append(element)
        }

        return steps
    }
}
