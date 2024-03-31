//
//  AlertUtil.swift
//  eUpravaGlasaj
//
//  Created by Sandra Melovic on 28.3.24..
//

import Foundation
import UIKit

class AlertUtil {
    static func displayAlert(withTitle title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        viewController.present(alert, animated: true)
    }
}

