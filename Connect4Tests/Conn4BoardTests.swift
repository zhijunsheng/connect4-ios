//
//  Conn4BoardTests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-13.
//

import XCTest
@testable import ConnectFourBoard

class Conn4BoardTests: XCTestCase {
    
    func testDropAt() {
        var conn4Board = Conn4Board()
        
        conn4Board.dropAt(col: 3, player: .red)
        conn4Board.dropAt(col: 3, player: .yellow)
        conn4Board.dropAt(col: 3, player: .red)
        conn4Board.dropAt(col: 3, player: .red)
        
        print(conn4Board)
        XCTAssertEqual(.red, conn4Board.pieceAt(col: 3, row: 3)?.player)
    }

    func testDescription() {
        var conn4Board = Conn4Board()
        XCTAssertEqual(0, conn4Board.piecesBox.count)
        
        conn4Board.dropAt(col: 3, player: .red)
        conn4Board.dropAt(col: 5, player: .yellow)

        
        XCTAssertEqual(2, conn4Board.piecesBox.count)
        XCTAssertNotNil(conn4Board.pieceAt(col: 3, row: 0))
        XCTAssertEqual(.red, conn4Board.pieceAt(col: 3, row: 0)?.player)
    }

}
