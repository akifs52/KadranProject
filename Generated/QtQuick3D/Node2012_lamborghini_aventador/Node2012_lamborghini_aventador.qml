import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    property url textureData: "maps/textureData.png"
    property url textureData24: "maps/textureData24.png"
    property url textureData57: "maps/textureData57.png"
    property url textureData14: "maps/textureData14.png"
    property url textureData78: "maps/textureData78.png"
    property url textureData19: "maps/textureData19.png"
    property url textureData48: "maps/textureData48.png"
    property url textureData84: "maps/textureData84.png"
    property url textureData109: "maps/textureData109.png"
    Texture {
        id: _2_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData19
    }
    Texture {
        id: _3_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData24
    }
    Texture {
        id: _0_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData
    }
    Texture {
        id: _1_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData14
    }
    Texture {
        id: _6_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData78
    }
    Texture {
        id: _5_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData57
    }
    Texture {
        id: _4_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData48
    }
    Texture {
        id: _7_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData84
    }
    Texture {
        id: _8_texture
        generateMipmaps: true
        mipFilter: Texture.Linear
        source: node.textureData109
    }

    // Nodes:
    Node {
        id: sketchfab_model
        objectName: "Sketchfab_model"
        rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
        Node {
            id: root
            objectName: "root"
            Node {
                id: gltf_SceneRootNode
                objectName: "GLTF_SceneRootNode"
                rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                Node {
                    id: lod_A_WHEEL_mm_wheel_003_0
                    objectName: "LOD_A_WHEEL_mm_wheel.003_0"
                    x: -0.9833799004554749
                    y: 0.3336072564125061
                    z: 1.2223231792449951
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale.x: -1.11979
                    scale.y: -1.11979
                    scale.z: -1.11979
                    Model {
                        id: object_4
                        objectName: "Object_4"
                        source: "meshes/object_0_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_wheel_material
                        ]
                    }
                    Model {
                        id: object_5
                        objectName: "Object_5"
                        source: "meshes/object_1_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_tyre_material
                        ]
                    }
                    Model {
                        id: object_6
                        objectName: "Object_6"
                        source: "meshes/object_2_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                    Model {
                        id: object_7
                        objectName: "Object_7"
                        source: "meshes/object_3_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_rotor_material
                        ]
                    }
                }
                Node {
                    id: lod_A_WHEEL_mm_wheel_002_1
                    objectName: "LOD_A_WHEEL_mm_wheel.002_1"
                    x: -1.0064582824707031
                    y: 0.3336072564125061
                    z: -1.479003667831421
                    rotation: Qt.quaternion(0.707107, -0.707107, 0, 0)
                    scale.x: -1.11979
                    scale.y: -1.11979
                    scale.z: -1.11979
                    Model {
                        id: object_9
                        objectName: "Object_9"
                        source: "meshes/object_4_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_wheel_material
                        ]
                    }
                    Model {
                        id: object_10
                        objectName: "Object_10"
                        source: "meshes/object_5_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_tyre_material
                        ]
                    }
                    Model {
                        id: object_11
                        objectName: "Object_11"
                        source: "meshes/object_6_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                    Model {
                        id: object_12
                        objectName: "Object_12"
                        source: "meshes/object_7_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_rotor_material
                        ]
                    }
                }
                Node {
                    id: lod_A_WHEEL_mm_wheel_001_2
                    objectName: "LOD_A_WHEEL_mm_wheel.001_2"
                    x: 1.0064582824707031
                    y: 0.3336072564125061
                    z: -1.479003667831421
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    scale.x: 1.11979
                    scale.y: 1.11979
                    scale.z: 1.11979
                    Model {
                        id: object_14
                        objectName: "Object_14"
                        source: "meshes/object_8_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_wheel_material
                        ]
                    }
                    Model {
                        id: object_15
                        objectName: "Object_15"
                        source: "meshes/object_9_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_tyre_material
                        ]
                    }
                    Model {
                        id: object_16
                        objectName: "Object_16"
                        source: "meshes/object_10_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                    Model {
                        id: object_17
                        objectName: "Object_17"
                        source: "meshes/object_11_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_rotor_material
                        ]
                    }
                }
                Node {
                    id: lod_A_REARBUMPER_mm_ext_3
                    objectName: "LOD_A_REARBUMPER_mm_ext_3"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_19
                        objectName: "Object_19"
                        source: "meshes/object_12_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_FRONTBUMPER_mm_misc_4
                    scale.z: 0.9
                    scale.y: 1
                    scale.x: 1
                    objectName: "LOD_A_FRONTBUMPER_mm_misc_4"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_21
                        objectName: "Object_21"
                        source: "meshes/object_13_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_DOOR_RIGHT_mm_cab_5
                    objectName: "LOD_A_DOOR_RIGHT_mm_cab_5"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_23
                        objectName: "Object_23"
                        source: "meshes/object_14_mesh.mesh"
                        scale.z: 1
                        scale.y: 1
                        scale.x: 1
                        materials: [
                            vehicle_Exterior_mm_cab_material
                        ]
                    }
                }
                Node {
                    id: lod_A_DOOR_RIGHT_mm_misc_6
                    objectName: "LOD_A_DOOR_RIGHT_mm_misc_6"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_25
                        objectName: "Object_25"
                        source: "meshes/object_15_mesh.mesh"
                        scale.z: 1
                        scale.y: 1
                        scale.x: 1
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_REARBUMPER_mm_misc_7
                    objectName: "LOD_A_REARBUMPER_mm_misc_7"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_27
                        objectName: "Object_27"
                        source: "meshes/object_16_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_WHEEL_mm_wheel_8
                    objectName: "LOD_A_WHEEL_mm_wheel_8"
                    x: 0.9833799004554749
                    y: 0.3336072564125061
                    z: 1.2223231792449951
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    scale.x: 1.11979
                    scale.y: 1.11979
                    scale.z: 1.11979
                    Model {
                        id: object_29
                        objectName: "Object_29"
                        source: "meshes/object_17_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_wheel_material
                        ]
                    }
                    Model {
                        id: object_30
                        objectName: "Object_30"
                        source: "meshes/object_18_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_tyre_material
                        ]
                    }
                    Model {
                        id: object_31
                        objectName: "Object_31"
                        source: "meshes/object_19_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                    Model {
                        id: object_32
                        objectName: "Object_32"
                        source: "meshes/object_20_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_rotor_material
                        ]
                    }
                }
                Node {
                    id: lod_A_CHASSIS_mm_chassis_9
                    objectName: "LOD_A_CHASSIS_mm_chassis_9"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_34
                        objectName: "Object_34"
                        source: "meshes/object_21_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_chassis_material
                        ]
                    }
                }
                Node {
                    id: lod_A_REARBUMPER_mm_badges_10
                    objectName: "LOD_A_REARBUMPER_mm_badges_10"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_36
                        objectName: "Object_36"
                        source: "meshes/object_22_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_badges_material
                        ]
                    }
                }
                Node {
                    id: lod_A_FRONTBUMPER_mm_ext_11
                    objectName: "LOD_A_FRONTBUMPER_mm_ext_11"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_38
                        objectName: "Object_38"
                        source: "meshes/object_23_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_GLASS_FRONT_mm_windows_12
                    objectName: "LOD_A_GLASS_FRONT_mm_windows_12"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_40
                        objectName: "Object_40"
                        source: "meshes/object_24_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_MIRROR_RIGHT_mm_ext_13
                    scale.z: 1
                    scale.y: 1
                    scale.x: 1
                    objectName: "LOD_A_MIRROR_RIGHT_mm_ext_13"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_42
                        objectName: "Object_42"
                        source: "meshes/object_25_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_INTERIOR_mm_cab_14
                    objectName: "LOD_A_INTERIOR_mm_cab_14"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_44
                        objectName: "Object_44"
                        source: "meshes/object_26_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_cab_material
                        ]
                    }
                }
                Node {
                    id: lod_A_GLASS_BOOT_REAR_mm_windows_15
                    objectName: "LOD_A_GLASS_BOOT_REAR_mm_windows_15"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_46
                        objectName: "Object_46"
                        source: "meshes/object_27_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BODY_mm_windows_16
                    objectName: "LOD_A_BODY_mm_windows_16"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_48
                        objectName: "Object_48"
                        source: "meshes/object_28_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_CHASSIS_mm_lights_17
                    objectName: "LOD_A_CHASSIS_mm_lights_17"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_50
                        objectName: "Object_50"
                        source: "meshes/object_29_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_lights_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BRAKES_RIGHT_mm_lights_18
                    objectName: "LOD_A_BRAKES_RIGHT_mm_lights_18"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_52
                        objectName: "Object_52"
                        source: "meshes/object_30_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_lights_material
                        ]
                    }
                }
                Node {
                    id: lod_A_DOOR_RIGHT_mm_ext_19
                    scale.z: 1
                    scale.y: 1
                    scale.x: 1
                    objectName: "LOD_A_DOOR_RIGHT_mm_ext_19"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_54
                        objectName: "Object_54"
                        source: "meshes/object_31_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_MIRROR_RIGHT_mm_misc_20
                    objectName: "LOD_A_MIRROR_RIGHT_mm_misc_20"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_56
                        objectName: "Object_56"
                        source: "meshes/object_32_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_MIRROR_LEFT_mm_ext_21
                    scale.z: 1
                    scale.y: 1
                    scale.x: 1
                    objectName: "LOD_A_MIRROR_LEFT_mm_ext_21"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_58
                        objectName: "Object_58"
                        source: "meshes/object_33_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_TAILLIGHT_LENS_LEFT_mm_windows_22
                    objectName: "LOD_A_TAILLIGHT_LENS_LEFT_mm_windows_22"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_60
                        objectName: "Object_60"
                        source: "meshes/object_34_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BRAKES_LEFT_mm_lights_23
                    objectName: "LOD_A_BRAKES_LEFT_mm_lights_23"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_62
                        objectName: "Object_62"
                        source: "meshes/object_35_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_lights_material
                        ]
                    }
                }
                Node {
                    id: lod_A_GLASS_LEFT_mm_windows_24
                    objectName: "LOD_A_GLASS_LEFT_mm_windows_24"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_64
                        objectName: "Object_64"
                        source: "meshes/object_36_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_DOOR_LEFT_mm_ext_25
                    scale.z: 1
                    scale.y: 1
                    scale.x: 1
                    objectName: "LOD_A_DOOR_LEFT_mm_ext_25"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_66
                        objectName: "Object_66"
                        source: "meshes/object_37_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_GLASS_RIGHT_QUARTER_mm_windows_26
                    objectName: "LOD_A_GLASS_RIGHT_QUARTER_mm_windows_26"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_68
                        objectName: "Object_68"
                        source: "meshes/object_38_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_GLASS_LEFT_QUARTER_mm_windows_27
                    objectName: "LOD_A_GLASS_LEFT_QUARTER_mm_windows_27"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_70
                        objectName: "Object_70"
                        source: "meshes/object_39_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_HEADLIGHT_LENS_LEFT_mm_windows_28
                    objectName: "LOD_A_HEADLIGHT_LENS_LEFT_mm_windows_28"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_72
                        objectName: "Object_72"
                        source: "meshes/object_40_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_DOOR_LEFT_mm_misc_29
                    objectName: "LOD_A_DOOR_LEFT_mm_misc_29"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_74
                        objectName: "Object_74"
                        source: "meshes/object_41_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BOOT_mm_misc_30
                    objectName: "LOD_A_BOOT_mm_misc_30"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_76
                        objectName: "Object_76"
                        source: "meshes/object_42_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_MIRROR_GLASS_RIGHT_mm_ext_31
                    objectName: "LOD_A_MIRROR_GLASS_RIGHT_mm_ext_31"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_78
                        objectName: "Object_78"
                        source: "meshes/object_43_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_FRONTBUMPER_mm_badges_32
                    objectName: "LOD_A_FRONTBUMPER_mm_badges_32"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_80
                        objectName: "Object_80"
                        source: "meshes/object_44_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_badges_material
                        ]
                    }
                }
                Node {
                    id: lod_A_EXHAUST_mm_ext_33
                    objectName: "LOD_A_EXHAUST_mm_ext_33"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_82
                        objectName: "Object_82"
                        source: "meshes/object_45_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_MIRROR_GLASS_LEFT_mm_ext_34
                    objectName: "LOD_A_MIRROR_GLASS_LEFT_mm_ext_34"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_84
                        objectName: "Object_84"
                        source: "meshes/object_46_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_TAILLIGHT_LENS_RIGHT_mm_windows_35
                    objectName: "LOD_A_TAILLIGHT_LENS_RIGHT_mm_windows_35"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_86
                        objectName: "Object_86"
                        source: "meshes/object_47_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BODY_mm_lights_36
                    objectName: "LOD_A_BODY_mm_lights_36"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_88
                        objectName: "Object_88"
                        source: "meshes/object_48_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_lights_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BOOT_mm_ext_37
                    objectName: "LOD_A_BOOT_mm_ext_37"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_90
                        objectName: "Object_90"
                        source: "meshes/object_49_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BODY_mm_ext_38
                    objectName: "LOD_A_BODY_mm_ext_38"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_92
                        objectName: "Object_92"
                        source: "meshes/object_50_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
                Node {
                    id: lod_A_MIRROR_LEFT_mm_misc_39
                    objectName: "LOD_A_MIRROR_LEFT_mm_misc_39"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_94
                        objectName: "Object_94"
                        source: "meshes/object_51_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_REARBUMPER_mm_chassis_40
                    objectName: "LOD_A_REARBUMPER_mm_chassis_40"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_96
                        objectName: "Object_96"
                        source: "meshes/object_52_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_chassis_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BODY_mm_misc_41
                    objectName: "LOD_A_BODY_mm_misc_41"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_98
                        objectName: "Object_98"
                        source: "meshes/object_53_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_misc_material
                        ]
                    }
                }
                Node {
                    id: lod_A_GLASS_RIGHT_mm_windows_42
                    objectName: "LOD_A_GLASS_RIGHT_mm_windows_42"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_100
                        objectName: "Object_100"
                        source: "meshes/object_54_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_DOOR_LEFT_mm_cab_43
                    objectName: "LOD_A_DOOR_LEFT_mm_cab_43"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_102
                        objectName: "Object_102"
                        source: "meshes/object_55_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_cab_material
                        ]
                    }
                }
                Node {
                    id: lod_A_BODY_mm_badges_44
                    objectName: "LOD_A_BODY_mm_badges_44"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_104
                        objectName: "Object_104"
                        source: "meshes/object_56_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_badges_material
                        ]
                    }
                }
                Node {
                    id: lod_A_HEADLIGHT_LENS_RIGHT_mm_windows_45
                    objectName: "LOD_A_HEADLIGHT_LENS_RIGHT_mm_windows_45"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_106
                        objectName: "Object_106"
                        source: "meshes/object_57_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_windows_material
                        ]
                    }
                }
                Node {
                    id: lod_A_HOOD_mm_ext_46
                    objectName: "LOD_A_HOOD_mm_ext_46"
                    rotation: Qt.quaternion(0.707107, 0.707107, 0, 0)
                    Model {
                        id: object_108
                        objectName: "Object_108"
                        source: "meshes/object_58_mesh.mesh"
                        materials: [
                            vehicle_Exterior_mm_ext_material
                        ]
                    }
                }
            }
        }
    }

    Node {
        id: __materialLibrary__

        PrincipledMaterial {
            id: vehicle_Exterior_mm_misc_material
            objectName: "Vehicle_Exterior_mm_misc"
            baseColorMap: _2_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_rotor_material
            objectName: "Vehicle_Exterior_mm_rotor"
            baseColorMap: _3_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_ext_material
            objectName: "Vehicle_Exterior_mm_ext"
            baseColorMap: _4_texture
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_cab_material
            objectName: "Vehicle_Exterior_mm_cab"
            baseColorMap: _5_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_chassis_material
            objectName: "Vehicle_Exterior_mm_chassis"
            baseColorMap: _6_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_badges_material
            objectName: "Vehicle_Exterior_mm_badges"
            baseColorMap: _7_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_wheel_material
            objectName: "Vehicle_Exterior_mm_wheel"
            baseColorMap: _0_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_windows_material
            objectName: "Vehicle_Exterior_mm_windows"
            baseColor: "#40cccccc"
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Blend
            transmissionFactor: 1
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_lights_material
            objectName: "Vehicle_Exterior_mm_lights"
            baseColorMap: _8_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }

        PrincipledMaterial {
            id: vehicle_Exterior_mm_tyre_material
            objectName: "Vehicle_Exterior_mm_tyre"
            baseColorMap: _1_texture
            roughness: 0.5
            cullMode: PrincipledMaterial.NoCulling
            alphaMode: PrincipledMaterial.Opaque
        }
    }

    // Animations:
}
