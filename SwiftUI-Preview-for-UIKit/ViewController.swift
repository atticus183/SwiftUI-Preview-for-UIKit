//
//  ViewController.swift
//  SwiftUI-Preview-for-UIKit
//
//  Created by Josh Rondestvedt on 3/12/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Gradients
    let gradientLayer = CAGradientLayer()

    // MARK: - Labels
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()

    // MARK: - StackView
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemOrange.cgColor]
        view.layer.addSublayer(gradientLayer)

        firstLabel.text = "First Label"
        firstLabel.backgroundColor = .systemBlue
        secondLabel.text = "Second Label"
        secondLabel.backgroundColor = .systemPink
        thirdLabel.text = "Third Label"
        thirdLabel.backgroundColor = .systemTeal

        stackView.addArrangedSubview(firstLabel)
        stackView.addArrangedSubview(secondLabel)
        stackView.addArrangedSubview(thirdLabel)

        //stackView config
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical

        //stackView - spacing between elements
        stackView.distribution = .equalSpacing

        //stackView - how elements are laid out
        stackView.alignment = .leading

        view.addSubview(stackView)

        //MARK: Autolayout
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //Set frame here so we have access to the frame of this VC
        gradientLayer.frame = self.view.frame
    }
}

//Source: https://fluffy.es/xcode-previews-uikit/
#if DEBUG
import SwiftUI

@available(iOS 13, *)

struct ViewController_Preview: PreviewProvider {
    static var devices = ["iPhone 12 Pro", "iPad Pro (11-inch) (2nd generation)"]

    static var previews: some View {
        ForEach(devices, id: \.self) { deviceName in
            ViewController().toPreview()
                .edgesIgnoringSafeArea(.all)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
#endif
