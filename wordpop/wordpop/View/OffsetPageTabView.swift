//
//  OffsetPageTabView.swift
//  wordpop
//
//  Created by AhmetVural on 11.05.2022.
//

import SwiftUI

struct OffsetPageTabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return OffsetPageTabView.Coordinator(parent:self)
    }
    
    init(offset: Binding<CGFloat>,@ViewBuilder content: @escaping() -> Content){
        self.content = content()
        self._offset = offset
    }
    func makeUIView(context: Context) -> UIScrollView {
        let scrollview = UIScrollView()
        
        //extracting swiftui view
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
            //clearing bg
        hostview.view.backgroundColor = .clear
        
        let constraints = [
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
 
            //if you are using vertical paging dont declare height const
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
 
        ]
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        //ennable pagin
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        //setting delegate
        scrollview.delegate = context.coordinator

        return scrollview
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        //need upadte only when off set changed manually
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
           // print("updating")
            uiView.setContentOffset(CGPoint(x:offset, y:0), animated: true)
            
        }
    }
    class Coordinator: NSObject, UIScrollViewDelegate{
        
        var parent: OffsetPageTabView
        init(parent:OffsetPageTabView) {
            self.parent = parent
        }
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}
