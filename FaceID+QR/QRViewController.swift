//
//  QRViewController.swift
//  FaceID+QR
//
//  Created by Kate  on 08.12.2024.
//

import UIKit

class QRViewController: UIViewController {

    let img = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        img.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        img.heightAnchor.constraint(equalToConstant: 150).isActive = true
        img.widthAnchor.constraint(equalToConstant: 150).isActive = true
        img.backgroundColor = .systemBlue

        let qrImg = generateQRCode(from: "https://ya.ru/?npr=1")

        img.image = qrImg

    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

}
