//
//  CustomTableViewCell.swift
//  CXCornerRadius
//
//  Created by mac on 2017/3/13.
//  Copyright © 2017年 CES. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let imgview1 = UIImageView.init(frame: CGRect.init(x: 5, y: 10, width: 20, height: 21))
    let imgview2 = UIImageView.init(frame: CGRect.init(x: 55, y: 10, width: 20, height: 21))
    let view = UIView.init(frame: CGRect.init(x: 150, y: 10, width: 40, height: 21))
    let label = UILabel.init(frame: CGRect.init(x: 250, y: 10, width: 80, height: 21))
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.imgview1)
        self.contentView.addSubview(self.imgview2)
        
        
        self.view.backgroundColor = UIColor.brown
        self.view.layer.cornerRadius = 5.0
        self.contentView.addSubview(self.view)
        
        
        self.label.layer.cornerRadius = 5
        self.label.text = "123"
        self.label.backgroundColor = UIColor.brown
        self.contentView.addSubview(self.label)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupContent (imgName: String )  {
        imgview1.image = UIImage.init(named: imgName)
        imgview2.image = UIImage.init(named: imgName)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
