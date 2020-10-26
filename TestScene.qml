import QtQuick 2.0
import Felgo 3.0

Scene { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_19452"; property string __felgo_live_id_element: "FELGO_ID_19452_1112";
    id: scene

    PhysicsWorld { property string __felgo_live_id_element: "FELGO_ID_19452_1113";
        id: world
        running: true
        gravity.y: 9.81 // earth gravity
        z: 10 // draw the debugDraw on top of the entities

        // set this to true to see the debug draw of the physics system
        // this displays all bodies, joints and forces which is great for debugging
        debugDrawVisible: true
    }

    EntityManager { property string __felgo_live_id_element: "FELGO_ID_19452_1114";
        id: entityManager
        entityContainer: scene
    }

    // TODO add your own entities here!

    // Just a simple box
    EntityBase { property string __felgo_live_id_element: "FELGO_ID_19452_1115";
        entityType: "box"

        Rectangle { property string __felgo_live_id_element: "FELGO_ID_19452_1116";
            id: rect
            color: "red"
            width: 20
            height: 20
        }
        BoxCollider { property string __felgo_live_id_element: "FELGO_ID_19452_1117";
            anchors.fill: rect
        }
    }

    // The ground, so the box doesn't fall out of the screen
    EntityBase { property string __felgo_live_id_element: "FELGO_ID_19452_1118";
        entityId: "ground1"
        entityType: "ground"
        height: 20
        anchors {
            bottom: scene.bottom
            left: scene.left
            right: scene.right
        }

        Rectangle { property string __felgo_live_id_element: "FELGO_ID_19452_1119";
            anchors.fill: parent
            color: "blue"
        }

        BoxCollider { property string __felgo_live_id_element: "FELGO_ID_19452_1120";
            anchors.fill: parent
            bodyType: Body.Static // the body shouldn't move
        }
    }
}
