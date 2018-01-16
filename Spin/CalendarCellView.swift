//
//  CalendarCellView.swift
//  Spin
//
//  Created by Mohamed Salah on 2/14/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarCellView: JTAppleDayCellView {
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!

    //MARK: - variables
    var eventIndex = -1
}
