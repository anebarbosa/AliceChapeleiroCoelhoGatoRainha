class ImageAnimation {
  PImage img;
  float x, y, w, h;
  float currentRotation = 0; // Track the current rotation
  float targetRotation = PI * 2; // Rotate 360 degrees
  float rotationSpeed = PI * 6; // Adjust the rotation speed (faster)
  float currentSize = 1.0; // Track the current size
  float targetSize = 0.1; // Target size

  boolean isAnimating = false;
  int animationStartTime;

  ImageAnimation(PImage img, float x, float y, float w, float h) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void display() {
    if (isAnimating) {
      int animationElapsedTime = millis() - animationStartTime;

      currentRotation = (rotationSpeed * animationElapsedTime / 1000) % (PI * 2);

      // Change the division factor from 2000.0 to 1000.0 for 1-second animation
      currentSize = lerp(1.0, targetSize, animationElapsedTime / 1000.0);

      pushMatrix();
      translate(x + w / 2, y + h / 2);
      rotate(currentRotation);
      image(img, -w / 2, -h / 2, w * currentSize, h * currentSize);
      popMatrix();

      if (animationElapsedTime >= 1000) { // Adjust the time to 1000 milliseconds (1 second)
        isAnimating = false;
      }
    } else {
      image(img, x, y, w, h);
    }
  }

  void startAnimation() {
    currentRotation = 0; // Start from the current position
    currentSize = 1.0; // Start from the original size
    isAnimating = true;
    animationStartTime = millis();
  }

  boolean isClicked(float mx, float my) {
    return (mx >= x && mx <= x + w && my >= y && my <= y + h);
  }
}
