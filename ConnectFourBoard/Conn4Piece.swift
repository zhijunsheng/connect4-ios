//
//  Conn4Piece.swift
//  ConnectFourBoard
//
//  Created by Golden Thumb on 2020-11-10.
//

import Foundation

struct Conn4Piece: Hashable {
    let col: Int
    let row: Int
    let player: Conn4Player
}
