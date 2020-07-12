//
//  MainViewController.swift
//  command-pattern
//
//  Created by Ruslan on 05.07.2020.
//  Copyright © 2020 Ruslan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private lazy var game: Game = Game()

    private lazy var gameCoverView: GameCoverView = {
        var view = GameCoverView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self

        return view
    }()

    private lazy var gameView: GameView = {
        var view = GameView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.isHidden = true

        return view
    }()

    private lazy var exitButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Exit", for: .normal)
        button.addTarget(self, action: #selector(touchUpInside(exitButton:)), for: .touchUpInside)
        button.setTitleColor(.rgb(red: 0.0, green: 117.0, blue: 255.0), for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.isHidden = true

        return button
    }()

}

// MARK: - Life Cycle

extension MainViewController {
    override func loadView() {
        super.loadView()

        setUpSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.title = "Command Design Pattern"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: exitButton)
    }
}

// MARK: - Layout

extension MainViewController {
    private func setUpSubviews() {
        view.addSubview(gameCoverView)
        view.addSubview(gameView)

        gameCoverView.addAnchors(
            top: view.layoutGuide.topAnchor,
            bottom: view.layoutGuide.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor
        )
        gameView.addAnchors(
            top: view.layoutGuide.topAnchor,
            bottom: view.layoutGuide.bottomAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor
        )
    }
}

// MARK: - Actions

extension MainViewController {
    private func startGame() {
        gameCoverView.isHidden = true
        gameView.isHidden = false
        exitButton.isHidden = false
    }

    private func exitGame() {
        exitButton.isHidden = true
        gameCoverView.isHidden = false
        gameView.isHidden = true
    }

    private func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            button.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            UIView.animate(withDuration: 0.3) {
                button.transform = CGAffineTransform.identity
            }
        })
    }
}

// MARK: - UIButton

extension MainViewController {
    @objc private func touchUpInside(exitButton: UIButton) {
        exitGame()
    }
}

// MARK: - GameCoverDelegate

extension MainViewController: GameCoverDelegate {
    func gameCoverViewDidPressStartGame(_ gameCoverView: GameCoverView) {
        startGame()
    }

    func gameCoverViewDidPressSelectDifficulty(_ gameCoverView: GameCoverView) {
        showDifficultySelectionAlertController()
    }
}

// MARK: - GameDelegate

extension MainViewController: GameDelegate {
    func gameView(_ gameView: GameView, didTouchUpInside button: UIButton) {
        guard let accessibilityIdentifier = button.accessibilityIdentifier else { return }
        animateButton(button)
        
        switch AccessibilityIdentifier(rawValue: accessibilityIdentifier) {
        case .top:
            print(accessibilityIdentifier)
        case .topRight:
            print(accessibilityIdentifier)
        case .right:
            print(accessibilityIdentifier)
        case .bottomRight:
            print(accessibilityIdentifier)
        case .bottom:
            print(accessibilityIdentifier)
        case .bottomLeft:
            print(accessibilityIdentifier)
        case .left:
            print(accessibilityIdentifier)
        case .topLeft:
            print(accessibilityIdentifier)
        default:
            break
        }
    }
}

// MARK: - UIAlertController

extension MainViewController {
    private func showDifficultySelectionAlertController() {
        let alertController = UIAlertController(title: "Select Game Difficulty", message: nil, preferredStyle: .actionSheet)

        for difficulty in Difficulty.allCases {
            alertController.addAction(UIAlertAction(title: difficulty.title, style: .default) { [weak self] action in
                self?.game.difficulty = difficulty
                self?.gameView.updateButtons(with: difficulty)
            })
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
