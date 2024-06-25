import SwiftUI


struct Task {
    var id = UUID()
    var task : String
    var isdone : Bool = false
}

struct ContentView: View {
    @State private var newTask : String = ""
    @State private var taskArr : [String] = UserDefaults.standard.stringArray(forKey: "taskArr") ?? []
    @State private var isAppear : Bool = false
    
    @State private var deletedArr : [String] = UserDefaults.standard.stringArray(forKey: "deletedArr") ?? []
    @State private var isChanging : Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Button {
                            isAppear = true
                        } label : {
                            Image(systemName: "text.justify")
                                .resizable()
                                .frame(width: 20, height: 15)
                                .foregroundColor(.blue)
                        }
                        
                        TextField("What do you want to do?..", text: $newTask)
                        
                        Button {
                            if newTask == "" {
                                // add sound
                            }
                            else {
                                taskArr.append(newTask)
                                UserDefaults.standard.set(taskArr, forKey: "taskArr")
                                newTask = ""
                            }
                        } label : {
                            Text("Add task")
                                .font(.system(size: 12))
                                .padding(7)
                                .bold()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }.padding()
                        .background(Color("background"))
                        .cornerRadius(10)
                    
                    if taskArr != [] {
                        List {
                            
                                ForEach (taskArr.indices, id: \.self) {
                                    taskIndex in
                                    var isChecked : String = "app.badge.checkmark.fill"
                                    HStack {
                                        
                                        Image(systemName: "app.badge.checkmark")
                                            .foregroundColor(Color.green)
                                            .onTapGesture{
                                                
                                            }
                                            
                                        
                                        
                                        
                                        Text("\(taskArr[taskIndex])")
                                        Spacer()
                                        Button{
                                            
                                            deletedArr.append(taskArr[taskIndex])
                                            UserDefaults.standard.set(deletedArr, forKey: "deletedArr")
                                            
                                            
                                            taskArr.remove(at: taskIndex )
                                            UserDefaults.standard.set(taskArr, forKey: "taskArr")
                                        } label : {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }
                                        
                                    }.padding(5)
                                    .cornerRadius(10)
                                    
                                    
                                }
                            
                        }.cornerRadius(10)
                    }
                    else {
                        Spacer()
                        Text("Your task list is empty")
                            .bold()
                        Spacer()
                    }
                    
                    Spacer()
                    
                    
                    
                }
                
                .padding()
                
                
                if isAppear {
                    ZStack {
                        List{
                            NavigationLink(destination: DeletedArrList() ) {
                                Text("Deleted Task")
                                    .foregroundColor(Color.black)
                            }
                            NavigationLink(destination: DeletedArrList() ) {
                                Text("Completed Task")
                                    .foregroundColor(Color.black)
                            }
                            NavigationLink(destination: DeletedArrList() ) {
                                Text("Pending Task")
                                    .foregroundColor(Color.black)
                            }
                        }.background(Color.blue)
                        
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.black)
                            .offset(x: 80, y: -230)
    //                        .padding(.leading, 110)
                            .onTapGesture{
                                isAppear = false
                            }
                            
                        
                    }.frame(width: 200, height: 500)
                        .cornerRadius(10)
                        .offset(x: -80, y: -120)
                        .animation(Animation.interactiveSpring(), value: isAppear)
                        
                        
                        
                }
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
