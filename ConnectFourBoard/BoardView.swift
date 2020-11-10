//
//  BoardView.swift
//  ConnectFourBoard
//
//  Created by Golden Thumb on 2020-10-29.
//

import UIKit

class BoardView: UIView {
    let originX: CGFloat = 66
    let originY: CGFloat = 121
    let radius: CGFloat = 40
    let cellSide: CGFloat = 100
    
    var shadowPiecesBox: Set<Conn4Piece> = []
    

    override func draw(_ rect: CGRect) {
        // tmp code
        shadowPiecesBox.insert(Conn4Piece(col: 0, row: 0, player: .red))
        
        drawBoard()
        drawPieces()
    }
    
    func drawPieces() {
        for piece in shadowPiecesBox {
            drawCircleAt(col: piece.col, row: piece.row, color: piece.player == Conn4Player.red ? UIColor.red : UIColor.yellow)
        }
    }
    
    func drawBoard() {
        for row in 0 ..< 6 {
            for col in 0 ..< 7 {
                drawCircleAt(col: col, row: row, color: UIColor.white)
            }
        }
    }
    
    func drawCircleAt(col: Int, row: Int, color: UIColor) {
        let circle = UIBezierPath(arcCenter: CGPoint(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        color.setFill()
        circle.fill()
        
        circle.stroke()
    }
}
