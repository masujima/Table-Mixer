//
//  ViewController.swift
//  TableMixer
//
//  Created by Yernar Masujima on 10.05.2023.
//

import UIKit

final class ViewController: UIViewController {
	
	private var data = Array(1...30)
	
	private lazy var dataSource: UITableViewDiffableDataSource<Int, Int> = {
		let dataSourse = UITableViewDiffableDataSource<Int, Int>(tableView: tableView) { tableView, indexPath, item in
			let cell = tableView.reuse(CustomTableViewCell.self, indexPath)
			cell.selectionStyle = .none
			cell.textLabel?.text = "\(item)"
			
			if tableView.indexPathForSelectedRow == indexPath {
				cell.accessoryType = .checkmark
			} else {
				cell.accessoryType = .none
			}
			
			return cell
		}
		
		return dataSourse
	}()
	
	private lazy var tableView: UITableView = {
		let tableView = UITableView(frame: .zero, style: .insetGrouped)
		tableView.allowsMultipleSelection = true
		tableView.delegate = self
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(CustomTableViewCell.self)
		
		return tableView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Diffable"
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Shuffle", style: .plain, target: self, action: #selector(shuffleTableView))
		view.backgroundColor = .white

		configureTableView()
		
		var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
		snapshot.appendSections([0])
		snapshot.appendItems(data)
		
		dataSource.apply(snapshot, animatingDifferences: false)
	}

	private func configureTableView() {
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	@objc
	private func shuffleTableView() {
		data.shuffle()
		
		var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
		snapshot.appendSections([0])
		snapshot.appendItems(data)
		
		dataSource.apply(snapshot, animatingDifferences: true)
	}
}

extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) {
			cell.accessoryType = .checkmark
		}
		
		let selectedIndex = indexPath.row
		let selectedNumber = data.remove(at: selectedIndex)
		data.insert(selectedNumber, at: 0)
		
		var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
		snapshot.appendSections([0])
		snapshot.appendItems(data)
		
		dataSource.apply(snapshot, animatingDifferences: true)
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
		if let cell = tableView.cellForRow(at: indexPath) {
			cell.accessoryType = .none
		}
	}
}
