//
//  SettingsView.swift
//  RepoFinder 2.0
//
//  Created by Jacob Singer on 12/10/19.
//  Copyright © 2019 Jacob Singer. All rights reserved.
//

import SwiftUI

struct ModalView: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {

        VStack {

            Text("RepoFinder")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding(.top, 60)
            .foregroundColor(Color("jpurple"))

            Text("v1.0")

            VStack(alignment: .center) {

            Text("Developed by HomemadeToast")
            Text("Assisted by sotupsodotnos")
            Text("Database provided by iOS Repo Updates")
            Text("Assisted by @QuixThe2nd")
            Text("Logo and icon designed by @DaveWijk")
            Text("Assisted by@AplAddict :P")
                Text("Copyright © 2020 HomemadeToast").font(.footnote).padding(.top, 30)

                VStack(alignment: .center) { Image("RFIcon").resizable().frame(width: 350, height: 350).cornerRadius(15).padding(.top, 40)
                }

            }.padding(.top, 20)







            Spacer()
            // 3. Add a button with the following action
            Button(action: {
                print("dismisses form")
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss").foregroundColor(Color("jpurple"))
                }.padding(.bottom, 50)

    }
    }
}



struct SettingsView: View {
@State private var show_modal: Bool = false
let url = URL(string: "https://twitter.com/HomemadeToast57")
    @State private var isActive: Bool = false

    @EnvironmentObject var networkManager: NetworkManager

    var body: some View {

        NavigationView {

            VStack {
                VStack {
                    VStack{
                        Text("RepoFinder")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 60)
                            .foregroundColor(Color("jpurple"))

                        Text("v1.02")
                        

                        HStack {
                            Text("Developed by HomemadeToast")


                            Button(action: {
                                UIApplication.shared.open(self.url!)
                            }) {
                                Image("twitter").resizable().frame(width: 32, height: 25)
                                .scaledToFit()
                            }
                        }.padding(.top, 50)
                    }


                    VStack{
                        Toggle(isOn: $networkManager.showLocal) {
                            Text("More Repos")
                        }.padding().background(Color("SettingsOutline")).cornerRadius(12)
                        
                    }.padding()

                    VStack{
                        Button(action: {
                            print("Button Pushed")
                            self.show_modal = true
                        }) {
                            Text("Credits").foregroundColor(Color("jpurple"))
                        }.sheet(isPresented: self.$show_modal) {
                             ModalView()
                            }

                    }.padding()


                    VStack{
                        Spacer()
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
