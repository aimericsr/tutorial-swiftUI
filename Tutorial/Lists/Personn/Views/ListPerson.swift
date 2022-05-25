//
//  PeopleView.swift
//  PeopleView
//
//  Created by Tunde on 27/07/2021.
//

import SwiftUI

struct ListPerson: View {
    @Environment(\.refresh) private var refreshAction
    @Environment(\.isSearching) var isSearching
    
    @ObservedObject var vm: PeopleVM
    @Binding var query: String
    
    var body: some View {
        List {
            Section {
                VStack {
                    Text("Pull me down to generate a new person")
                        .multilineTextAlignment(.center)
                        .allowsTightening(true)
                        .font(.system(size: 16, weight: .bold))
                    .padding()
                    EditButton()
                }
            } header: {
                Label("Profile", systemImage: "person")
                    .symbolVariant(.fill)
                    .foregroundStyle(.blue)
            } footer: {
                Text("Another footer")
            }
            .headerProminence(.increased)
            
            Section("personn") {
                ForEach(vm.filterdData) { person in
                    generatelistItem(person: person)
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role: .destructive) {
                                vm.selectedPerson = person
                                vm.showConfirmation.toggle()
                            } label: {
                                Label("Delete", systemImage: "trash")
                                    .symbolVariant(.circle)
                            }
                            Button {
                                print("tapped on switpe")
                            } label: {
                                Label("Flag", systemImage: "flag")
                            }
                            .tint(.green)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: !person.isFavorite) {
                            if !person.isFavorite {
                                Button {
                                    print(vm.people)
                                    vm.addToFavorite(for: person)
                                } label: {
                                    if person.isFavorite {
                                        Label("Favorite", systemImage: "star.fill")
                                    } else {
                                        Label("Favorite", systemImage: "cross")
                                        
                                    }
                                }
                            }
                            
                            
                        }
                }
                .onDelete { indexSet in
                    vm.deleteWithIndex(indexSet)
                }
                .onMove { previousIndexSet, newIndex in
                    vm.move(from: previousIndexSet, to: newIndex)
                }
            }
            
            if !vm.favouritesItems.isEmpty {
                Section("Favorites items"){
                    ForEach(vm.favouritesItems) { person in
                        generatelistItem(person: person)
                    }
                }
            }
        }
        .confirmationDialog("Delete person",
                            isPresented: $vm.showConfirmation,
                            titleVisibility: .visible,
                            presenting: vm.selectedPerson) { item in
            
            Button(role: .destructive) {
                vm.delete(item)
            } label: {
                Label("Delete", systemImage: "trash")
                    .symbolVariant(.circle)
            }

        } message: { item in
            Text("Ary you sur you want to delete \(item.name)?")
        }
        .listStyle(.automatic)
        .navigationTitle("Random Person")
        .searchable(text: $query,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Find a person") {
            if vm.filterdData.isEmpty {
                let randomName = vm.people.randomElement()!.name
                Text("Maybe you're looking for \(randomName) ?")
                    .searchCompletion(randomName)
            }
        }
                    .onAppear{
                        vm.search()
                        Task {
                            await vm.generatePerson()
                        }
                    }
                    .onSubmit(of: .search) {
                        vm.search(with: query)
                    }
        //            .onChange(of: query, perform: { newQuery in
        //                vm.search(with: newQuery)
        //            })
                    .toolbar {
                        refreshContent
                    }
                    .overlay(content: {
                        if isSearching && vm.filterdData.isEmpty {
                            EmptyViewSearch(vm: vm,
                                            query: $query)
                        }
                    })
    }
    
    @ViewBuilder
    var refreshContent: some View {
        if let refreshAction = refreshAction {
            
            if vm.isLoading {
                ProgressView()
            } else {
                Button {
                    Task {
                        await refreshAction()
                    }
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
    
    func generatelistItem(person: Person) -> some View {
        Text("\(person.gender.rawValue) \(person.name)")
            .listRowSeparator(.hidden)
            .listRowBackground(Color.mint)
            .listRowInsets(.init(top: 0, leading: 60, bottom: 0, trailing: 0))
    }
    
    
    
}

struct PeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ListPerson(vm: PeopleVM(), query: .constant("df"))
    }
}
