# PHPSPEC

### TODO, need to be clarified
$this->prophet = new \Prophecy\Prophet; $user->reveal();
$user = $this->prophet->prophesize()->willExtend('stdClass')->willImplement('Reader\ReaderInterface');
$this->prophet->checkPredictions(); 

Return() shouldBe() BeLike() BeApproximately()
$this->shouldTrigger(E_USER_DEPRECATED)->duringSetStars(4); duringInstantiation()
    Throw->during('setRating', array(-3)); 
HaveType() BeAnInstanceOf() Implement()

hasSoundtrack() isSoundtrack() $this->shouldHaveSoundtrack(); shouldBeSoundtrack();
shouldHaveCount(1);     shouldBeString();    shouldContain('Jane Smith');
HaveKeyWithValue('k', 'v'); shouldIterateLike()
houldHaveKey('v'); shouldIterateAs(new \ArrayIterator()) shouldYield(new \ArrayIterator())
shouldStartIteratingAs() shouldContain() shouldStartWith() shouldMatch()
