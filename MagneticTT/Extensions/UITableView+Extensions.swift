//
//  UITableView+Extensions.swift
//  MagneticTT
//
//  Created by Дмитрий Процак on 02.04.2024.
//

import UIKit

// MARK: - Extension UITableView

extension UITableView {
    
    // MARK: - Methods
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        let reuseIdentifier = String(describing: T.self)
        register(T.self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<T: UITableViewCell>(_ cell: T.Type, completion: ((T) -> Void)? = nil) -> T {
        let reuseIdentifier = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: reuseIdentifier) as? T else {
            return T()
        }
        completion?(cell)
        return cell
    }
}
