//
//  ScrennFiveCollectionViewCell.swift
//  Suitmedia
//
//  Created by irwan on 10/05/20.
//  Copyright © 2020 irwan. All rights reserved.
//

import UIKit

class ScrennFiveCollectionViewCell: UICollectionViewCell {

    let borderColor : UIColor = UIColor( red: 204.0, green: 204.0, blue:204.0, alpha: 1.0 )
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.layer.backgroundColor = UIColor.clear.cgColor
            mainView.layer.isOpaque = false
        }
    }
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subView: UIView! {
        didSet {
            subView.layer.borderColor = borderColor.cgColor
            subView.layer.shadowColor = UIColor.black.cgColor
            subView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            subView.layer.shadowOpacity = 0.2
            subView.layer.shadowRadius = 15.0
            subView.layer.cornerRadius = 15.0
            subView.layer.masksToBounds = true

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    class func nib() -> UINib {
        return UINib(nibName: "ScrennFiveCollectionViewCell", bundle: nil)
    }
}
