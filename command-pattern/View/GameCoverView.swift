//
//  GameCoverView.swift
//  command-pattern
//
//  Created by Ruslan on 10.07.2020.
//  Copyright © 2020 Ruslan. All rights reserved.
//

import UIKit

protocol GameCoverDelegate: class {
    func gameCoverViewDidPressStartGame(_ gameCoverView: GameCoverView)
    func gameCoverViewDidPressSelectDifficulty(_ gameCoverView: GameCoverView)
}

class GameCoverView: UIView {
    weak var delegate: GameCoverDelegate?

    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Simple\nMemory\nGame"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 35.0, weight: .semibold)
        label.textAlignment = .center

        return label
    }()

    private lazy var startGameButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Game", for: .normal)
        button.setTitleColor(.rgb(red: 0.0, green: 117.0, blue: 255.0), for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 22.0, weight: .semibold)
        button.addTarget(self, action: #selector(touchUpInside(startGameButton:)), for: .touchUpInside)

        return button
    }()

    private lazy var selectDifficultyButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Select Difficulty", for: .normal)
        button.setTitleColor(.rgb(red: 0.0, green: 100.0, blue: 200.0), for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 18.0, weight: .regular)
        button.addTarget(self, action: #selector(touchUpInside(selectDifficultyButton:)), for: .touchUpInside)

        return button
    }()

    // MARK: - Init

    init() {
        super.init(frame: .zero)

        setUpSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension GameCoverView {
    private func setUpSubviews() {
        addSubview(titleLabel)
        addSubview(startGameButton)
        addSubview(selectDifficultyButton)

        titleLabel.addAnchors(centerX: centerXAnchor, centerY: centerYAnchor, centerYConst: -110.0)
        startGameButton.addAnchors(top: titleLabel.bottomAnchor, topPadding: 75.0, centerX: centerXAnchor)
        selectDifficultyButton.addAnchors(top: startGameButton.bottomAnchor, topPadding: 25.0, centerX: centerXAnchor)
    }
}

// MARK: - UIButton

extension GameCoverView {
    @objc private func touchUpInside(startGameButton: UIButton) {
        startGame()
    }

    @objc private func touchUpInside(selectDifficultyButton: UIButton) {
        selectDifficulty()
    }
}

// MARK: - Actions

extension GameCoverView {
    private func startGame() {
        delegate?.gameCoverViewDidPressStartGame(self)
    }

    private func selectDifficulty() {
        delegate?.gameCoverViewDidPressSelectDifficulty(self)
    }
}
