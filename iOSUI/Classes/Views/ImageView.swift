//
//  ImageView.swift
//  iOSUI
//
//  Created by ITAU on 30-04-20.
//

import Foundation
import UIKit

public class ImageView: UIView {

    private lazy var poster: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstrains()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func updateImage(image: UIImage) {
        self.poster.image = image
    }

    func setupConstrains() {
           self.addSubview(poster)

           NSLayoutConstraint.activate([
               .init(item: poster, attribute: .topMargin, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: 0),
               .init(item: poster, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
               .init(item: self, attribute: .bottom, relatedBy: .equal, toItem: poster, attribute: .bottom, multiplier: 1.0, constant: 0),
               .init(item: self, attribute: .trailing, relatedBy: .equal, toItem: poster, attribute: .trailing, multiplier: 1.0, constant: 0)
           ])

           self.backgroundColor = .white
           self.layer.cornerRadius = 5.0
           self.clipsToBounds = true
    }
}
