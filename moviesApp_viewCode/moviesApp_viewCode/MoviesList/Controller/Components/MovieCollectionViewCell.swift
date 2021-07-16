//
//  CardCollectionViewCell.swift
//  magic-bootcamp
//
//  Created by mateus.santos on 16/03/21.
//

import UIKit

protocol delegateMovieCollectionViewCell: AnyObject {
    func hearthIsTouched(_ index: Int)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: delegateMovieCollectionViewCell?

    static let reuseIdentifierListCell = "listMovieCell"
    
    var index: Int?
    
    var isFavorite = false
    
    let imageView:UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let viewTitle:UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.alignment = .center
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let icon:UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(systemName: "heart")
        imageView.tintColor = .yellow
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleMovie:UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.text = "Error"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.zPosition = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpCell(
        index: Int,
        isFavorite: Bool,
        titleMovie:String,
        movieImage:UIImage) {
        self.isFavorite = isFavorite
        self.index = index
        self.titleMovie.text = titleMovie
        self.imageView.image = movieImage
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        let location = firstTouch?.location(in: self) ?? .zero
        
        let elementTouched = self.hitTest(location, with: event)
        
        if elementTouched == self.icon {
            if !isFavorite {
                isFavorite = true
                icon.image = UIImage(systemName: "heart.fill")
            } else {
                isFavorite = false
                icon.image = UIImage(systemName: "heart")
            }
            delegate?.hearthIsTouched(index ?? 0)
        }
    }
}

extension MovieCollectionViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        self.addSubview(imageView)
        self.addSubview(viewTitle)
        
        viewTitle.addArrangedSubview(titleMovie)
        viewTitle.addArrangedSubview(icon)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
        ])
        
        NSLayoutConstraint.activate([
            self.viewTitle.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.viewTitle.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.viewTitle.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            self.viewTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
