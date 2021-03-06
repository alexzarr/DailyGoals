//
//  AddNewGoalView.swift
//  Daily Goals
//
//  Created by alex.zarr on 3/4/21.
//

import SwiftUI

struct AddNewGoalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = AddNewGoalViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .padding()
                })
                Spacer()
                Button(action: {
                    if !viewModel.title.isEmpty {
                        viewModel.save()
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Create")
                        .bold()
                        .padding()
                })
            }
            .overlay(Divider(), alignment: .bottom)
            Form {
                Section {
                    TextField("Title", text: $viewModel.title)
                }
                Section(header: Text("Icon")) {
                    Picker("Icon", selection: $viewModel.icon) {
                        ForEach(viewModel.icons, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
            }
        }
    }
}

struct AddNewGoalView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewGoalView(viewModel: AddNewGoalViewModel(dataManager: DataManager(persistenceController: .preview)))
    }
}
