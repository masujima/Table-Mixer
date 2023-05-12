//
//  UITableViewCell+Extension.swift
//  TableMixer
//
//  Created by Yernar Masujima on 11.05.2023.
//

import UIKit

extension UITableViewCell {
	
	static var reuseIdentifier: String {
		String(describing: self)
	}
	
	var reuseIdentifier: String {
		type(of: self).reuseIdentifier
	}
}
