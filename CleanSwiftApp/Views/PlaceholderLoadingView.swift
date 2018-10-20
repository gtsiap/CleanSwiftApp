//
//  PlaceholderLoadingView.swift
//  CleanSwiftApp
//
//  Created by Giorgos Tsiapaliokas on 30/09/2018.
//  Copyright © 2018 Giorgos Tsiapaliokas. All rights reserved.
//

import UIKit

final class PlaceholderLoadingView: UIView, NibLoadable {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!

    class func loadingView(for containerView: UIView) -> PlaceholderLoadingView {
        let loadingView = PlaceholderLoadingView.loadFromNib()
        containerView.addSubview(loadingView)

        let marginsGuide = containerView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            loadingView.leadingAnchor.constraint(equalTo: marginsGuide.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: marginsGuide.trailingAnchor),
            loadingView.topAnchor.constraint(equalTo: marginsGuide.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: marginsGuide.bottomAnchor)
        ])

        return loadingView
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        loadingLabel.text = "TODO"
        isHidden = true
    }

    func startLoading() {
        loadingIndicator.startAnimating()
        isHidden = false
    }

    func stopLoading() {
        loadingIndicator.stopAnimating()
        isHidden = true
    }
}
