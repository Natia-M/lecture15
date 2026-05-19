//
//  FirstViewController.swift
//  lecture.15
//
//  Created by naat minasiani on 20/05/2026.
//

import UIKit

class FirstViewController: UIViewController {

    let titleLabel = UILabel()
    let openButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupUI()
    }

    func setupUI() {

        titleLabel.text = "პირველი გვერდი"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        openButton.setTitle("გადასვლა", for: .normal)
        openButton.backgroundColor = .systemBlue
        openButton.layer.cornerRadius = 12
        openButton.translatesAutoresizingMaskIntoConstraints = false

        openButton.addTarget(self,
                             action: #selector(openSecondVC),
                             for: .touchUpInside)

        view.addSubview(titleLabel)
        view.addSubview(openButton)

        NSLayoutConstraint.activate([

            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),

            openButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openButton.widthAnchor.constraint(equalToConstant: 220),
            openButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    @objc func openSecondVC() {

        let vc = SecondViewController()

        vc.delegate = self

        navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirstViewController: SecondViewControllerDelegate {

    func changeButtonColor(color: UIColor) {

        openButton.backgroundColor = color
    }

    func changeBackgroundColor(color: UIColor) {

        view.backgroundColor = color
    }
}
