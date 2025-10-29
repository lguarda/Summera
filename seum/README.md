# SEUM logbook

Let's make another drone based on my previous successful attempt sumera
I will call it seum, a slight derivation of sumera, and thanks to chat gpt it also mean Sorry Everyone Under Me

The goal here his to make a 3inch or 3.5inch (prop size) drone with cheapest part, i want this size because i like it, and it doesn't take a lot of space in a bag
the first issue to deal with is the fact that most 3/3.5 inch frame only offer 20mm mount for FC and ESC, but those smallest part cost more money, an it sucks.

## learn from the past
So here we will continue with same kind of design as sumera 3 inch at best or 3.5 inch with 30.5 mm mount capabilities
This time need to properly take into account the placement of everything,
1. fc
1. esc
1. video antenna
1. radio antenna
1. radio tx
1. vtx
1. gps
1. beacon
1. lipo
1. camera
1. action cam (this one is optional it depend on price, estimated weight, and overall fitting)

With sumera i almost only took fc/esc/cam/lipo into account, and barely the antenna placement wich led into a fiting nightmare.
To be more precise here are the list of issues
- radio antenna was taking to much space on the lipo cable side
  Here i think i just need to do like real frame do mount, with 30 angle outside of the lipo cable way
- vtx wand just bellow both esc cable with some double face tape, and almost not accessible
- radio tx was simply floating within the frame only attached by rubber band, although i need to acknowledged this didn't pause any issue
- camera
 1. was not well protected
 2. i could see the frame it self in visio
 3. i was almost not able to change the angle because the fitting was pixel perfect, i had 21mm of Available height, but the camera was almost the same height.
- lipo strap placement was not ideal, and was touching action cam
- lipo female cable was to short
- TODO i think i forgot multiple point

## new challenge
There's 2 issue that i want to address with this new drone

1. if i lost the drone in a bush i want to be able to locate it easily
2. if i lost vision on the drone i want to have some kind of panic position halt, and if possible gps rescue

For the first issue, the solution is "simple" i bought an autosome buzzer + led
So for this one is need to figure out
- betaflight configuration + fallback
- frame placement fitting

For the second issue, it's kind of trickier, position halt didn't exist at the time and i'm still not sure it exist, but if it exist
I need a gps, so
- again frame placement and fitting of the gps need to be solved
- betaflight configuration
- research on what gps can offer other than gps rescue

So as a conclusion for these new challenge the first git impact is that i need some space inside and outside, and do some research in parallel
