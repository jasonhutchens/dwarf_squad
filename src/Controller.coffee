#= require Pad

class Controller
  @flipAxis:(level)->
    a1 = Phaser.Math.getRandom(Controller.AXIS)
    a2 = Phaser.Math.getRandom(Controller.AXIS)

    p1 = Phaser.Math.getRandom([0, 1, 2, 3])
    p2 = Phaser.Math.getRandom([0, 1, 2, 3])

    for i in [0..1]
      level.exchangeDirection(p1, p2, Controller.AXIS_TO_DIR[a1][i], Controller.AXIS_TO_DIR[a2][i])


  @flipDirection:(level)->
    a1 = Phaser.Math.getRandom(Controller.DIRECTION)
    a2 = Phaser.Math.getRandom(Controller.DIRECTION)

    p1 = Phaser.Math.getRandom([0, 1, 2, 3])
    p2 = Phaser.Math.getRandom([0, 1, 2, 3])

    level.exchangeDirection(p1, p2, a1, a2)


  constructor:(player)->
    @player = player
    @ax = 0
    @ay = 0

    @actions = [@up, @down, @left, @right];

  left:()=>
    @ax = -2000

  right:()=>
    @ax = 2000

  up:()=>
    @ay = -2000

  down:()=>
    @ay = 2000

  update:=>
    @player.accelerate(@ax, @ay)
    @ax = 0
    @ay = 0

  getAction:(i)=>
    @actions[i];


Controller.UP_DOWN = 0
Controller.LEFT_RIGHT = 1
Controller.AXIS = [Controller.UP_DOWN, Controller.LEFT_RIGHT]
Controller.DIRECTIONS = [Pad.UP, Pad.DOWN, Pad.LEFT, Pad.RIGHT]

Controller.AXIS_TO_DIR = {}
Controller.AXIS_TO_DIR[Controller.UP_DOWN] = [Pad.UP, Pad.DOWN]
Controller.AXIS_TO_DIR[Controller.LEFT_RIGHT] = [Pad.LEFT, Pad.RIGHT]


root = exports ? window
root.Controller = Controller


