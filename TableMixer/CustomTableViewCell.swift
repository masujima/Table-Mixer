//
//  CustomTableViewCell.swift
//  TableMixer
//
//  Created by Yernar Masujima on 11.05.2023.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
	}
	
	override func updateConfiguration(using state: UICellConfigurationState) {
		super.updateConfiguration(using: state)
		
		
	}
}
