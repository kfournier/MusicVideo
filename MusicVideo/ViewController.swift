//
//  ViewController.swift
//  MusicVideo
//
//  Created by Kevin Fournier on 2016-03-30.
//  Copyright © 2016 Kevin Fournier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//call api
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    func didLoadData(result:String) {

        let alert = UIAlertController(title: (result), message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "ok", style: .Default) { action -> Void in
            //do something if u want
    }

        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}