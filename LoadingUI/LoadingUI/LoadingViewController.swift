//
//  LoadingViewController.swift
//  LoadingUITest
//
//  Created by Alexander Supe on 28.02.20.
//  Copyright © 2020 Alexander Supe. All rights reserved.
//

import UIKit
import SwiftyGif

class LoadingViewController: UIViewController {
    open var usingCustomGif = false
    open var gifData: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    open func setUp() {
        do {
            if usingCustomGif {
                guard let gifData = gifData else { throw NSError(domain: "some.error", code: 0, userInfo: nil) }
                let gif = try UIImage(gifData: gifData)
                let imageview = UIImageView(gifImage: gif, loopCount: -1)
                imageview.frame = view.bounds
                view.addSubview(imageview)
            } else {
                let gif = try UIImage(gifData: GifData.data)
                let imageview = UIImageView(gifImage: gif, loopCount: -1)
                imageview.frame = view.bounds
                view.addSubview(imageview)
            }
        } catch {
            NSLog("\(error)")
        }
    }
}

