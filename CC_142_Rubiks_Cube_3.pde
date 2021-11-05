//trang khởi tạo 


import peasy.*;

PeasyCam cam;
//thời gian giải rubix
float speed = 0.1;
int dim = 3;
//khởi tạo mảng 
Cubie[] cube = new Cubie[dim*dim*dim];
//gọi mảng di chuyển trong lớp di chuyển
Move[] allMoves = new Move[] {
  //khởi tạo các động thái di chuyển mặt định
  new Move(0, 1, 0, 1), 
  new Move(0, 1, 0, -1), 
  new Move(0, -1, 0, 1), 
  new Move(0, -1, 0, -1), 
  new Move(1, 0, 0, 1), 
  new Move(1, 0, 0, -1), 
  new Move(-1, 0, 0, 1), 
  new Move(-1, 0, 0, -1), 
  new Move(0, 0, 1, 1), 
  new Move(0, 0, 1, -1), 
  new Move(0, 0, -1, 1), 
  new Move(0, 0, -1, -1) 
};

ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;
//khởi tạo ban đầu là không có màu
boolean started = false;

Move currentMove;

void setup() {
 //khởi tạo giao diện 600*600 và trình 3d bởi khối rubix là không gian 3 chiều
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  //3 vòng lặp này bạn có thể hiểu đơn giản là nó thể hiện cho các cục nhỏ trên 1 cục rubix theo mảng: vd(000),(100)...
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
//hàm di chuyển
  for (int i = 0; i < 25; i++) {
    int r = int(random(allMoves.length));
    Move m = allMoves[r];
    sequence.add(m);
  }

  currentMove = sequence.get(counter);

  for (int i = sequence.size()-1; i >= 0; i--) {
    Move nextMove = sequence.get(i).copy();
    nextMove.reverse();
    sequence.add(nextMove);
  }

  currentMove.start();
}
//hàm vẻ 
void draw() {
  background(51); 

  cam.beginHUD();
  fill(255);
  textSize(32);
  //hamf điếm lần thao tác giải của rubix
  text(counter, 100, 100);
  cam.endHUD();
//góc cục rubix khi bắt đầu chạy
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);

  currentMove.update();
  if (currentMove.finished()) {
    if (counter < sequence.size()-1) {
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
  }

//hàm xây dựng hoạt ảnh di chuyển
  scale(50);
  //abs là giá trị tuyệt đối
  for (int i = 0; i < cube.length; i++) {
    //trong push pop
    push();
    //điều kiện ở đây là nếu khối rubix.z di chuyển z
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.z) {
      //thực hiện di chuyển góc z
      rotateZ(currentMove.angle);
       //điều kiện ở đây là nếu khối rubix.z di chuyển x
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.x) {
      //thực hiện di chuyển góc x
      rotateX(currentMove.angle);
       //điều kiện ở đây là nếu khối rubix.z di chuyển y
    } else if (abs(cube[i].y) > 0 && cube[i].y ==currentMove.y) {
      //thực hiện di chuyển góc y
      rotateY(-currentMove.angle);
    }   
    // nơi hiển thị khối lập phương
    cube[i].show();
    pop();
  }
}
