class Bird implements FlyingAbility {} /* Adds the trait FlyingAbility to the Bird class capabilities */
def bird = new Bird() /* instantiate a new Bird */
assert bird.fly() == "I'm flying!" /* the Bird class automatically gets the behavior of the FlyingAbility trait */
