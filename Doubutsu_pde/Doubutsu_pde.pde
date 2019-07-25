final int SQUARESIZE = 100;
int win = -1;
Board board;
KomaList komaList;
GameStatus gs;

void setup() {
  surface.setSize(6*SQUARESIZE, 4*SQUARESIZE);
  board = new Board();
  komaList = new KomaList();
  gs = new GameStatus();
}

void draw() {
  board.draw();
  komaList.draw();
  gs.checkWinner();

}

void mouseReleased() {
  int x = mouseX/SQUARESIZE;
  int y = mouseY/SQUARESIZE;
  board.select(x, y);
}
void checkWinner() {
    for (AbstractKoma k : komaList.komaArray) {
      if (k.name.equals("lion")) {
        if(k.kStat.captured || (k.team==0 && k.x==board.bArea.posX+board.bArea.yoko-1) ||(k.team==1 && k.x==board.bArea.posX)){
          this.win=k.team;
          break;
        }
      }
    }
  }
