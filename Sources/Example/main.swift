//
//  main.swift
//
//  Created by 方泓睿 on 2021/8/3.
//

import Foundation
import Skoptsy


// In this usage example three trails run concurrently for several ticks
// as determined by the first strong trail before printing "done".
// The second trail prints a message every third tick and the last trail every second tick.


let p = Module { name in
    activity(name.Wait, [name.ticks]) { val in
        exec { val.i = val.ticks as Int }
        `while` { val.i > 0 } repeat: {
            exec { val.i -= 1 }
            `await` { true }
        }
    }
    activity(name.Main, []) { val in
        cobegin {
            strong {
                run(name.Wait, [10])
            }
            weak {
                `repeat` {
                    run(name.Wait, [2])
                    exec { print("on every third") }
                    `await` { true }
                }
            }
            weak {
                `repeat` {
                    run(name.Wait, [1])
                    exec { print("on every second") }
                    `await` { true }
                }
            }
        }
        exec { print("done") }
    }
}.makeProcessor()!

while true {
    print("--> tick")
    guard try p.tick([], []) != .done else {
        break
    }
}

