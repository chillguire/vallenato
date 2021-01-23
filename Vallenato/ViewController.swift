//
//  ViewController.swift
//  Vallenato
//
//  Created by Ricardo Avendaño on 5/31/19.
//  Copyright © 2019 Ricardo Avendaño. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
	
	var player: AVAudioPlayer!
	
	let sounds = ["olvidala","noQuiero","intentalo","noFacil","1000heridas"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	@IBAction func notePressed(_ sender: UIButton) {
		playSound(selectedSound: sounds[sender.tag])
	}
	
	func playSound(selectedSound : String) {
		
		guard let url = Bundle.main.url(forResource: selectedSound, withExtension: "ogg") else {
			print("Error getting the file")
			return
		}
		
		do {

			player = try AVAudioPlayer(contentsOf: url)
			
			guard let audioPlayer = player else { return }
			
			audioPlayer.prepareToPlay()
			
			audioPlayer.play()
		} catch {
			
			print(error)
		}
	}
}

