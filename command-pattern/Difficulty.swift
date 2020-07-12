//
//  Difficulty.swift
//  command-pattern
//
//  Created by Ruslan on 10.07.2020.
//  Copyright © 2020 Ruslan. All rights reserved.
//

import Foundation

enum Difficulty: CaseIterable {
    case easy
    case medium
    case hard

    var title: String {
        switch self {
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        }
    }

    var stepsCount: Int {
        switch self {
        case .easy:
            return 5
        case .medium:
            return 6
        case .hard:
            return 7
        }
    }

    var stepsOptions: [String] {
        switch self {
        case .easy, .medium:
            return ["⬅️", "➡️", "⬆️", "⬇️"]
        case .hard:
            return ["⬅️", "➡️", "⬆️", "⬇️", "↖️", "↗️", "↙️", "↘️"]
        }
    }

    var animationDuration: TimeInterval {
        switch self {
        case .easy:
            return 0.7
        case .medium:
            return 0.5
        case .hard:
            return 0.3
        }
    }
}
