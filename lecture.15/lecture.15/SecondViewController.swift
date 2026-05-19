//
//  SecondViewController.swift
//  lecture.15
//
//  Created by naat minasiani on 20/05/2026.
//
import UIKit

protocol SecondViewControllerDelegate: AnyObject {

    func changeButtonColor(color: UIColor)
    func changeBackgroundColor(color: UIColor)
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPurple

        setupUI()
    }

    func setupUI() {

        let buttonColorView = createSectionView(
            title: "ღილაკის ფერის არჩევა"
        )

        let backgroundColorView = createSectionView(
            title: "ფონის ფერის არჩევა"
        )

        view.addSubview(buttonColorView)
        view.addSubview(backgroundColorView)

        buttonColorView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            buttonColorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            buttonColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonColorView.heightAnchor.constraint(equalToConstant: 150),

            backgroundColorView.topAnchor.constraint(equalTo: buttonColorView.bottomAnchor, constant: 40),
            backgroundColorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backgroundColorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backgroundColorView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    func createSectionView(title: String) -> UIView {

        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 12

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 18, weight: .medium)

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        let redButton = createColorButton(color: .red)
        let yellowButton = createColorButton(color: .yellow)
        let greenButton = createColorButton(color: .green)
        let blueButton = createColorButton(color: .blue)
        let orangeButton = createColorButton(color: .orange)

    
        if title.contains("ღილაკი") {

            redButton.addAction(UIAction { _ in
                self.delegate?.changeButtonColor(color: .red)
            }, for: .touchUpInside)

            yellowButton.addAction(UIAction { _ in
                self.delegate?.changeButtonColor(color: .yellow)
            }, for: .touchUpInside)

            greenButton.addAction(UIAction { _ in
                self.delegate?.changeButtonColor(color: .green)
            }, for: .touchUpInside)

            blueButton.addAction(UIAction { _ in
                self.delegate?.changeButtonColor(color: .blue)
            }, for: .touchUpInside)

            orangeButton.addAction(UIAction { _ in
                self.delegate?.changeButtonColor(color: .orange)
            }, for: .touchUpInside)

        } else {

            redButton.addAction(UIAction { _ in
                self.delegate?.changeBackgroundColor(color: .red)
            }, for: .touchUpInside)

            yellowButton.addAction(UIAction { _ in
                self.delegate?.changeBackgroundColor(color: .yellow)
            }, for: .touchUpInside)

            greenButton.addAction(UIAction { _ in
                self.delegate?.changeBackgroundColor(color: .green)
            }, for: .touchUpInside)

            blueButton.addAction(UIAction { _ in
                self.delegate?.changeBackgroundColor(color: .blue)
            }, for: .touchUpInside)

            orangeButton.addAction(UIAction { _ in
                self.delegate?.changeBackgroundColor(color: .orange)
            }, for: .touchUpInside)
        }

        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(yellowButton)
        stackView.addArrangedSubview(greenButton)
        stackView.addArrangedSubview(blueButton)
        stackView.addArrangedSubview(orangeButton)

        let verticalStack = UIStackView(arrangedSubviews: [
            titleLabel,
            stackView
        ])

        verticalStack.axis = .vertical
        verticalStack.spacing = 20
        verticalStack.translatesAutoresizingMaskIntoConstraints = false

        container.addSubview(verticalStack)

        NSLayoutConstraint.activate([

            verticalStack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            verticalStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            verticalStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16)
        ])

        return container
    }

    func createColorButton(color: UIColor) -> UIButton {

        let button = UIButton()
        button.backgroundColor = color
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true

        return button
    }
}
