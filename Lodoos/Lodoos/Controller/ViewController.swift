//
//  ViewController.swift
//  Lodoos
//
//  Created by Onur Başdaş on 22.09.2022.
//

import UIKit
import FirebaseRemoteConfig
import Network

class ViewController: UIViewController {
    
    @IBOutlet var lodoosLabel: UILabel!
    let monitor = NWPathMonitor()
    
    var remoteConfig = FirebaseRemoteConfig.RemoteConfig.remoteConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRemoteConfigDefaults()
        fetchRemoteConfig()
        displayNewValues()
        networkControl()
    }
    
    func networkControl() {
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
      
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("**** We're connected!")
            } else {
                print("**** No connection.")
                self.showAlert(title: "Error", message: "No connection!")
            }

            print(path.isExpensive)
        }
    }
    
    func setupRemoteConfigDefaults() {
        let defaultValue = ["label_text": "Hello world!" as NSObject]
        remoteConfig.setDefaults(defaultValue)
    }
    
    func fetchRemoteConfig() {
        remoteConfig.fetch(withExpirationDuration: 0) { [unowned self] (status, error) in
            guard error == nil else { return }
            print("Got the value from Remote Config!")
            remoteConfig.activate(completion: nil)
            self.displayNewValues()
        }}
    
    func displayNewValues() {
        let newLabelText = remoteConfig.configValue(forKey: "label_text").stringValue ?? ""
        lodoosLabel.text = newLabelText
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.performSegue(withIdentifier: "toMainSegue", sender: nil)
        }
    }
}

