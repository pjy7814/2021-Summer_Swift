//
//  ContentView.swift
//  AlbumsApp
//

import SwiftUI

extension Album: Identifiable {
    var id: String { albumTitle }
}

extension Color{
    static func argb(_ argb: UInt32) -> Color{
        let a = Double(argb >> 24 & 0xFF) / 255.0
        let r = Double(argb >> 16 & 0xFF) / 255.0
        let g = Double(argb >> 8 & 0xFF) / 255.0
        let b = Double(argb & 0xFF) / 255.0
        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

struct AlbumListView: View {
    @ObservedObject var albumStore = AlbumStore.singleton
    var body: some View {
        NavigationView {
            List {
                ForEach (albumStore.albums) { album in
                    AlbumCell(album: album)
                }
                .onDelete(perform: deleteAlbum)
                .onMove(perform: moveAlbum)
            }
            .navigationBarTitle(Text("Albums"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    func deleteAlbum(at offsets: IndexSet) {
        albumStore.albums.remove(atOffsets: offsets)
    }
    func moveAlbum(from src: IndexSet, to dst: Int) {
        albumStore.albums.move(fromOffsets: src, toOffset: dst)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListView()
    }
}

struct AlbumCell: View {
    let album: Album
    @State var image: Image?
    var body: some View {
        NavigationLink(destination: AlbumDetailView(album: album)){
            HStack {
            //            ImageStore.load(strUrl: album.image)
                        loadAlbumImage()
                            .resizable()
                            .frame(width: 56, height: 56, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Text(album.albumTitle)
                                .font(.headline)
                                .foregroundColor(.argb(0xFF283747))
            //                    .foregroundColor(Color.blue)
                                .frame(height: 50)
                            Text(album.artistName)
                                .font(.caption)
                                .foregroundColor(.argb(0xFF333333))
                                .multilineTextAlignment(.leading)
                                .lineLimit(1)
                }
            }
        }
    }
    
    func loadAlbumImage() -> Image {
        if image != nil{
            return image!
        }
//        if let image = image{
//            return image
//        }
        return ImageStore.load(strUrl: album.image) { image in
            self.image = image
        }
    }
}


struct AlbumCell_Previews : PreviewProvider {
    static var previews : some View {
        List{
            AlbumCell(album : Album(albumTitle : "HELLO1", artistName: "artist1", image : "url1"))
            AlbumCell(album : Album(albumTitle : "HELLO2", artistName: "artist2", image : "url2"))
            AlbumCell(album : Album(albumTitle : "HELLO3", artistName: "artist3", image : "url3"))
        }
    }
}
