//trang giao diện


//lớp giao diện 
class Face {
  PVector normal;
  color c;

  Face(PVector normal, color c) {
    this.normal = normal;
    this.c = c;
  }

//hàm trược để xoay không mặt z(sử dụng phép quay pháp tuyến)
  void turnZ(float angle) {
    //khởi tạo pvector mới 
    PVector v2 = new PVector();
    //khởi tạo công thức tính tọa độ cos sin ứng với x và y
    v2.x = round(normal.x * cos(angle) - normal.y * sin(angle));
    v2.y = round(normal.x * sin(angle) + normal.y * cos(angle));
    v2.z = round(normal.z);
    normal = v2;
  }

//hàm trược để xoay khuôn mặt y(sử dụng phép quay pháp tuyến)
  void turnY(float angle) {
    PVector v2 = new PVector();
    v2.x = round(normal.x * cos(angle) - normal.z * sin(angle));
    v2.z = round(normal.x * sin(angle) + normal.z * cos(angle));
    v2.y = round(normal.y);
    normal = v2;
  }
//hàm trược để xoay không mặt x(sử dụng phép quay pháp tuyến)
  void turnX(float angle) {
    PVector v2 = new PVector();
    v2.y = round(normal.y * cos(angle) - normal.z * sin(angle));
    v2.z = round(normal.y * sin(angle) + normal.z * cos(angle));
    v2.x = round(normal.x);
    normal = v2;
  }
//hàm chính và gọi lớp này chạy
  void show() {
    //hàm tiết kiệm trạng thái chuyển đổi
    pushMatrix();
    fill(c);
    noStroke();
    rectMode(CENTER);
    //cho nó nhân với 0.5 để lồng ghép màu vào trong mỗi ô được tạo
    translate(0.5*normal.x, 0.5*normal.y, 0.5*normal.z);
    //điều kiện chuyển đổi nếu tọa độ x và y tại trục quay thường theo x và y
    if (abs(normal.x) > 0) {
      rotateY(HALF_PI);
    } else if (abs(normal.y) > 0) {
      rotateX(HALF_PI);
    }
    //khởi tạo rubix là hình vuông
    square(0, 0, 1);
    //hàm khôi phục trạng thái chuyển đổi
    popMatrix();
  }
}
