//
//  GameScene.swift
//  block-puzzle Shared
//
//  Created by George Watson on 12/09/2022.
//

import SpriteKit

enum BlockColor : String, CaseIterable {
    case Purple = "Purple"
    case Blue = "Blue"
    case Red = "Red"
    case Green = "Green"
    case Yellow = "Yellow"
    case Orange = "Orange"
    case Blank = "Blank"
    case Selected = "Selected"
}

enum SpecialBlockColor : Int {
    case Blank = 6
    case Selected = 7
}

enum TetrominoType : String, CaseIterable {
    case TetrominoI = "I"
    case TetrominoO = "O"
    case TetrominoT = "T"
    case TetrominoJ = "J"
    case TetrominoL = "L"
    case TetrominoS = "S"
    case TetrominoZ = "Z"
}

enum TetrominoSize: String, CaseIterable {
    case TetrominoSmall = "Small"
    case TetrominoMedium = "Medium"
    case TetrominoLarge = "Large"
}

enum TetrominoRotation: String, CaseIterable {
    case TetrominoRot0 = "0deg"
    case TetrominoRot90 = "90deg"
    case TetrominoRot180 = "180deg"
    case TetrominoRot270 = "270deg"
}

enum BlockState: String, CaseIterable {
    case Dead = "Dead"
    case Alive = "Alive"
}

enum BlockLayer: CGFloat {
    case Grid = 1.0
    case Blocks = 10.0
    case Selected = 100.0
    case fadeOutScreen = 1000.0
    case topLayer = 10000.0
}

let tetrominoShapes: [TetrominoSize: [TetrominoType: [TetrominoRotation: [CGPoint]]]] = [
    .TetrominoSmall: [
        .TetrominoI: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0)],
        ],
        .TetrominoO: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0)],
        ],
        .TetrominoT: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0)],
        ],
        .TetrominoJ: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot180: [CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
        ],
        .TetrominoL: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot180: [CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
        ],
        .TetrominoS: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot90: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0)],
        ],
        .TetrominoZ: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot90: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0)],
        ],
    ],
    .TetrominoMedium: [
        .TetrominoI: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 0, y: 3)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 0, y: 3)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 0)],
        ],
        .TetrominoO: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1)],
        ],
        .TetrominoT: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 1, y: 1)],
            .TetrominoRot90: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot180: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 1, y: 0)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 1)],
        ],
        .TetrominoJ: [
            .TetrominoRot0: [CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 2, y: 1)],
        ],
        .TetrominoL: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot270: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
        ],
        .TetrominoS: [
            .TetrominoRot0: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot180: [CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2)],
        ],
        .TetrominoZ: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1)],
            .TetrominoRot90: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1)],
            .TetrominoRot270: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
        ],
    ],
    .TetrominoLarge: [
        .TetrominoI: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 0, y: 3), CGPoint(x: 0, y: 4)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 0), CGPoint(x: 4, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 0, y: 3), CGPoint(x: 0, y: 4)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 3, y: 0), CGPoint(x: 4, y: 0)],
        ],
        .TetrominoO: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
        ],
        .TetrominoT: [
            .TetrominoRot0: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot90: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot180: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 1, y: 2)],
            .TetrominoRot270: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 1, y: 2)],
        ],
        .TetrominoJ: [
            .TetrominoRot0: [CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 0), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 2)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 2)],
        ],
        .TetrominoL: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 2, y: 0), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 2)],
            .TetrominoRot270: [CGPoint(x: 2, y: 0), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 0, y: 2)],
        ],
        .TetrominoS: [
            .TetrominoRot0: [CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
            .TetrominoRot90: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2)],
            .TetrominoRot180: [CGPoint(x: 0, y: 2), CGPoint(x: 1, y: 2), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1), CGPoint(x: 2, y: 0)],
            .TetrominoRot270: [CGPoint(x: 0, y: 0), CGPoint(x: 0, y: 1), CGPoint(x: 1, y: 1), CGPoint(x: 1, y: 2), CGPoint(x: 2, y: 2)],
        ],
        .TetrominoZ: [
            .TetrominoRot0: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1)],
            .TetrominoRot90: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
            .TetrominoRot180: [CGPoint(x: 0, y: 0), CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 2, y: 1)],
            .TetrominoRot270: [CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint(x: 0, y: 2)],
        ],
    ],
]

func FetchTetromino(size: TetrominoSize, type: TetrominoType, rot: TetrominoRotation) -> [CGPoint] {
    print("NEW TETROMINO: { .size = \(size), .type = \(type), .rot = \(rot) }")
    return tetrominoShapes[size]![type]![rot]!
}

func RandomTetromino() -> [CGPoint] {
    let size = TetrominoSize.allCases.randomElement()!
    let type = TetrominoType.allCases.randomElement()!
    let rot  = TetrominoRotation.allCases.randomElement()!
    return FetchTetromino(size: size, type: type, rot: rot)
}

class Tetromino {
    var grid: [[BlockState]]
    var w: Int, h: Int
    var color: BlockColor = .Blank
    var nodes: [SKSpriteNode] = []
    var selected: Bool = false
    var position: CGPoint = CGPoint(x: 0, y: 0)
    var currentPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    init(positions: [CGPoint]) {
        var w = 0.0, h = 0.0
        for p in positions {
            if p.x > w {
                w = p.x
            }
            if p.y > h {
                h = p.y
            }
        }
        
        self.w = Int(w) + 1
        self.h = Int(h) + 1
        self.grid = Array(repeating: Array(repeating: .Dead, count: self.h), count: self.w)
        for p in positions {
            self.grid[Int(p.x)][Int(p.y)] = .Alive
        }
        for x in 0...self.w-1 {
            for y in 0...self.h-1 {
                print("\(self.grid[x][y] == .Alive ? "X" : "0")", terminator: "")
            }
            print("")
        }
    }
}

func remap(x: CGFloat, inMin: CGFloat, inMax: CGFloat, outMin: CGFloat, outMax: CGFloat) -> CGFloat {
    return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin
}

let gridCategory: UInt32 = 0x1 << 0
let selectedCategory: UInt32 = 0x1 << 1

enum GameState: String {
    case Playing = "Playing"
    case GameOver = "GameOver"
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var blockTextures: [SKTexture] = []
    var tetrominos: [Tetromino] = []
    var lastUpdateTimeInterval: TimeInterval = 0
    var grid: [[BlockState]] = []
    var gridOffset: CGSize = CGSize(width: 0, height: 0)
    var gridOffsetTopLeft: CGPoint = CGPoint(x: 0, y: 0)
    var gridNodes: [[SKSpriteNode?]] = [[]]
    var scoreLabel: SKLabelNode? = nil
    var gameOverLabel: SKLabelNode? = nil
    var currentScore: Int = 0
    var currentMultiplier: Int = 1
    var fadeOutScreen: SKShapeNode? = nil
    var newGameLabel: SKLabelNode? = nil
    var mainMenuLabel: SKLabelNode? = nil
    var gameState: GameState = .Playing
    
    class func newGameScene() -> GameScene {
        // Load 'GameScene.sks' as an SKScene.
        guard let scene = SKScene(fileNamed: "GameScene") as? GameScene else {
            print("Failed to load GameScene.sks")
            abort()
        }
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .aspectFill
        
        scene.physicsWorld.contactDelegate = scene
        
        let atlas = SKTextureAtlas(named: "blocks")
        scene.blockTextures = BlockColor.allCases.map { atlas.textureNamed("\($0).png") }
        scene.scoreLabel = SKLabelNode(text: "0")
        scene.addChild(scene.scoreLabel!)
        
        scene.grid = Array(repeating: Array(repeating: .Dead, count: 9), count: 9)
        scene.gridNodes = Array(repeating: Array(repeating: nil, count: 9), count: 9)
        scene.gridOffset = CGSize(width: 4 * 32,
                                 height: 3 * 32)
        scene.gridOffsetTopLeft = CGPoint(x: -scene.gridOffset.width - 16,
                                          y: scene.gridOffset.height + 80)
        
        for x in 0...8 {
            for y in 0...8 {
                let node = SKSpriteNode(texture: scene.blockTextures[SpecialBlockColor.Blank.rawValue])
                node.position = CGPoint(x: Int(-scene.gridOffset.width) + x * 32,
                                        y: Int(-scene.gridOffset.height) + y * 32)
                node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 32, height: 32))
                node.physicsBody?.isDynamic = true
                node.physicsBody?.affectedByGravity = false
                node.physicsBody?.categoryBitMask = gridCategory
                node.physicsBody?.contactTestBitMask = 0
                node.physicsBody?.collisionBitMask = 0
                node.zPosition = BlockLayer.Grid.rawValue
                scene.addChild(node)
            }
        }
        
        return scene
    }
    
    func appendNewTetromino(tetromino: Tetromino, offset: CGSize, color: BlockColor? = .Blank) {
        var textureColor: Int = 0
        var colorEnum: BlockColor = color!
        if colorEnum == .Blank {
            while true {
                textureColor = (0...BlockColor.allCases.count-3).randomElement()!
                colorEnum = BlockColor.allCases[textureColor]
                var unique = true
                for t in self.tetrominos {
                    if t.color == colorEnum {
                        unique = false
                        break
                    }
                }
                if unique {
                    tetromino.color = colorEnum
                    break
                }
            }
        } else {
            for (i, c) in BlockColor.allCases.enumerated() {
                if c == color {
                    textureColor = i
                    break
                }
            }
        }
        let texture = blockTextures[textureColor]
        
        tetromino.position = CGPoint(x: -self.gridOffset.width + offset.width,
                                     y: self.gridOffset.height + offset.height)
        print("ADDED TETROMINO (\(colorEnum)) @ \(tetromino.position.x), \(tetromino.position.y) - \(tetromino.w)x\(tetromino.h)")
        tetromino.currentPosition = position
        for (y, col) in tetromino.grid.enumerated() {
            for (x, state) in col.enumerated() {
                if state != .Dead {
                    let node = SKSpriteNode(texture: texture)
                    node.position = CGPoint(x: Int(tetromino.position.x) + x * 32,
                                            y: Int(tetromino.position.y) - (y - 2) * 32)
                    node.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 32, height: 32))
                    node.physicsBody?.isDynamic = false
                    node.physicsBody?.categoryBitMask = selectedCategory
                    node.physicsBody?.contactTestBitMask = 0
                    node.physicsBody?.collisionBitMask = 0
                    node.zPosition = BlockLayer.Blocks.rawValue
                    self.addChild(node)
                    tetromino.nodes.append(node)
                }
            }
        }
    }
    
    func setUpScene() {
        self.grid = Array(repeating: Array(repeating: .Dead, count: 9), count: 9)
        self.gridNodes = Array(repeating: Array(repeating: nil, count: 9), count: 9)
        
        self.currentScore = 0
        self.currentMultiplier = 0
        self.scoreLabel?.text = "0"
        self.scoreLabel?.color = .white
        self.scoreLabel?.zPosition = BlockLayer.Blocks.rawValue
        self.scoreLabel?.position = CGPoint(x: 0, y: gridOffset.height * 2)
        
        self.tetrominos = []
        for _ in 0...2 {
            self.tetrominos.append(Tetromino(positions: RandomTetromino()))
        }
        
        var offset = -(4 * 32) + (((self.tetrominos.map { $0.h }.reduce(0, +) + 1) * 32) / 2)
        for i in 0...2 {
            self.appendNewTetromino(tetromino: self.tetrominos[i],
                                    offset: CGSize(width: -offset, height: -320))
            offset -= (self.tetrominos[i].h + 1) * 32
        }
    }
    
    #if os(watchOS)
    override func sceneDidLoad() {
        self.setUpScene()
    }
    #else
    override func didMove(to view: SKView) {
        self.setUpScene()
    }
    #endif
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
    }
    
    func playingClickDown(location: CGPoint) {
        let nodes = self.nodes(at: location)
        
        for tetromino in self.tetrominos {
            for nodeA in tetromino.nodes {
                for nodeB in nodes {
                    if nodeA == nodeB {
                        tetromino.selected = true
                        tetromino.currentPosition = location
                        for node in tetromino.nodes {
                            node.zPosition = BlockLayer.Selected.rawValue
                        }
                        return
                    }
                }
            }
        }
    }
    
    func playingClickDrag(location: CGPoint) {
        for tetromino in self.tetrominos {
            if tetromino.selected {
                let lastPosition = tetromino.currentPosition
                let delta = CGPoint(x: location.x - lastPosition.x,
                                    y: location.y - lastPosition.y)
                for node in tetromino.nodes {
                    node.position = CGPoint(x: node.position.x + delta.x,
                                            y: node.position.y + delta.y)
                }
                tetromino.currentPosition = location
            }
        }
    }
    
    func playingClickUp(location: CGPoint) {
        var toRemove: Int? = nil
        for (i, tetromino) in self.tetrominos.enumerated() {
            if tetromino.selected {
                tetromino.selected = false
                var positions: [CGPoint] = []
                var success = true
                
                let xRangeMin = self.gridOffsetTopLeft.x, xRangeMax = self.gridOffsetTopLeft.x + (9.0 * 32.0)
                let yRangeMin = self.gridOffsetTopLeft.y, yRangeMax = self.gridOffsetTopLeft.y - (9.0 * 32.0)
                for node in tetromino.nodes {
                    let ax: Int = Int(floor(remap(x: node.position.x, inMin: xRangeMin, inMax: xRangeMax, outMin: 0, outMax: 9)))
                    let ay: Int = Int(floor(remap(x: node.position.y, inMin: yRangeMin, inMax: yRangeMax, outMin: 0, outMax: 9)))
                    if ax >= 0 && ay >= 0 && ax < 9 && ay < 9 {
                        if self.grid[ax][ay] != .Alive {
                            positions.append(CGPoint(x: ax, y: ay))
                            continue
                        } else {
                            print("OVERLAPPING @ \(ax),\(ay)")
                        }
                    } else {
                        print("OUT OF BOUNDS @ \(node.position.x),\(node.position.y) -- \(ax),\(ay)")
                    }
                    success = false
                    break
                }
                
                if success && !positions.isEmpty {
                    for (i, node) in tetromino.nodes.enumerated() {
                        let x = Int(positions[i].x), y = Int(positions[i].y)
                        print("BLOCK ADDED @ \(x), \(y)")
                        self.grid[x][y] = .Alive
                        node.position = CGPoint(x: self.gridOffsetTopLeft.x + CGFloat(x * 32) + 16,
                                                y: self.gridOffsetTopLeft.y - CGFloat(y * 32) - 16)
                        node.zPosition = BlockLayer.Blocks.rawValue
                        self.gridNodes[x][y] = node
                    }
                    toRemove = i
                    break
                } else {
//                    
                }
                
                tetromino.currentPosition = tetromino.position
            }
        }
        
        if toRemove != nil {
            self.tetrominos.remove(at: toRemove!)
            self.tetrominos.append(Tetromino(positions: RandomTetromino()))
            
            var offset = -(4 * 32) + (((self.tetrominos.map { $0.h }.reduce(0, +) + 1) * 32) / 2)
            for i in 0...1 {
                for node in self.tetrominos[i].nodes {
                    node.removeFromParent()
                }
                self.tetrominos[i].nodes = []
                self.appendNewTetromino(tetromino: self.tetrominos[i],
                                        offset: CGSize(width: -offset, height: -320),
                                        color: self.tetrominos[i].color)
                offset -= (self.tetrominos[i].h + 1) * 32
            }
            self.appendNewTetromino(tetromino: self.tetrominos.last!,
                                    offset: CGSize(width: -offset, height: -320))
        }
        
        var score = 0
        for i in 0...8 {
            var fullY = true, fullX = true
            for y in 0...8 {
                if self.grid[i][y] == .Dead {
                    fullY = false
                    break
                }
            }
            for x in 0...8 {
                if self.grid[x][i] == .Dead {
                    fullX = false
                    break
                }
            }
            
            
            if fullY {
                for y in 0...8 {
                    self.grid[i][y] = .Dead
                    let node = self.gridNodes[i][y]
                    self.gridNodes[i][y] = nil
                    
                    node?.physicsBody?.allowsRotation = true
                    node?.physicsBody?.isDynamic = true
                    node?.physicsBody?.applyImpulse(CGVector(dx: (-25...25).randomElement()!, dy: 25))
                    node?.physicsBody?.applyAngularImpulse(CGFloat((-25...25).randomElement()!))
                    
                    node?.run(SKAction.sequence([
                        SKAction.fadeOut(withDuration: 1.0),
                        SKAction.run {
                            node?.removeFromParent()
                        }
                    ]))
                }
                
                score += 9 * self.currentMultiplier
                self.currentMultiplier *= 2
            }
            if fullX {
                for x in 0...8 {
                    self.grid[x][i] = .Dead
                    let node = self.gridNodes[x][i]
                    self.gridNodes[x][i] = nil
                    
                    node?.physicsBody?.allowsRotation = true
                    node?.physicsBody?.isDynamic = true
                    node?.physicsBody?.applyImpulse(CGVector(dx: (-25...25).randomElement()!, dy: 25))
                    node?.physicsBody?.applyAngularImpulse(CGFloat((-25...25).randomElement()!))
                    
                    node?.run(SKAction.sequence([
                        SKAction.fadeOut(withDuration: 1.0),
                        SKAction.run {
                            node?.removeFromParent()
                        }
                    ]))
                }
                
                score += 9 * self.currentMultiplier
                self.currentMultiplier *= 2
            }
        }
        
        if score > 0 {
            self.currentScore += score
            self.scoreLabel?.text = "\(self.currentScore)\(self.currentMultiplier == 1 ? "" : "  @x\(self.currentMultiplier)\(String(repeating: "!", count: min(8, self.currentMultiplier)))")"
            self.scoreLabel?.run(SKAction.sequence([
                SKAction.scale(to: 1.5, duration: 0.2),
                SKAction.scale(to: 1.0, duration: 0.2)
            ]))
        } else {
            self.currentMultiplier = 1
            self.scoreLabel?.text = "\(self.currentScore)"
        }
        
        for x in 0...8 {
            for y in 0...8 {
                print("\(self.grid[y][x] == .Alive ? "X" : "0")", terminator: "")
            }
            print("")
        }
        print("------------------------------------")
        
        var nFound = tetrominos.count
        for tetromino in self.tetrominos {
            var foundSpace = false
            for gx in 0...8 {
                for gy in 0...8 {
                    var isSpaceValid = true
                    for tx in 0...tetromino.w-1 {
                        for ty in 0...tetromino.h-1 {
                            let x = gx + tx, y = gy + ty
                            if x < 0 || y < 0 || x >= 9 || y >= 9 {
                                isSpaceValid = false
                            } else {
                                isSpaceValid = self.grid[y][x] == .Dead || tetromino.grid[tx][ty] == .Dead
                            }
                            if !isSpaceValid {
                                break
                            }
                        }
                        if !isSpaceValid {
                            break
                        }
                    }
                    if isSpaceValid {
                        foundSpace = true
                        break
                    }
                }
                if foundSpace {
                    break
                }
            }
            if !foundSpace {
                nFound -= 1
            }
        }
        
        if nFound == 0 {
            self.gameState = .GameOver
            
            for nodeArr in self.gridNodes {
                for node in nodeArr {
                    node?.physicsBody?.allowsRotation = true
                    node?.physicsBody?.isDynamic = true
                    node?.physicsBody?.applyImpulse(CGVector(dx: (-25...25).randomElement()!, dy: 25))
                    node?.physicsBody?.applyAngularImpulse(CGFloat((-25...25).randomElement()!))
                    
                    node?.run(SKAction.sequence([
                        SKAction.wait(forDuration: 6),
                        SKAction.run {
                            node?.removeFromParent()
                        }
                    ]))
                }
            }
            self.gridNodes = [[]]
            
            for tetromino in self.tetrominos {
                for node in tetromino.nodes {
                    node.run(SKAction.sequence([
                        SKAction.fadeOut(withDuration: 1.0),
                        SKAction.run {
                            node.removeFromParent()
                        }
                    ]))
                }
                tetromino.nodes = []
            }
            
            for x in 0...8 {
                self.gridNodes.append([])
                for y in 0...8 {
                    self.run(SKAction.sequence([
                        SKAction.wait(forDuration: Double(arc4random()) / 0xFFFFFFFF),
                        SKAction.run {
                            let node = SKSpriteNode(texture: self.blockTextures[(0...5).randomElement()!])
                            node.zPosition = BlockLayer.Blocks.rawValue
                            node.position = CGPoint(x: self.gridOffsetTopLeft.x + CGFloat(x * 32) + 16,
                                                    y: self.gridOffsetTopLeft.y - CGFloat(y * 32) - 16)
                            self.gridNodes[x].append(node)
                            self.addChild(node)
                        }
                    ]))
                }
            }
            
            self.fadeOutScreen = SKShapeNode(rect: CGRect(origin: CGPoint(x: -self.size.width / 2, y: -self.size.height / 2), size: self.size))
            self.fadeOutScreen?.fillColor = .black
            self.fadeOutScreen?.strokeColor = .black
            self.fadeOutScreen?.alpha = 0
            self.fadeOutScreen?.zPosition = BlockLayer.fadeOutScreen.rawValue
            self.addChild(self.fadeOutScreen!)
            self.fadeOutScreen?.run(SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                SKAction.fadeAlpha(to: 0.85, duration: 0.5)
            ]))
            
            self.gameOverLabel = SKLabelNode(text: "GAME OVER!")
            self.gameOverLabel?.fontColor = .white
            self.gameOverLabel?.fontSize = 32
            self.gameOverLabel?.position = CGPoint(x: 0, y: self.size.height)
            self.gameOverLabel?.zPosition = BlockLayer.topLayer.rawValue
            self.addChild(self.gameOverLabel!)
            self.gameOverLabel?.run(SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                SKAction.moveTo(y: 100, duration: 0.5)
            ]))
            
            self.newGameLabel = SKLabelNode(text: "Restart")
            self.newGameLabel?.fontColor = .white
            self.newGameLabel?.fontSize = 24
            self.newGameLabel?.position = CGPoint(x: -100, y: -self.size.height)
            self.newGameLabel?.zPosition = BlockLayer.topLayer.rawValue
            self.addChild(self.newGameLabel!)
            self.newGameLabel?.run(SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                SKAction.moveTo(y: 0, duration: 0.5)
            ]))
            
            self.mainMenuLabel = SKLabelNode(text: "Quit")
            self.mainMenuLabel?.fontColor = .white
            self.mainMenuLabel?.fontSize = 24
            self.mainMenuLabel?.position = CGPoint(x: 100, y: -self.size.height)
            self.mainMenuLabel?.zPosition = BlockLayer.topLayer.rawValue
            self.addChild(self.mainMenuLabel!)
            self.mainMenuLabel?.run(SKAction.sequence([
                SKAction.wait(forDuration: 1.0),
                SKAction.moveTo(y: 0, duration: 0.5)
            ]))
        }
    }
    
    func gameOverClickDown(location: CGPoint) {
        
    }
    
    func gameOverClickDrag(location: CGPoint) {
        
    }
    
    func gameOverClickUp(location: CGPoint) {
        if self.mainMenuLabel!.contains(location) {
            
        }
        
        if self.newGameLabel!.contains(location) {
            for row in self.gridNodes {
                for node in row {
                    self.run(SKAction.sequence([
                        SKAction.wait(forDuration: Double(arc4random()) / 0xFFFFFFFF),
                        SKAction.run {
                            node!.removeFromParent()
                        }
                    ]))
                }
            }
            
            self.gameOverLabel?.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.5),
                SKAction.run {
                    self.gameOverLabel?.removeFromParent()
                    self.gameOverLabel = nil
                }
            ]))
            self.newGameLabel?.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.5),
                SKAction.run {
                    self.newGameLabel?.removeFromParent()
                    self.newGameLabel = nil
                }
            ]))
            self.mainMenuLabel?.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.5),
                SKAction.run {
                    self.mainMenuLabel?.removeFromParent()
                    self.mainMenuLabel = nil
                }
            ]))
            
            self.fadeOutScreen?.run(SKAction.sequence([
                SKAction.fadeOut(withDuration: 0.5),
                SKAction.run {
                    self.fadeOutScreen?.removeFromParent()
                    self.fadeOutScreen = nil
                }
            ]))
            
            self.run(SKAction.sequence([
                SKAction.wait(forDuration: 0.5),
                SKAction.run {
                    self.setUpScene()
                    self.gameState = .Playing
                }
            ]))
        }
    }
}

#if os(iOS) || os(tvOS)
// Touch-based event handling
extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            switch self.gameState {
            case .Playing:
                self.playingClickDown(location: event.location(in: self))
            case .GameOver:
                self.gameOverClickDown(location: event.location(in: self))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            switch self.gameState {
            case .Playing:
                self.playingClickDrag(location: event.location(in: self))
            case .GameOver:
                self.gameOverClickDrag(location: event.location(in: self))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            switch self.gameState {
            case .Playing:
                self.playingClickUp(location: event.location(in: self))
            case .GameOver:
                self.gameOverClickUp(location: event.location(in: self))
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            // ???
        }
    }
}
#endif

#if os(OSX)
// Mouse-based event handling
extension GameScene {
    override func mouseDown(with event: NSEvent) {
        switch self.gameState {
        case .Playing:
            self.playingClickDown(location: event.location(in: self))
        case .GameOver:
            self.gameOverClickDown(location: event.location(in: self))
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        switch self.gameState {
        case .Playing:
            self.playingClickDrag(location: event.location(in: self))
        case .GameOver:
            self.gameOverClickDrag(location: event.location(in: self))
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        switch self.gameState {
        case .Playing:
            self.playingClickUp(location: event.location(in: self))
        case .GameOver:
            self.gameOverClickUp(location: event.location(in: self))
        }
    }
}
#endif
