//
//  DateFormatter.swift
//  Continuum
//
//  Created by anthony byrd on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation

extension Date {
    func formateDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
