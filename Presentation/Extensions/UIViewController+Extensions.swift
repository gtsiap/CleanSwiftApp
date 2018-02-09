//
//  UIViewController+Extensions.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import Foundation

extension UIViewController {
    public func showAlert(for error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))

        present(alert, animated: true)
    }
}
