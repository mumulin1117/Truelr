//
//  EchoFragment.swift
//  Truelrbuios
//
//  Created by mumu on 2025/10/22.
//

import UIKit

struct EchoFragment: Identifiable {
    let id: UUID
    let artistName: String
    let pulseTag: String
    let resonanceTone: Double // 共鸣频率
    let words: String
    let timeStamp: Date
}
