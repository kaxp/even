# even

This Flutter application is developed on version 3.7.6 in the Stable channel.

## Objective
An animation-focused UI project. The primary animations include transitions in the bottom menu (from "home" to the timeline screen and back) and the "Plus button" animation. The main screen of interest is the "consultations" screen with the "plus" sign in the top left corner.

### Designs and Video

<img src="https://github.com/kaxp/even/blob/0400f1eabab38ac6c10096da4d2dc74f70fa8dca/screenshots/1.png" height="400"> <img src="https://github.com/kaxp/even/blob/0400f1eabab38ac6c10096da4d2dc74f70fa8dca/screenshots/2.png" height="400"> <img src="https://github.com/kaxp/even/blob/0400f1eabab38ac6c10096da4d2dc74f70fa8dca/screenshots/3.png" height="400">

#### Video Preview of animations
   <a href="https://www.youtube.com/shorts/GcZvERWOkOw" target="_blank">
     <img src="https://github.com/kaxp/even/blob/25e2e1aed50425f98eab0d3b0513e593be1a4fcc/screenshots/IMG_6316.PNG" alt="Flutter animations" height="500">
   </a>

### Steps for running the application

1. Clone the project using the command `git clone https://github.com/kaxp/even.git`
2. Run `flutter pub get`
3. Run the application on an Android device using `flutter run --release`

### Blocker
The transitioning animation on tab switching is not achieved due to an existing issue in Flutter.

[Transitioning a TabBarView manually doesn't honor the duration and curve](https://github.com/flutter/flutter/issues/16892)

## Implementation video

<a href="https://www.youtube.com/shorts/atDs3y4zlDk" target="_blank">
  <img src="https://github.com/kaxp/even/blob/25e2e1aed50425f98eab0d3b0513e593be1a4fcc/screenshots/IMG_6316.PNG" alt="Flutter animations" height="500">
</a>
