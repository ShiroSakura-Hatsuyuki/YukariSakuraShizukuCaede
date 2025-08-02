// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "YukariSakuraShizukuCaedeArt",
    
    products: [
        //产品定义了一个包所生成的可执行文件和库，使它们对其他包可见。
        .library(
            name: "YukariSakuraShizukuCaedeArt",
            targets: ["YukariSakuraShizukuCaedeArt","Fujisan"]
        ),

        .executable(
            name: "ExampleAla",
            targets: ["Ala"]
        )
    ],
    
    dependencies: [
        //依赖项是其他包的引用，这些包可以在构建时使用。
        //在这里添加其他依赖项。
    ],

    targets: [
        //目标是包的基本构建块，定义一个模块或测试套件。
        //目标可以依赖于该包中的其他目标和依赖项的产品。
        .target(
            name: "YukariSakuraShizukuCaedeArt",
            dependencies: ["Fujisan"],
            path:"Sources/YukariSakuraShizukuCaedeArt",
        ),

        .executableTarget(
            name:"Ala",
            dependencies:["YukariSakuraShizukuCaedeArt"],
            path: "Sources/Ala",
        ),

        .target(
            name: "Fujisan",
            path: "Sources/Fujisan",
            publicHeadersPath: "Include"
        )

    ]

)

var fujisanCxxSettings: [CXXSetting] = [
    
]