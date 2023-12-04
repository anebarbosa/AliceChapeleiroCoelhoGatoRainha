class Button {
  float x;
  float y;
  float w;
  float h;
  int border;
  color defaultColor;
  color hoverColor;
  boolean isHovered = false;
  boolean hasPlayedHoverSound = false;
  color clickedColor;
  boolean soundPlayed = false;

  Button(float x, float y, float w, float h, int border, color defaultColor, color hoverColor, color clickedColor) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.border = border;
    this.defaultColor = defaultColor;
    this.hoverColor = hoverColor;
    this.clickedColor = clickedColor;
  }

  void display() {
    noStroke();

    if (checkClick()) {
      if (!soundPlayed) {
        click.play();
        soundPlayed = true;
        imageAnimation.startAnimation();
      }
      fill(clickedColor);
      stroke(0);
    } else if (checkHover()) {
      if (!hasPlayedHoverSound) {
        hover.play();
        hasPlayedHoverSound = true; // Set the flag to indicate hover sound has been played
      }
      fill(hoverColor);
      stroke(0);
    } else {
      fill(defaultColor);
      noStroke();
      soundPlayed = false;
      hasPlayedHoverSound = false; // Reset the flag when not hovered or clicked
    }

    rect(x / 800 * width, y / 400 * height, w / 800 * width, h / 400 * height, border);
  }

  Boolean checkHover() {
    if (mouseX >= x / 800 * width && mouseX <= (x + w) / 800 * width && mouseY >= y / 400 * height && mouseY <= (y + h) / 400 * height) {
      return true;
    } else {
      return false;
    }
  }

  Boolean checkClick() {
    if (checkHover() && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
}
