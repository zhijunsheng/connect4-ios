//
//  Conn4Board.swift
//  ConnectFourBoard
//
//  Created by Golden Thumb on 2020-11-13.
//

import Foundation

struct Conn4Board: CustomStringConvertible {
    
    var description: String {
        
        var desc = ""
        
        for row in 0..<6 {
            desc += "\(5 - row)"
            for _ in 0..<7 {
                desc += " ."
            }
            desc += "\n"
        }
        desc += "  0 1 2 3 4 5 6"
        
        return desc
    }
    
    
}
