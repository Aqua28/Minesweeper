import de.bezier.guido.*;
public final static int NUM_ROWS= 20;
public final static int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER, CENTER);
    
    //make the manager
    Interactive.make( this );
    
    //your code to declare and initialize buttons goes here
    buttons = new MSButton[20][20];
    for(int r =0; r < NUM_ROWS; r++){
        for(int c =0; c< NUM_COLS; c++){
          buttons[r][c]= new MSButton(r, c);
        }
    }
    
    
    setBombs();
}
public void setBombs()
{
    for(int i =0 ; i<8 ; i++){
    int row = (int)(Math.random()*20);
    int col = (int)(Math.random()*20);
    if (!bombs.contains(buttons[row][col]))
        bombs.add(buttons[row][col]);
}
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        if(keyPressed == true)
            marked = clicked;
        if (marked ==false) {
            clicked = false;
        }
        else if (bombs.contains(this)) {
            text("hi", 200, 20);
        }
        else if(countBombs(r, c)>0)
            label = countBombs(r, c);
        else 
            mousePressed();

    }

    public void draw() 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }

    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int r, int c)
    {
        if(r>=0 && c>=0 && r<=20 && c<=20)
            return true;
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid(row, col) ==true && bombs.contains(buttons[row][col]))
            numBombs++;
        return numBombs;
        }
}



