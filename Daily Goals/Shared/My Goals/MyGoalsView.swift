//
//  ContentView.swift
//  Shared
//
//  Created by alex.zarr on 2/13/21.
//

import SwiftUI
import CoreData

struct MyGoalsView: View {
    @FetchRequest(fetchRequest: TLGoal.fetchRequest(), animation: .default)
    private var goals: FetchedResults<TLGoal>
    
    @State private var showingAddNew = false
    
    private var columns: [GridItem] { [GridItem(.adaptive(minimum: 100, maximum: 160), spacing: 10.0)] }

    var body: some View {
        NavigationView {
            Group {
                if goals.isEmpty {
                    Text("No goals yet! 😞")
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10.0) {
                            ForEach(goals) { goal in
                                MyGoalsItemView(goal: goal)
                            }
                        }
                        .padding(10)
                    }
                }
            }
            .navigationTitle("Goals")
            .navigationBarItems(trailing: addNewButton)
        }
        .sheet(isPresented: $showingAddNew) {
            AddNewGoalView()
        }
    }
    
    private var addNewButton: some View {
        Button(action: {
            showingAddNew = true
        }, label: {
            Text("New Goal")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyGoalsView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
