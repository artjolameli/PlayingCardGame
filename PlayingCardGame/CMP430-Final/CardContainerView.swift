//
//  CardContainerView.swift
//  SetGame
//
//  Created by Artjola Meli on 12/16/20.
//  Copyright © 2020 Artjola Meli. All rights reserved.
//

import UIKit

class CardContainerView: UIView
{
    var isAnimated = true
    
    override func layoutSubviews()
    {
        let grid = Grid(for: self.frame, withNoOfFrames: self.subviews.count, forIdeal: 0.8)
        
        for index in self.subviews.indices{
            if var frame = grid[index]
            {
                frame.size.width -= 5
                frame.size.height -= 5
                
                var delay = 0.0
                
                if isAnimated
                {
                    if isAnimated {
                        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 1,
                                                                       delay: delay,
                                                                       options: [.curveEaseInOut],
                                                                       animations: {
                                                                        self.subviews[index].frame = frame
                                                                        
                                                                        delay += 3.0
                                                                    
                    })
                }else{
                     self.subviews[index].frame = frame
                }
            }
        }
    }
}
}
