//
//  CarouselDDM.swift
//  Fury
//
//  Created by Mikhail Fokin on 19/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import iCarousel

class CarouselDDM: NSObject, iCarouselDataSource, iCarouselDelegate {
    
    var items: [String] = []
    var font: UIFont
    var style: TimerStyle!
    
    init(startIndex: Int, font: UIFont = UIFont.furyPickerNumbersActive) {
        for i in startIndex...100 {
            items.append(String(format: "%02d", i))
        }
        self.font = font
    }
    
    init(items: [String], font: UIFont = UIFont.furyPickerNumbersActive) {
        self.items = items
        self.font = font
    }
    
    
    func carouselWillBeginScrollingAnimation(_ carousel: iCarousel) {
        let index = carousel.currentItemIndex
        let beforeView = carousel.itemView(at: index-1) as? UILabel
        let afterView = carousel.itemView(at: index+1) as? UILabel
        beforeView?.textColor = UIColor.white.withAlphaComponent(0.1)
        afterView?.textColor = UIColor.white.withAlphaComponent(0.1)
        let old = carousel.currentItemView as? UILabel
        old?.textColor = UIColor.white.withAlphaComponent(0.1)
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let view = carousel.currentItemView as? UILabel
        view?.textColor = .white
        if view?.text == "GO" {
            view?.textColor = style.mainColor
        }
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
            label.textColor = UIColor.white.withAlphaComponent(0.1)
        } else {
            let screenRect = UIScreen.main.bounds
            label = UILabel(frame: CGRect(x: 0, y: 0, width: screenRect.width, height: carousel.height/3))
            label.textAlignment = .center
            label.font = font
            label.textColor = UIColor.white.withAlphaComponent(0.1)
        }
        label.text = items[index]
        return label
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
}
