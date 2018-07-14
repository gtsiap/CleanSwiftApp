//
//  UIViewController+Extensions.swift
//  Presentation
//
//  Created by Giorgos Tsiapaliokas on 09/02/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import RxSwift

extension UIViewController {
    public func showAlert(for error: Error) {
        print(error)
        let title: String

        if let error = error as? RxError {
            title = error.debugDescription
        } else if let error = error as? LocalizedError, let errorTitle = error.failureReason {
            title = errorTitle
        } else {
            title = "Error"
        }

        let alert = UIAlertController(title: title,
                                      message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            alert.dismiss(animated: true)
        }))

        present(alert, animated: true)
    }
}
