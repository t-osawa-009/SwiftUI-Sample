//
//  ViewController.swift
//  UIKit-Sample
//
//  Created by dev on 2019/07/23.
//  Copyright © 2019 dev. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private var numbers: [Int] = [1, 2, 3, 4, 5] {
        didSet {
            guard oldValue != numbers else {
                return
            }
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Number list"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        
        let addButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addButtonTapped(_:)))
        navigationItem.leftBarButtonItem = addButton
        let removeButton = UIBarButtonItem(title: "Remove", style: .done, target: self, action: #selector(removeButtonTapped(_:)))
        navigationItem.rightBarButtonItem = removeButton
    }
    
    @objc func addButtonTapped(_ sender: Any) {
        numbers.append(numbers.count + 1)
    }
    
    @objc func removeButtonTapped(_ sender: Any) {
        guard !numbers.isEmpty else {
            return
        }
        numbers = numbers.dropLast()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let item = numbers[indexPath.row]
        cell.textLabel?.text = item.description
        
        return cell
    }
}

