//
//  EventsVC+CalendarDelegate.swift
//  Spin
//
//  Created by Mohamed Salah on 2/14/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import JTAppleCalendar

extension EventsVC : JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        let todayString = getToday(fromat: "yyyy MM dd")
        let startDate = formatter.date(from: todayString)!
        let endDate = formatter.date(from: "2030 01 12")!
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: 6,
                                                 calendar: testCalendar,
                                                 generateInDates: generateInDates,
                                                 generateOutDates: generateOutDates,
                                                 firstDayOfWeek: .sunday,
                                                 hasStrictBoundaries: true)
        
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        
        let myCustomCell = cell as! CalendarCellView
        myCustomCell.dayLabel.text = cellState.text
        
        if testCalendar.isDateInToday(date) {
            myCustomCell.backgroundColor = UIColor.lightGray
        } else {
            myCustomCell.backgroundColor = UIColor.clear
        }
        
        let searchIndex = stateController.isEventDate(date: date)
        myCustomCell.eventIndex = searchIndex
        
        if searchIndex != -1 {
            myCustomCell.selectedImageView.alpha = 1.0
        } else {
            myCustomCell.selectedImageView.alpha = 0.0
        }
        
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
//        handleCellSelection(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsOfCalendar(from: visibleDates)
    }
    
    func scrollDidEndDecelerating(for calendar: JTAppleCalendarView) {
        self.setupViewsOfCalendar(from: viewCalendar.visibleDates())
    }
    
}
