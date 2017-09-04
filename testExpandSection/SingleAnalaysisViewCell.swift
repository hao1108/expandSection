//
//  SingleAnalaysisViewCell.swift
//  TtDpsGSwift
//
//  Created by T814 on 2017/9/1.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class SingleAnalaysisViewCell: UITableViewCell {
    
    var MyView: UIView!
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        MyView = UIView()
        MyView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        MyView.backgroundColor = UIColor.yellow
        contentView.addSubview(MyView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
