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
    private let qrImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        qrImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        qrImageView.layer.cornerRadius = 15
        qrImageView.clipsToBounds = true

    }
    
    // MARK: - Public methods
    func configure(with ticket: TicketModel) {
        let QRimage = generateQRCode(from: ticket.info)
        guard let image = QRimage else { return }
        qrImageView.image = image
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
        layer.cornerRadius = 15
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.7
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 3
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension TicketCell {
    func addSubview() {
        
        addSubview(qrImageView)
        
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
        qrImageView.snp.makeConstraints { make in
            make.height.width.equalTo(200)
            make.bottom.equalToSuperview().inset(70)
            make.centerX.equalToSuperview()
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
    ticket.snp.makeConstraints { make in
        make.height.equalTo(500)
        make.width.equalTo(300)
    }
    return ticket
}
