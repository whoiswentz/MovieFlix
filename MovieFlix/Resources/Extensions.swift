//
//  Extensions.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 14/08/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
