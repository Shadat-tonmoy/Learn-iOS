//
//  SwiftUIEnvironmentObject.swift
//  SwiftUIText
//
//  Created by Tonmoy on 31/3/23.
//

import SwiftUI

struct Device : Identifiable{
    let id : String = UUID().uuidString
    let name : String
    let quantity : Int
}


class DeviceViewModel : ObservableObject{
    
    @Published var deviceList : [Device] = []
    @Published var isLoading : Bool = false
    
    init(){
        fetchDeviceList()
    }
    
    func fetchDeviceList() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: {
            
            self.deviceList.append(Device(name: "iPhone", quantity: 10))
            self.deviceList.append(Device(name: "iPad", quantity: 8))
            self.deviceList.append(Device(name: "iMac", quantity: 15))
            self.deviceList.append(Device(name: "Macbook", quantity: 12))
            self.isLoading = false
        
        })
        
    }
    
}

struct SwiftUIEnvironmentObject: View {
    
    @StateObject var viewModel : DeviceViewModel = DeviceViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.deviceList, rowContent: { device in
                NavigationLink(destination : DeviceDetailsScreen(device: device, viewModel: viewModel)){
                    Text(device.name)
                }
                
            })
            .navigationTitle("Devices")
        }
    }
}

struct DeviceDetailsScreen : View{
    
    let device : Device
    
    @StateObject var viewModel : DeviceViewModel
    
    var body: some View{
        
        ZStack{
            NavigationLink(destination : DeviceQuantityScreen(viewModel: viewModel)) {
                VStack{
                    VStack {
                        Text("\(device.quantity)")
                            .font(.custom("", size: 40))
                            .foregroundColor(.white)
                        
                        Text("\(device.name)")
                            .font(.custom("", size: 50))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .padding(.vertical,50)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.purple)
                            
                    )
                    .padding()
                    .padding(.horizontal)
                    Spacer()
                        
                }
            }
        }.navigationTitle(device.name)
    }
}

struct DeviceQuantityScreen : View {
    
    @StateObject var viewModel : DeviceViewModel
    
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("Hello")
                    .foregroundColor(.purple)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .padding()
                            .shadow(radius: 5)
                            
                    )
                
                Spacer()
                
                List{
                    
                    ForEach(viewModel.deviceList, content: { device in
                        Text(device.name)
                    })
                }
            }
        }
        .navigationTitle("Quantity")
    }
}

struct SwiftUIEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIEnvironmentObject()
    }
}
