import Felgo 3.0
import QtQuick 2.0

/*/////////////////////////////////////
  NOTE:
  Additional integration steps are needed to use the plugin, for example to add and link required libraries for Android and iOS.
  Please follow the integration steps described in the plugin documentation: https://felgo.com/doc/plugin-admob/


  EXAMPLE USAGE:
  Add the following piece of code inside your main QML { } to display this example page.

  ItemWithAdMobPlugin {

  }

/////////////////////////////////////*/

Rectangle { property string __felgo_live_id_component: "FELGO_COMPONENT_ID_19093"; property string __felgo_live_id_element: "FELGO_ID_19093_956";
    anchors.fill: parent

    // Plugin Item
    AdMobBanner { property string __felgo_live_id_element: "FELGO_ID_19093_957";
        id: adMobBanner
        adUnitId: "	ca-app-pub-3940256099942544/6300978111" // replace with your AdMob adUnitId
        banner: AdMobBanner.Smart

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
    }

    // Plugin Item
    AdMobInterstitial { property string __felgo_live_id_element: "FELGO_ID_19093_958";
        id: interstitial
        adUnitId: "	ca-app-pub-3940256099942544/1033173712" // replace with your AdMob adUnitId
    }

    // AppListView for Plugin Overview and Example Usage
    AppListView { property string __felgo_live_id_element: "FELGO_ID_19093_959";
        id: listView
        anchors.fill: parent
        backgroundColor: parent.color

        // Plugin Overview
        header: Column { property string __felgo_live_id_element: "FELGO_ID_19093_960";
            id: contentCol
            width: parent.width
            spacing: dp(16)

            // Description Text
            Rectangle { property string __felgo_live_id_element: "FELGO_ID_19093_961";
                width: parent.width
                height: descriptionText.height + 2 * contentCol.spacing
                color: "lightgrey"
                AppText { property string __felgo_live_id_element: "FELGO_ID_19093_962";
                    id: descriptionText
                    width: parent.width - 2 * contentCol.spacing
                    text: "Integrate with AdMob to monetize and promote your apps & games with ads on Android and iOS."
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    horizontalAlignment: Text.AlignHCenter
                    anchors.centerIn: parent
                }
            }

            // Image of Code Sample
            Image { property string __felgo_live_id_element: "FELGO_ID_19093_963";
                width: sourceSize.width * dp(1) * 0.75
                height: width / sourceSize.width * sourceSize.height
                source: Qt.resolvedUrl("code-admob.png")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Image of Plugin Logo
            Image { property string __felgo_live_id_element: "FELGO_ID_19093_964";
                width: sourceSize.width * dp(1) * 0.5
                height: width / sourceSize.width * sourceSize.height
                source: Qt.resolvedUrl("logo-admob.png")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Example Headline
            Rectangle { property string __felgo_live_id_element: "FELGO_ID_19093_965";
                width: parent.width
                height: exampleHeadline.height + 2 * contentCol.spacing
                color: "lightgrey"
                AppText { property string __felgo_live_id_element: "FELGO_ID_19093_966";
                    id: exampleHeadline
                    width: parent.width - 2 * contentCol.spacing
                    text: "Example"
                    horizontalAlignment: Text.AlignHCenter
                    anchors.centerIn: parent
                }
            }
        }

        // Example Actions (Content of List)
        model: ListModel { property string __felgo_live_id_element: "FELGO_ID_19093_967";
            id: listModel

            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_968"; section: "Visibility"; current: false; name: "Display banner" }
            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_969"; section: "Visibility"; current: false; name: "Hide banner" }

            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_970"; section: "Banner Type"; current: false; name: "Standard (320 x 50)" }
            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_971"; section: "Banner Type"; current: false; name: "Medium Rectangle (300x250)" }
            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_972"; section: "Banner Type"; current: false; name: "Large (320x100)" }
            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_973"; section: "Banner Type"; current: false; name: "Leaderboard (728x90) - Tablet Only" }
            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_974"; section: "Banner Type"; current: true; name: "Smart (auto-size)" }

            ListElement { property string __felgo_live_id_element: "FELGO_ID_19093_975"; section: "Interstitial"; active: false; name: "Load and show" }
        }

        // Styling of ListView Delegate (List Items)
        delegate: SimpleRow { property string __felgo_live_id_element: "FELGO_ID_19093_976";
            id: row

            text: name
            property bool isSelected: current || (index === 0 && adMobBanner.visible || index === 1 && !adMobBanner.visible)

            Icon { property string __felgo_live_id_element: "FELGO_ID_19093_977";
                anchors.right: parent.right
                anchors.rightMargin: dp(10)
                anchors.verticalCenter: parent.verticalCenter
                icon:  IconType.check
                size: dp(14)
                color: row.style.textColor
                visible: isSelected
            }

            style.showDisclosure: false

            // Execute selected Action for plugin when list item is clicked
            onSelected: {
                // Set selection
                if (index >= 2 && index <= 6) {
                    for(var i = 0; i < listModel.count; i++) {
                        listModel.setProperty(i, "current", i === index ? true : false)
                    }
                }

                // Visibility
                if (index === 0) {
                    adMobBanner.visible = true
                }
                else if (index === 1) {
                    adMobBanner.visible = false
                }
                // Banner types
                else if (index === 2) {
                    adMobBanner.banner = AdMobBanner.Standard
                }
                else if (index === 3) {
                    adMobBanner.banner = AdMobBanner.Medium
                }
                else if (index === 4) {
                    adMobBanner.banner = AdMobBanner.Large
                }
                else if (index === 5) {
                    adMobBanner.banner = AdMobBanner.LeaderBoard
                }
                else if (index === 6) {
                    adMobBanner.banner = AdMobBanner.Smart
                }
                // Interstitial
                else if (index === 7) {
                    interstitial.showInterstitialIfLoaded()
                }
            }
        }

        // Styling of List Sections
        section.property: "section"
        section.delegate: SimpleSection { property string __felgo_live_id_element: "FELGO_ID_19093_978"; }
    }

    Component.onCompleted: {
        // Cache interstitial
        interstitial.loadInterstitial()
    }
}
