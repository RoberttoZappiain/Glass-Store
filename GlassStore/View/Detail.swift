//
//  Detail.swift
//  GlassStore
//
//  Created by Robertto Flores on 23/11/21.
//

import SwiftUI

struct Detail: View {
    @Binding var selectedItem: Item
    @Binding var show: Bool
    @State var loadContent = false
    var animation: Namespace.ID
    @State var selectedColor : Color = Color("p1")
    
    var body: some View {
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical: .init(), content: {
            VStack{
                //NAVBAR DE VISTA HIJO
                HStack(spacing: 25){
                    Button(action: {
                        //CON ESTO SE REGRESA A LA VIEW MADRE O SE CIERRA ES LO MISMO
                        withAnimation(.spring()){show.toggle()}
                    }){
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                        Spacer()
                    Button(action: {}){
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {}){
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                //
                
                //STACK CREADO Y HEREDA DATOS DEL MODELO **item**
                VStack (spacing:10){
                    Image(selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    
                    Text(selectedItem.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Text(selectedItem.subTitle)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    HStack{
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        
                        Spacer()
                        
                        Button(action: {}){
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)

                        
                        

                    }
                    .padding()
                    //
                }
                .padding(.top,35)
                .background(
                    Color(selectedItem.image)
                        //SE MANDA A LLAMAR LA FUNCION PARA LA FIGURA DE BACKGROUND DE LA CARD
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                        //
                )
                .cornerRadius(15)
                .padding()
                
                //TARJETA DE DESCUENTO
                VStack{
                    VStack(alignment: .leading,spacing: 8){
                        Text("Oferta Exclusiva!")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Text("Caja + lentes por $35(Esta al 50% de descuento)")
                            .foregroundColor(.gray)
                        
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                    .background(Color("p3"))
                    .cornerRadius(15)
                    //
                    
                    //CHECKBOX DE COLORES
                    VStack(alignment: .leading, spacing: 10){
                        Text("Color")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        HStack(spacing:15){
                            ForEach(1...4,id: \.self){i in
                                ZStack{
                                    Color("p\(i)")
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation{selectedColor = Color ("p\(i)")
                                            }
                                        }
                                    
                                    //CHECKED COLOR
                                    if selectedColor == Color ("p\(i)"){
                                        Image (systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                            }
                            Spacer(minLength: 0)
                        }

                    }
                    .padding()
                    //
                    
                    Spacer(minLength: 15)
                    //BOTONES CENTRADOS BUTTOM
                    Button(action: {}){
                        Text("PRUEBAME EN 3D")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                        background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.black,lineWidth: 1)
                        )
                    }
                    
                    Button(action: {}){
                        Text("AGREGAR AL CARRITO")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.black)
                            .cornerRadius(15)
                    }
                    .padding(.vertical)
                    //
                }
                .padding([.horizontal, .bottom])
                .frame(height:loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                Spacer(minLength: 0)
            }

        })
            .onAppear{
                withAnimation(Animation.spring().delay(0.45)){
                    loadContent.toggle()
                }
            }
        
      
    }
}

