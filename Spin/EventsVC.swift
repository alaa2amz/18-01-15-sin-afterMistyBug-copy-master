//
//  EventsVC.swift
//  Spin
//
//  Created by Mohamed Salah on 2/14/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import JTAppleCalendar

class EventsVC: BaseViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var viewCalendar: JTAppleCalendarView!
    @IBOutlet weak var viewCalendarParent: UIView!
    @IBOutlet weak var tableNewsletter: UITableView!
    @IBOutlet weak var tableEvents: UITableView!
    
    @IBOutlet weak var btnEvents: UIButton!
    @IBOutlet weak var btnNewsletter: UIButton!
    
    @IBOutlet weak var labelToday: UILabel!
    @IBOutlet weak var labelMonth: UILabel!
    @IBOutlet weak var LabelYear: UILabel!
    
    //MARK:- Variables
    let formatter = DateFormatter()
    var testCalendar = Calendar.current
    
    var generateInDates: InDateCellGeneration = .forAllMonths
    var generateOutDates: OutDateCellGeneration = .tillEndOfGrid
    
    var stateController : EventsStateController!
    var eventsDataSource : EventsTableDataSource!
    
    var newsletterSC : NewsletterStateController!
    var newletterTableHandler : NewsletterTableHandler!
    
    //MARK:- UI Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurePageTitle()
        configureCalendarView()
        
        viewCalendarParent.alpha = 1.0
        tableEvents.alpha = 0.0
        tableNewsletter.alpha = 0.0
        
        stateController = EventsStateController()
        eventsDataSource = EventsTableDataSource(stateCtrl: stateController, webViewDelegate: self)
        tableEvents.dataSource = eventsDataSource
        tableEvents.delegate = eventsDataSource
        tableEvents.tableFooterView = UIView()
        
        self.activityIndicator.startAnimating()
        stateController.getEvents { (error) in
            self.activityIndicator.stopAnimating()
            if error != nil {
                self.show(error: error)
            } else {
               self.viewCalendar.reloadData()
               self.tableEvents.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Configuratiuon
    func configureCalendarView () {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = testCalendar.timeZone
        formatter.locale = testCalendar.locale
        
        // Setting up your dataSource and delegate is manditory
        // ___________________________________________________________________
        viewCalendar.delegate = self
        viewCalendar.dataSource = self
        
        
        // ___________________________________________________________________
        // Registering your cells is manditory
        // ___________________________________________________________________
        viewCalendar.registerCellViewXib(file: "CalendarCellView")
        viewCalendar.cellInset = CGPoint(x: 0, y: 0)
        viewCalendar.scrollEnabled = false
        
        
        btnEvents.backgroundColor = AppColors.tab
        btnNewsletter.backgroundColor = AppColors.tab
        
        self.viewCalendar.visibleDates { (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first else {
            return
        }
        let month = testCalendar.dateComponents([.month], from: startDate).month!
        let monthName = DateFormatter().monthSymbols[(month-1) % 12]
        // 0 indexed array
        let year = testCalendar.component(.year, from: startDate)
        
        let index = monthName.index(monthName.startIndex, offsetBy: 3)
        labelMonth.text = monthName.substring(to: index)
        
        LabelYear.text = "\(year)"
        labelToday.text = getToday(fromat: "EEE, MMM dd, yyyy")
        
    }
    
    func getToday (fromat : String) -> String {
        let date = Date()
        formatter.dateFormat = fromat
        
        return formatter.string(from: date)
    }
    
    func configurePageTitle(){
        let frame : CGRect = CGRect(x: 0, y: 0, width: 100, height: 30)
        let label : UILabel = UILabel(frame: frame)
        
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Nexa Light", size: 22.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = "News and Events"
        
        self.navigationItem.titleView = label
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    
    //MARK:- IBActions
    @IBAction func btnNextMonthClicked(_ sender: UIButton) {
        self.viewCalendar.scrollToSegment(.next) {
            self.viewCalendar.visibleDates({ (visibleDates: DateSegmentInfo) in
                self.setupViewsOfCalendar(from: visibleDates)
            })
        }
        
    }
    
    @IBAction func btnLastMonthClicked(_ sender: UIButton) {
        self.viewCalendar.scrollToSegment(.previous) {
            self.viewCalendar.visibleDates({ (visibleDates: DateSegmentInfo) in
                self.setupViewsOfCalendar(from: visibleDates)
            })
        }
    }
    
    
    //MARK:- HANDLING SELECTIONS
    func handleCellTextColor(view: JTAppleDayCellView?, cellState: CellState) {
        
        guard let myCustomCell = view as? CalendarCellView  else {
            return
        }
        
        if cellState.isSelected {
            myCustomCell.dayLabel.textColor = UIColor.white
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                myCustomCell.dayLabel.textColor = UIColor.black
            } else {
                myCustomCell.dayLabel.textColor = UIColor.gray
            }
        }
    }
}
