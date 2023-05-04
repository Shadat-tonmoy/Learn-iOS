//
//  SoundTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/4/23.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance : SoundManager = SoundManager()
    
    private var player : AVAudioPlayer?
    
    func playSound(sound : Sound){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {
            return
            
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print("Error playing audio \(error)")
        }
    }
}

enum Sound : String{
    case TADA = "tada"
    case QUACK = "quack"
    
}

struct SoundTest: View {
    
    var body: some View {
        VStack{
            Text("Play Sound 1")
                .padding()
                .padding(.horizontal)
                .foregroundColor(.white)
                .font(.headline)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.orange)
                        
                ).onTapGesture {
                    SoundManager.instance.playSound(sound: Sound.TADA)
                }
            
            Text("Play Sound 2")
                .padding()
                .padding(.horizontal)
                .foregroundColor(.white)
                .font(.headline)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.green)
                        
                ).onTapGesture {
                    SoundManager.instance.playSound(sound: Sound.QUACK)
                    
                }
        }
    }
}

struct SoundTest_Previews: PreviewProvider {
    static var previews: some View {
        SoundTest()
    }
}
