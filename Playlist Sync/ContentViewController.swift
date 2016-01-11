//
//  ContentViewController.swift
//  Playlist Sync
//
//  Created by Benjamin Congdon on 1/11/16.
//  Copyright © 2016 Benjamin Congdon. All rights reserved.
//

import Cocoa

class ContentViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBAction func syncPressed(sender: NSButton) {
        data.append("x")
        tableView.reloadData()
        let panel:NSOpenPanel = NSOpenPanel()
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        let delegate:AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        delegate.closePopover()
        if panel.runModal() != NSModalResponseOK {return}
        delegate.openPopover()
        print(panel.URLs.last)
    }
    
    @IBAction func goToPreferences(sender: AnyObject) {
        let delegate:AppDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        delegate.openPreferences()
    }
    
    @IBOutlet weak var tableView: NSTableView!
    
    var data = ["test","1","2","3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.makeViewWithIdentifier((tableColumn?.identifier)!, owner: self) as! NSTableCellView
        cellView.textField?.stringValue = data[row]
        return cellView
    }
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return data.count
    }

}
