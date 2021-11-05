//trang rubix

//lớp rubix để khởi tạo rubix
class Cubie {
  //sử dụng công cụ 3D để dễ dàng thu gọn code hk bị lằng nhằnh
  PMatrix3D matrix;
  //khởi tạo 3 biến riêng biệt x,y,z
  int x = 0;
  int y = 0;
  int z = 0;
  color c;
  //gọi class face có 6 mặt
  Face[] faces = new Face[6];

  Cubie(PMatrix3D m, int x, int y, int z) {
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    c = color(255);
//tọa độ màu sắt của các ô trong khối rubix và khởi tạo màu của nó 6 mặt
    faces[0] = new Face(new PVector(0, 0, -1), color(0, 0, 255));
    faces[1] = new Face(new PVector(0, 0, 1), color(0, 255, 0));
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255));
    faces[3] = new Face(new PVector(0, -1, 0), color(255, 255, 0));
    faces[4] = new Face(new PVector(1, 0, 0), color(255, 150, 0));
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 0, 0));
  }
 //hàm gọi phép quay pháp tuyến của mặt z
  void turnFacesZ(int dir) {
    for (Face f : faces) {
      f.turnZ(dir*HALF_PI); 
    }
  }
//hàm gọi phép quay pháp tuyến của mặt y
  void turnFacesY(int dir) {
    for (Face f : faces) {
      f.turnY(dir*HALF_PI); 
    }
  }
//hàm gọi phép quay pháp tuyến của mặt x
    void turnFacesX(int dir) {
    for (Face f : faces) {
      f.turnX(dir*HALF_PI); 
    }
  }
  
  
  //hàm chỉnh sửa cần thiết và gọi lại từ đầu chương trình
  void update(int x, int y, int z) {
    matrix.reset(); 
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }
//hàm gọi chương trình chạy và được xem là lớp chính
  void show() {
    //fill(c);
    noFill();
    stroke(0);
    //kích thước khối rubix
    strokeWeight(0.1);
    //hàm tiết kiệm trạng thái chuyển đổi
    pushMatrix(); 
    //gọi mảng mastrix
    applyMatrix(matrix);
    box(1);
    //vẻ và gọi ma trận face chạy
    for (Face f : faces) {
      f.show();
    }
    //hàm khôi phục trạng thái chuyển đổi
    popMatrix();
  }
}
