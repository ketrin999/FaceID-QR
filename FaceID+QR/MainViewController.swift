//
//  MainViewController.swift
//  FaceID+QR
//
//  Created by Kate  on 08.12.2024.
//

import UIKit
import LocalAuthentication

class MainViewController: UIViewController {

    let faceButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(faceButton)
        faceButton.translatesAutoresizingMaskIntoConstraints = false
        faceButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        faceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceButton.backgroundColor = .systemBlue
        faceButton.setTitle("FaceID+QR", for: .normal)
        faceButton.layer.cornerRadius = 10
        faceButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)

    }

    @objc func pressed() {
        indetifyYourself()
    }

    private func indetifyYourself() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {

            let reason = "Идентифицируйте себя"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in

                if success {
                    DispatchQueue.main.async { [unowned self] in
                        let vc = QRViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                        print("Успешная авторизация")
                    }
                }
            }

        } else {
            print("Face/Touch ID не найден")
        }
    }


}

