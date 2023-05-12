//
//  UITableView+Extension.swift
//  TableMixer
//
//  Created by Yernar Masujima on 11.05.2023.
//

import UIKit

extension UITableView {
	
	func register<T: UITableViewCell>(_ type: T.Type) {
		register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
	}
	
	func reuse<T: UITableViewCell>(_ type: T.Type, _ indexPath: IndexPath) -> T {
		dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
	}
}
