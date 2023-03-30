//
//  ContentView.swift
//  BetterRestTutorial
//
//  Created by Danjuma Nasiru on 03/01/2023.
//

import SwiftUI

struct ContentView: View {
    var tomorrow = Date.now.addingTimeInterval(48600)
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    var body: some View {
        VStack(spacing: 50){
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25).foregroundColor(.white).padding().background(.blue)
                .frame(width: 300, height: 50)
            //we can use .labelshidden modifier to hide the text though
//            DatePicker("please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
            //Date.now... sets our date from the current date up to anything.
            DatePicker("please enter a date", selection: $wakeUp, in: Date.now...tomorrow)
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            Text(trivialExample(), format: .dateTime)
            Text(wakeUp, format: .dateTime)
            Text(trivial2(), format: .dateTime)
            Text(trivial3(), format: .dateTime)
        }
    }
    
    func exampleDates() {
        // create a second Date instance set to one day in seconds from now
        let tomorrow = Date.now.addingTimeInterval(86400)

        // create a range from those two
        let range = Date.now...tomorrow
    }
    
    func trivialExample() -> Date{
        var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? Date.now
        return date
    }
    
    func trivial2() -> Date{
        
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        
        guard let time = Calendar.current.date(from: components) else { return Date.now }
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0
        return time
    }
    
    func trivial3() -> Date{
        var timeComponent = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        
        guard var time = Calendar.current.date(from: timeComponent) else { return Date.now }
        return time
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
