//
//  AllDetailCell.swift
//  EnvisoTask
//
//  Created by Rajat Pal on 27/01/23.
//

import UIKit

class AllDetailCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactDetailLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var couponLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with data: AllDetail) {
        let customer = data.customers
        
        nameLabel.text = customer.name
        contactDetailLabel.text = customer.email + ", " + customer.mobile
        
        priceLabel.text = String(data.order.oderAmount) + "/-"
        
        productCountLabel.text = ": " + String(data.products.count)
        couponLabel.text = ": " + data.coupons.couponCode
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
