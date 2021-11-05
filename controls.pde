//đây là trang thể hiện điều khiển của bạn và trí tuệ nhân tạo của tôi

//nếu bạn không bấm gì nó sẽ tự động giải cho bạn
void keyPressed() {
  if (key == ' ') {
    currentMove.start();
    counter = 0;
  } 
  else
  //hàm gọi chương trình cho bấm thử chạy
   applyMove(key);
}
//nếu bạn bấm phím tương ứng với việc gán ở trên bạn sẽ xoay được rubix tương ứng với mặt định
void applyMove(char move) {
  switch (move) {
  case 'f': 
    turnZ(1, 1);
    break;
  case 'F': 
    turnZ(1, -1);
    break;  
  case 'b': 
    turnZ(-1, 1);
    break;
  case 'B': 
    turnZ(-1, -1);
    break;
  case 'u': 
    turnY(1, 1);
    break;
  case 'U': 
    turnY(1, -1);
    break;
  case 'd': 
    turnY(-1, 1);
    break;
  case 'D': 
    turnY(-1, -1);
    break;
  case 'l': 
    turnX(-1, 1);
    break;
  case 'L': 
    turnX(-1, -1);
    break;
  case 'r': 
    turnX(1, 1);
    break;
  case 'R': 
    turnX(1, -1);
    break;
  }
}
