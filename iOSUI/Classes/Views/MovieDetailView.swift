//
//  MovieDetailView.swift
//  iOSUI
//
//  Created by ITAU on 02-05-20.
//

import Foundation

public class MovieDetailView: UIView {

    var title: String { didSet { titleLabel.text = title }}
    var image: UIImage { didSet { movieImage.image = image }}

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.title
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    lazy var movieImage: UIImageView = {
        let image = self.image
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    public lazy var popularityLabel: ScoreView = {
        let view = ScoreView(title: "Popularity", frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public lazy var overViewLabel: TwoLineView = {
        let view = TwoLineView(title: "General review")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public lazy var tagLineLabel: TwoLineView = {
        let view = TwoLineView(title: "Tagline")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        return view
    }()

    public lazy var genresViews: LabelStackView = {
        let view = LabelStackView(title: "Genres",
                                  axis: .horizontal,
                                  distribution: .fillProportionally,
                                  spacing: 10.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public lazy var companyViews: LabelStackView = {
        let view = LabelStackView(title: "Production companies",
                                  axis: .vertical,
                                  distribution: .fillProportionally,
                                  spacing: 10.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
       scroll.translatesAutoresizingMaskIntoConstraints = false
       return scroll
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    public init(title: String,
         image: UIImage,
         frame: CGRect) {
        self.title = title
        self.image = image
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
        addConstrains()
    }

    func configureView() {
        self.backgroundColor = .black
    }

    func addHierarchy() {
        scrollView.addSubview(contentView)
        self.addSubview(scrollView)

        contentView.addSubview(titleLabel)
        contentView.addSubview(movieImage)
        contentView.addSubview(popularityLabel)
        contentView.addSubview(tagLineLabel)
        contentView.addSubview(overViewLabel)
        contentView.addSubview(loadingView)
        contentView.addSubview(genresViews)
        contentView.addSubview(companyViews)
    }

    /// Constrains
    func addConstrains() {

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            .init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 30.0),
            .init(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 50.0)
        ])

        NSLayoutConstraint.activate([
            .init(item: loadingView, attribute: .centerY, relatedBy: .equal, toItem: titleLabel, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            .init(item: loadingView, attribute: .leading, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 0.0),
        ])

        NSLayoutConstraint.activate([
            .init(item: movieImage, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1.0, constant: 30.0),
            .init(item: movieImage, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: movieImage, attribute: .trailing, multiplier: 1.0, constant: 30.0),
            .init(item: movieImage, attribute: .height, relatedBy: .equal, toItem: movieImage, attribute: .width, multiplier: (movieImage.frame.size.height / movieImage.frame.size.width), constant: 0)
        ])

        NSLayoutConstraint.activate([
            .init(item: popularityLabel, attribute: .top, relatedBy: .equal, toItem: movieImage, attribute: .bottom, multiplier: 1.0, constant: 30.0),
            .init(item: popularityLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: popularityLabel, attribute: .trailing, multiplier: 1.0, constant: 30.0)
        ])

        NSLayoutConstraint.activate([
            .init(item: tagLineLabel, attribute: .top, relatedBy: .equal, toItem: popularityLabel, attribute: .bottom, multiplier: 1.0, constant: 30.0),
            .init(item: tagLineLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: tagLineLabel, attribute: .trailing, multiplier: 1.0, constant: 30.0)
        ])

        NSLayoutConstraint.activate([
            .init(item: overViewLabel, attribute: .top, relatedBy: .equal, toItem: tagLineLabel, attribute: .bottom, multiplier: 1.0, constant: 30.0),
            .init(item: overViewLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: overViewLabel, attribute: .trailing, multiplier: 1.0, constant: 30.0)
        ])

        NSLayoutConstraint.activate([
            .init(item: genresViews, attribute: .top, relatedBy: .equal, toItem: overViewLabel, attribute: .bottom, multiplier: 1.0, constant: 30.0),
            .init(item: genresViews, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: genresViews, attribute: .trailing, multiplier: 1.0, constant: 30.0),
        ])

        NSLayoutConstraint.activate([
            .init(item: companyViews, attribute: .top, relatedBy: .equal, toItem: genresViews, attribute: .bottom, multiplier: 1.0, constant: 30.0),
            .init(item: companyViews, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .trailing, relatedBy: .equal, toItem: companyViews, attribute: .trailing, multiplier: 1.0, constant: 30.0),
            .init(item: contentView, attribute: .bottom, relatedBy: .equal, toItem: companyViews, attribute: .bottom, multiplier: 1.0, constant: 30.0)
        ])

    }
}
