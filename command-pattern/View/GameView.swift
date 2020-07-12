//
//  GameView.swift
//  command-pattern
//
//  Created by Ruslan on 11.07.2020.
//  Copyright © 2020 Ruslan. All rights reserved.
//

import UIKit

protocol GameDelegate: class {
    func gameView(_ gameView: GameView, didTouchUpInside button: UIButton)
}

class GameView: UIView {
    weak var delegate: GameDelegate?

    private lazy var resultLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18.0, weight: .regular)
        label.numberOfLines = 0

        return label
    }()

    private lazy var topButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⬆️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.top.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)

        return button
    }()

    private lazy var topRightButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("↗️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.topRight.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)
        button.isHidden = true

        return button
    }()

    private lazy var rightButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("➡️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.right.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)

        return button
    }()

    private lazy var bottomRightButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("↘️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.bottomRight.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)
        button.isHidden = true

        return button
    }()

    private lazy var bottomButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⬇️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.bottom.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)

        return button
    }()

    private lazy var bottomLeftButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("↙️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.bottomLeft.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)
        button.isHidden = true

        return button
    }()

    private lazy var leftButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⬅️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.left.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)

        return button
    }()

    private lazy var topLeftButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("↖️", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(button:)), for: .touchUpInside)
        button.accessibilityIdentifier = AccessibilityIdentifier.topLeft.rawValue
        button.titleLabel?.font = .systemFont(ofSize: 45.0)
        button.isHidden = true

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

extension GameView {
    private func setUpSubviews() {
        addSubview(resultLabel)
        addSubview(topButton)
        addSubview(topRightButton)
        addSubview(rightButton)
        addSubview(bottomRightButton)
        addSubview(bottomButton)
        addSubview(bottomLeftButton)
        addSubview(leftButton)
        addSubview(topLeftButton)

        resultLabel.addAnchors(
            centerX: centerXAnchor,
            centerY: centerYAnchor, centerYConst: -150.0
        )
        topButton.addAnchors(
            width: 50.0, height: 50.0,
            centerX: centerXAnchor,
            centerY: centerYAnchor, centerYConst: 50.0
        )
        topRightButton.addAnchors(
            leading: topButton.trailingAnchor, leadingPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerY: topButton.centerYAnchor
        )
        rightButton.addAnchors(
            top: topRightButton.bottomAnchor, topPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerX: topRightButton.centerXAnchor
        )
        bottomRightButton.addAnchors(
            top: rightButton.bottomAnchor, topPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerX: rightButton.centerXAnchor
        )
        bottomButton.addAnchors(
            trailing: bottomRightButton.leadingAnchor, trailingPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerY: bottomRightButton.centerYAnchor
        )
        bottomLeftButton.addAnchors(
            trailing: bottomButton.leadingAnchor, trailingPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerY: bottomButton.centerYAnchor
        )
        leftButton.addAnchors(
            bottom: bottomLeftButton.topAnchor, bottomPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerX: bottomLeftButton.centerXAnchor
        )
        topLeftButton.addAnchors(
            bottom: leftButton.topAnchor, bottomPadding: 50.0,
            widthAnchor: topButton.widthAnchor,
            heightAnchor: topButton.heightAnchor,
            centerX: leftButton.centerXAnchor
        )
    }
}

// MARK: - UIButton

extension GameView {
    @objc private func touchUpInside(button: UIButton) {
        delegate?.gameView(self, didTouchUpInside: button)
    }
}

// MARK: - Actions

extension GameView {
    func updateButtons(with difficulty: Difficulty) {
        topRightButton.isHidden = difficulty != .hard
        bottomRightButton.isHidden = difficulty != .hard
        bottomLeftButton.isHidden = difficulty != .hard
        topLeftButton.isHidden = difficulty != .hard
    }

    func updateResultLabel(with text: String) {
        resultLabel.text = text
    }
}
