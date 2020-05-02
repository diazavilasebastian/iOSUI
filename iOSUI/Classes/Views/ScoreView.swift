//
//  ScoreView.swift
//  iOSUI
//
//  Created by ITAU on 02-05-20.
//

import Foundation
import UIKit

class ScoreView: UIView {

    var title: String
    var score: String

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.title
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()

    lazy var scoreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .darkGray
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = self.score
        label.layer.cornerRadius = 5.0
        label.clipsToBounds = true
        label.textAlignment = .center
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()

    init(title: String,
         score: String,
         frame: CGRect) {
        self.title = title
        self.score = score
        super.init(frame: frame)
        self.setupView()

    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
         configureView()
         addHierarchy()
         addConstraints()
    }

    func configureView() {
        self.backgroundColor = .black
    }

    func addHierarchy() {
        self.addSubview(scoreLabel)
        self.addSubview(titleLabel)
    }


     /// Constrains
    func addConstraints() {

        NSLayoutConstraint.activate([
            .init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            .init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0),
            .init(item: scoreLabel, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            .init(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)

         ])

         NSLayoutConstraint.activate([
             .init(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: scoreLabel, attribute: .centerY, multiplier: 1.0, constant: 0.0),
             .init(item: self, attribute: .trailing, relatedBy: .equal, toItem: scoreLabel, attribute: .trailing, multiplier: 1.0, constant: 0.0)
         ])
    }

}

