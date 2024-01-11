//
//  ExtensionArray.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 24/12/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

extension Array where Element: Hashable {
 
    func removeDuplicates() -> [Element] {
        var seen = Set<Element>()
        return filter{seen.insert($0).inserted}
    }
}




