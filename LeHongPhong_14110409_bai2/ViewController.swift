//
//  ViewController.swift
//  LeHongPhong_14110409_bai2
//
//  Created by PhongLe on 7/5/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView2: UITextView!
    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func downloadImage1Button(_ sender: Any) {
        let queue = DispatchQueue(label: "queue", qos: .default, attributes: .concurrent)
        queue.async {
            self.downloadImage(url: self.textView1.text, for: self.image1)
        }
    }
    @IBAction func downloadImage2Button(_ sender: Any) {
        let queue = DispatchQueue(label: "queue", qos: .default, attributes: .concurrent)
        queue.async {
            self.downloadImage(url: self.textView2.text, for: self.image2)
        }
    }
    @IBAction func downloadImageAllButton(_ sender: Any) {
        let queue = DispatchQueue(label: "queue", qos: .default, attributes: .concurrent)
        queue.async {
            self.downloadImage(url: self.textView1.text, for: self.image1)
        }
        queue.async {
            self.downloadImage(url: self.textView2.text, for: self.image2)
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        image1.image = nil
        image2.image = nil
    }
    
    // download image with URLSection
    func downloadImage(url: String, for imageView: UIImageView) {
        let url: URL = URL(string: url)!
        
        (URLSession(configuration: .default)).dataTask(with: url, completionHandler: { (data, respone, error) in
            if let imageData = data {
                DispatchQueue.main.async { () -> Void in
                    imageView.image = UIImage(data: imageData)
                }
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(action)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }).resume()
    }
}

