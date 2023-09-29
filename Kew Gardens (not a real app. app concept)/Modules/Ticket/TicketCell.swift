//
//  TicketCell.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 29/09/2023.
//

import UIKit
import SnapKit

class TicketCell: UICollectionViewCell {
    
    public static var identifier: String {
        get {
            return "TicketCell"
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let shopImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        shopImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        shopImageView.layer.cornerRadius = 15
        shopImageView.clipsToBounds = true
        layer.cornerRadius = 15
    }
    
    // MARK: - Public methods
    func configure(with ticket: TicketModel) {
        let QRimage = generateQRCode(from: ticket.info)
        guard let image = QRimage else { return }
        shopImageView.image = image
    }
    
    // MARK: - Private methods (move to vm)
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return nil}
            
            let transformScale = CGAffineTransform(scaleX: 5.0, y: 5.0)
            let scaledQRImage = QRImage.transformed(by: transformScale)
            
            return UIImage(ciImage: scaledQRImage)
        }
        return nil
    }
}


// MARK: - Setup View
private extension TicketCell {
    func setupCell() {
        backgroundColor = .white
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension TicketCell {
    func addSubview() {
        
        addSubview(shopImageView)
        
//        descriptionVStack = UIStackView(arrangedSubviews: [nameLabel, locationLabel])
//        descriptionVStack.axis = .vertical
//        descriptionVStack.spacing = 2
//        descriptionVStack.alignment = .leading
//        descriptionVStack.distribution = .fillProportionally
//        contentView.addSubview(descriptionVStack)
        
    }
}

// MARK: - Setup Layout
private extension TicketCell {
    func setupLayout() {
        shopImageView.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.top.leading.trailing.equalToSuperview().inset(15)
        }
        
//        descriptionVStack.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview().inset(15)
//            make.top.equalTo(shopImageView.snp.bottom).offset(5)
//
//        }
    }
}


#Preview {
    let ticket = TicketCell()
    ticket.configure(with: TicketModel(info: "100310160100272757"))
    return ticket
}
