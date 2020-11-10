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

    override func draw(_ rect: CGRect) {
        drawBoard()
    }
    
    func drawBoard() {
        for j in 0 ..< 6 {
            for i in 0 ..< 7 {
                let circle = UIBezierPath(arcCenter: CGPoint(x: originX + CGFloat(i) * cellSide, y: originY + CGFloat(j) * cellSide), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
                
                UIColor.white.setFill()
                circle.fill()
                
                circle.stroke()
            }
        }
    }
}
