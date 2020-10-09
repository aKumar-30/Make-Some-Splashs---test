import QtQuick 2.0
import Felgo 3.0

Scene {
    id: scene

    PhysicsWorld {
        id: world
        running: true
        gravity.y: 9.81 // earth gravity
        z: 10 // draw the debugDraw on top of the entities

        // set this to true to see the debug draw of the physics system
        // this displays all bodies, joints and forces which is great for debugging
        debugDrawVisible: true
    }

    EntityManager {
        id: entityManager
        entityContainer: scene
    }

    // TODO add your own entities here!

    // Just a simple box
    EntityBase {
        entityType: "box"

        Rectangle {
            id: rect
            color: "red"
            width: 20
            height: 20
        }
        BoxCollider {
            anchors.fill: rect
        }
    }

    // The ground, so the box doesn't fall out of the screen
    EntityBase {
        entityId: "ground1"
        entityType: "ground"
        height: 20
        anchors {
            bottom: scene.bottom
            left: scene.left
            right: scene.right
        }

        Rectangle {
            anchors.fill: parent
            color: "blue"
        }

        BoxCollider {
            anchors.fill: parent
            bodyType: Body.Static // the body shouldn't move
        }
    }
}
