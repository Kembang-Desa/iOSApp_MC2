//
//  FileManager.swift
//  WatchAppItungin WatchKit Extension
//
//  Created by Ditha Nurcahya Avianty on 20/07/22.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
