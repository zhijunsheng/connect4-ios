//
//  SetTests.swift
//  Connect4Tests
//
//  Created by Golden Thumb on 2020-11-10.
//

import XCTest
@testable import ConnectFourBoard

class SetTests: XCTestCase {
    
    func testConn4PieceArray() {
        var pieces: [Conn4Piece] = []
        
        pieces.append(Conn4Piece(col: 0, row: 0, player: Conn4Player.red))
        pieces.append(Conn4Piece(col: 0, row: 0, player: Conn4Player.red))
        
        XCTAssertEqual(2, pieces.count)
    }
    
    func testConn4PieceSet() {
        var pieces: Set<Conn4Piece> = []
        
        pieces.insert(Conn4Piece(col: 0, row: 0, player: Conn4Player.red))
        pieces.insert(Conn4Piece(col: 0, row: 0, player: Conn4Player.red))
        
        XCTAssertEqual(1, pieces.count)
        
        pieces.insert(Conn4Piece(col: 1, row: 0, player: Conn4Player.red))
        XCTAssertEqual(2, pieces.count)
    }
    
    func testStringSet() {
        var strs: Set<String> = Set<String>() // []
        strs.insert("Golden Thumb")
        strs.insert("You my dear friend")
        print(strs.count)
        XCTAssertEqual(2, strs.count)
    }

    func testIntSet() {
        let ints: Set<Int> = [11, 13, 17, 19, 23]
        for intNum in ints {
            print(intNum)
        }
    }

}
