// trang khởi tạo hiệu ứng duy chuyển


//lớp duy chuyển
class Move {
  float angle = 0;
  int x = 0;
  int y = 0;
  int z = 0;
  int dir;
  boolean animating = false;
  boolean finished = false;
//khởi tạo duy chuyển theo x,y,z cùng chiều kim đồng vồ và dir ngược chiều kim đồng hồ
  Move(int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }

  Move copy() {
    return new Move(x, y, z, dir);
  }

  void reverse() {
    dir *= -1;
  }
//hàm bắt đầu
  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }

  boolean finished() {
    return finished;
  }
//hàm cập nhật 
  void update() {
    if (animating) {
      //góc quay cộng với thời gian
      angle += dir * speed;
      //nếu góc quay lớn hơn half pi
      if (abs(angle) > HALF_PI) {
        //trả về từ đầu kết thúc
        angle = 0;
        animating = false;
        finished = true;
        if (abs(z) > 0) {
          turnZ(z, dir);
        } else if (abs(x) > 0) {
          turnX(x, dir);
        } else if (abs(y) > 0) {
          turnY(y, dir);
        }
      }
    }
  }
}
