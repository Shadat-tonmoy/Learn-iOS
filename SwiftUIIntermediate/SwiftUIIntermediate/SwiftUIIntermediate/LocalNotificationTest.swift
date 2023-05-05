//
//  LocalNotificationTest.swift
//  SwiftUIIntermediate
//
//  Created by Shadat Tonmoy on 5/5/23.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let instance : NotificationManager = NotificationManager()
    
    func requestAuthorization() {
        
        let options : UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR : \(error)")
            } else {
                print("SUCCESS")
            }
        }
        
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is a test notification"
        content.subtitle = "This was so easy to implement"
        content.sound = .default
        content.badge = 1
        
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
        let notificationRequest = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: notificationTrigger)
        
        UNUserNotificationCenter.current().add(notificationRequest)
        
        
    }
    
    
}


struct LocalNotificationTest: View {
    var body: some View {
        
        VStack{
            NotificationButton(title: "Prompt Notification")
                .onTapGesture {
                    NotificationManager.instance.requestAuthorization()
                }
            
            NotificationButton(title: "Request Notification")
                .onTapGesture {
                    NotificationManager.instance.scheduleNotification()
                }
            
        }
        .onAppear{
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        
        
    }
}

struct NotificationButton : View {
    let title : String
    var body: some View {
        Text(title)
            .font(.headline)
            .padding()
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.orange)
            )
    }
}

struct LocalNotificationTest_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationTest()
    }
}
