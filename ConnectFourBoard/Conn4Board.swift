//
//  Conn4Board.swift
//  ConnectFourBoard
//
//  Created by Golden Thumb on 2020-11-13.
//

import Foundation

struct Conn4Board: CustomStringConvertible {
    private(set) var piecesBox: Set<Conn4Piece> = []
    
    mutating func dropAt(col: Int, player: Conn4Player) {
        // for the first drop only
        let droppedPiece = Conn4Piece(col: col, row: 0, player: player)
        piecesBox.insert(droppedPiece)
    }
    
    func pieceAt(col: Int, row: Int) -> Conn4Piece? {
        for piece in piecesBox {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        return nil
    }
    
    var description: String {
        var desc = ""
        
        for i in 0..<6 {
            desc += "\(5 - i)"
            for col in 0..<7 {
                if let piece = pieceAt(col: col, row: 5 - i) {
                    desc += piece.player == .red ? " r" : " y"
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        desc += "  0 1 2 3 4 5 6"
        
        return desc
    }
}
