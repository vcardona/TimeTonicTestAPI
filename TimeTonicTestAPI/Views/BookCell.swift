//
//  BookCell.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 5/06/24.
//

import UIKit

class BookCell: UITableViewCell {
    
    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bookImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bookImageView.widthAnchor.constraint(equalToConstant: 50),
            bookImageView.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with book: Book) {
        titleLabel.text = book.ownerPrefs?.title
        
        if let url = book.coverImageUrl {
            // Load image from URL (you might want to use a library like SDWebImage for better performance and caching)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.bookImageView.image = UIImage(data: data)
                    }
                }
            }
        } else {
            bookImageView.image = nil
        }
    }
}

