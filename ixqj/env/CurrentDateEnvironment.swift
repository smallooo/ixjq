//
//  CurrentDateEnvironment.swift
//  ixqj
//
//  Created by Dongming He on 2023/2/16.
//

import SwiftUI

struct CurrentDateKey: EnvironmentKey {
    static let defaultValue = Date()
}

extension EnvironmentValues {
    var currentDate: Date {
        get { self[CurrentDateKey.self] }
        set { self[CurrentDateKey.self] = newValue }
    }
}
