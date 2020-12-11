//
//  TwoLineView.swift
//  iOSUI
//
//  Created by Sebastian Diaz Avila on 27-04-20.
//

import Foundation
import UIKit

public class TwoLineView: UIView {

    public var title: String { didSet { titleLabel.text = title } }

    public var detail: String { didSet { detailLabel.text = detail } }

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.title
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = self.title
        return label
    }()

    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.detail
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.text = self.detail
        return label
    }()

    public init(title: String,
         description: String = "",
         frame: CGRect = .zero) {
        self.title = title
        self.detail = description
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
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
    }

    func addConstraints() {

        NSLayoutConstraint.activate([
            .init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            .init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0),
            .init(item: self, attribute: .trailing, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            .init(item: detailLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 15.0)
        ])

        NSLayoutConstraint.activate([
            .init(item: detailLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 15.0),
            .init(item: self, attribute: .trailing, relatedBy: .equal, toItem: detailLabel, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            .init(item: self, attribute: .bottom, relatedBy: .equal, toItem: detailLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
    }
}
