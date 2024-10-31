; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [152 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [304 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 117
	i32 26230656, ; 1: Microsoft.Extensions.DependencyModel => 0x1903f80 => 48
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 58
	i32 42639949, ; 3: System.Threading.Thread => 0x28aa24d => 140
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 5: Microsoft.Maui.Graphics.dll => 0x44bb714 => 57
	i32 117431740, ; 6: System.Runtime.InteropServices => 0x6ffddbc => 129
	i32 159306688, ; 7: System.ComponentModel.Annotations => 0x97ed3c0 => 99
	i32 165246403, ; 8: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 68
	i32 182336117, ; 9: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 86
	i32 195452805, ; 10: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 11: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 12: System.ComponentModel => 0xc38ff48 => 102
	i32 230752869, ; 13: Microsoft.CSharp.dll => 0xdc10265 => 93
	i32 246610117, ; 14: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 126
	i32 280992041, ; 15: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 16: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 17: Xamarin.AndroidX.Activity.dll => 0x13031348 => 64
	i32 336156722, ; 18: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 75
	i32 347068432, ; 20: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 62
	i32 356389973, ; 21: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 374914964, ; 22: System.Transactions.Local => 0x1658bf94 => 142
	i32 379916513, ; 23: System.Threading.Thread.dll => 0x16a510e1 => 140
	i32 385762202, ; 24: System.Memory.dll => 0x16fe439a => 115
	i32 395744057, ; 25: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 26: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 27: System.Collections => 0x1a61054f => 98
	i32 450948140, ; 28: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 74
	i32 459347974, ; 29: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 133
	i32 469710990, ; 30: System.dll => 0x1bff388e => 146
	i32 498788369, ; 31: System.ObjectModel => 0x1dbae811 => 121
	i32 500358224, ; 32: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 33: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 34: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 52
	i32 530272170, ; 35: System.Linq.Queryable => 0x1f9b4faa => 113
	i32 539058512, ; 36: Microsoft.Extensions.Logging => 0x20216150 => 49
	i32 592146354, ; 37: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 38: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 39: Xamarin.AndroidX.CustomView => 0x2568904f => 72
	i32 627931235, ; 40: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 41: System.Text.Encodings.Web.dll => 0x27787397 => 137
	i32 672442732, ; 42: System.Collections.Concurrent => 0x2814a96c => 94
	i32 688181140, ; 43: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 44: System.Xml.Linq.dll => 0x29293ff5 => 143
	i32 703866210, ; 45: PokedexApp.dll => 0x29f42562 => 92
	i32 706645707, ; 46: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 47: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 48: System.Runtime.Loader.dll => 0x2b15ed29 => 130
	i32 748832960, ; 49: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 60
	i32 759454413, ; 50: System.Net.Requests => 0x2d445acd => 119
	i32 775507847, ; 51: System.IO.Compression => 0x2e394f87 => 111
	i32 777317022, ; 52: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 53: Microsoft.Extensions.Options => 0x2f0980eb => 51
	i32 804715423, ; 54: System.Data.Common => 0x2ff6fb9f => 104
	i32 820971774, ; 55: PokedexApp => 0x30ef08fe => 92
	i32 823281589, ; 56: System.Private.Uri.dll => 0x311247b5 => 122
	i32 830298997, ; 57: System.IO.Compression.Brotli => 0x317d5b75 => 110
	i32 904024072, ; 58: System.ComponentModel.Primitives.dll => 0x35e25008 => 100
	i32 926902833, ; 59: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 60: Newtonsoft.Json => 0x38f24a24 => 58
	i32 967690846, ; 61: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 75
	i32 975236339, ; 62: System.Diagnostics.Tracing => 0x3a20ecf3 => 107
	i32 975874589, ; 63: System.Xml.XDocument => 0x3a2aaa1d => 145
	i32 992768348, ; 64: System.Collections.dll => 0x3b2c715c => 98
	i32 1012816738, ; 65: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 85
	i32 1019214401, ; 66: System.Drawing => 0x3cbffa41 => 109
	i32 1028951442, ; 67: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 47
	i32 1029334545, ; 68: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 69: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 65
	i32 1036536393, ; 70: System.Drawing.Primitives.dll => 0x3dc84a49 => 108
	i32 1044663988, ; 71: System.Linq.Expressions.dll => 0x3e444eb4 => 112
	i32 1052210849, ; 72: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 77
	i32 1082857460, ; 73: System.ComponentModel.TypeConverter => 0x408b17f4 => 101
	i32 1084122840, ; 74: Xamarin.Kotlin.StdLib => 0x409e66d8 => 90
	i32 1098259244, ; 75: System => 0x41761b2c => 146
	i32 1118262833, ; 76: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1157931901, ; 77: Microsoft.EntityFrameworkCore.Abstractions => 0x4504a37d => 39
	i32 1168523401, ; 78: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 79: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 82
	i32 1202000627, ; 80: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x47a512f3 => 39
	i32 1203215381, ; 81: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1204575371, ; 82: Microsoft.Extensions.Caching.Memory.dll => 0x47cc5c8b => 43
	i32 1234928153, ; 83: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 84: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 85: SQLitePCLRaw.core.dll => 0x4d0585a0 => 61
	i32 1293217323, ; 86: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 73
	i32 1324164729, ; 87: System.Linq => 0x4eed2679 => 114
	i32 1373134921, ; 88: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 89: Xamarin.AndroidX.SavedState => 0x52114ed3 => 85
	i32 1406073936, ; 90: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 69
	i32 1408764838, ; 91: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 132
	i32 1430672901, ; 92: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 93: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 94: System.Collections.Immutable.dll => 0x5718a9ef => 95
	i32 1462112819, ; 95: System.IO.Compression.dll => 0x57261233 => 111
	i32 1469204771, ; 96: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 66
	i32 1470490898, ; 97: Microsoft.Extensions.Primitives => 0x57a5e912 => 52
	i32 1479771757, ; 98: System.Collections.Immutable => 0x5833866d => 95
	i32 1480492111, ; 99: System.IO.Compression.Brotli.dll => 0x583e844f => 110
	i32 1490351284, ; 100: Microsoft.Data.Sqlite.dll => 0x58d4f4b4 => 37
	i32 1493001747, ; 101: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 102: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 103: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 139
	i32 1551623176, ; 104: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 105: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 79
	i32 1624863272, ; 106: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 88
	i32 1634654947, ; 107: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 108: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 71
	i32 1639515021, ; 109: System.Net.Http.dll => 0x61b9038d => 116
	i32 1639986890, ; 110: System.Text.RegularExpressions => 0x61c036ca => 139
	i32 1657153582, ; 111: System.Runtime => 0x62c6282e => 134
	i32 1658251792, ; 112: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 89
	i32 1677501392, ; 113: System.Net.Primitives.dll => 0x63fca3d0 => 118
	i32 1679769178, ; 114: System.Security.Cryptography => 0x641f3e5a => 135
	i32 1688112883, ; 115: Microsoft.Data.Sqlite => 0x649e8ef3 => 37
	i32 1689493916, ; 116: Microsoft.EntityFrameworkCore.dll => 0x64b3a19c => 38
	i32 1711441057, ; 117: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 62
	i32 1729485958, ; 118: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 67
	i32 1736233607, ; 119: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 120: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 121: System.Transactions.Local.dll => 0x67fe8db2 => 142
	i32 1763938596, ; 122: System.Diagnostics.TraceSource.dll => 0x69239124 => 106
	i32 1766324549, ; 123: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 86
	i32 1770582343, ; 124: Microsoft.Extensions.Logging.dll => 0x6988f147 => 49
	i32 1780572499, ; 125: Mono.Android.Runtime.dll => 0x6a216153 => 150
	i32 1782862114, ; 126: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 127: Xamarin.AndroidX.Fragment => 0x6a96652d => 74
	i32 1793755602, ; 128: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 129: Xamarin.AndroidX.Loader => 0x6bcd3296 => 79
	i32 1813058853, ; 130: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 90
	i32 1813201214, ; 131: Xamarin.Google.Android.Material => 0x6c13413e => 89
	i32 1818569960, ; 132: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 83
	i32 1824175904, ; 133: System.Text.Encoding.Extensions => 0x6cbab720 => 136
	i32 1824722060, ; 134: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 132
	i32 1828688058, ; 135: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 50
	i32 1842015223, ; 136: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 137: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 138: System.Linq.Expressions => 0x6ec71a65 => 112
	i32 1870277092, ; 139: System.Reflection.Primitives => 0x6f7a29e4 => 127
	i32 1875935024, ; 140: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1886040351, ; 141: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x706ab11f => 41
	i32 1910275211, ; 142: System.Collections.NonGeneric.dll => 0x71dc7c8b => 96
	i32 1939592360, ; 143: System.Private.Xml.Linq => 0x739bd4a8 => 123
	i32 1968388702, ; 144: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 44
	i32 2003115576, ; 145: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2014489277, ; 146: Microsoft.EntityFrameworkCore.Sqlite => 0x7812aabd => 41
	i32 2019465201, ; 147: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 77
	i32 2025202353, ; 148: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 149: System.Private.Xml => 0x79eb68ee => 124
	i32 2055257422, ; 150: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 76
	i32 2066184531, ; 151: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 152: System.Diagnostics.TraceSource => 0x7b6f419e => 106
	i32 2079903147, ; 153: System.Runtime.dll => 0x7bf8cdab => 134
	i32 2090596640, ; 154: System.Numerics.Vectors => 0x7c9bf920 => 120
	i32 2103459038, ; 155: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 63
	i32 2127167465, ; 156: System.Console => 0x7ec9ffe9 => 103
	i32 2142473426, ; 157: System.Collections.Specialized => 0x7fb38cd2 => 97
	i32 2159891885, ; 158: Microsoft.Maui => 0x80bd55ad => 55
	i32 2169148018, ; 159: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 160: Microsoft.Extensions.Options.dll => 0x820d22b3 => 51
	i32 2192057212, ; 161: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 50
	i32 2193016926, ; 162: System.ObjectModel.dll => 0x82b6c85e => 121
	i32 2197979891, ; 163: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 48
	i32 2201107256, ; 164: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 91
	i32 2201231467, ; 165: System.Net.Http => 0x8334206b => 116
	i32 2207618523, ; 166: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2252897993, ; 167: Microsoft.EntityFrameworkCore => 0x86487ec9 => 38
	i32 2266799131, ; 168: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 45
	i32 2270573516, ; 169: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 170: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 84
	i32 2303942373, ; 171: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 172: System.Private.CoreLib.dll => 0x896b7878 => 148
	i32 2340441535, ; 173: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 128
	i32 2353062107, ; 174: System.Net.Primitives => 0x8c40e0db => 118
	i32 2368005991, ; 175: System.Xml.ReaderWriter.dll => 0x8d24e767 => 144
	i32 2371007202, ; 176: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 44
	i32 2395872292, ; 177: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 178: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 179: System.Console.dll => 0x912896e5 => 103
	i32 2465273461, ; 180: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 60
	i32 2471841756, ; 181: netstandard.dll => 0x93554fdc => 147
	i32 2475788418, ; 182: Java.Interop.dll => 0x93918882 => 149
	i32 2480646305, ; 183: Microsoft.Maui.Controls => 0x93dba8a1 => 53
	i32 2538310050, ; 184: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 126
	i32 2550873716, ; 185: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 186: Microsoft.CSharp => 0x98ba5a04 => 93
	i32 2570120770, ; 187: System.Text.Encodings.Web => 0x9930ee42 => 137
	i32 2585220780, ; 188: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 136
	i32 2593496499, ; 189: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 190: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 91
	i32 2617129537, ; 191: System.Private.Xml.dll => 0x9bfe3a41 => 124
	i32 2620871830, ; 192: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 71
	i32 2626831493, ; 193: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2634653062, ; 194: Microsoft.EntityFrameworkCore.Relational.dll => 0x9d099d86 => 40
	i32 2663698177, ; 195: System.Runtime.Loader => 0x9ec4cf01 => 130
	i32 2664396074, ; 196: System.Xml.XDocument.dll => 0x9ecf752a => 145
	i32 2665622720, ; 197: System.Drawing.Primitives => 0x9ee22cc0 => 108
	i32 2676780864, ; 198: System.Data.Common.dll => 0x9f8c6f40 => 104
	i32 2724373263, ; 199: System.Runtime.Numerics.dll => 0xa262a30f => 131
	i32 2732626843, ; 200: Xamarin.AndroidX.Activity => 0xa2e0939b => 64
	i32 2737747696, ; 201: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 66
	i32 2752995522, ; 202: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 203: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 54
	i32 2764765095, ; 204: Microsoft.Maui.dll => 0xa4caf7a7 => 55
	i32 2778768386, ; 205: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 87
	i32 2785988530, ; 206: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 207: Microsoft.Maui.Graphics => 0xa7008e0b => 57
	i32 2806116107, ; 208: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 209: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 69
	i32 2831556043, ; 210: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2847789619, ; 211: Microsoft.EntityFrameworkCore.Relational => 0xa9bdd233 => 40
	i32 2853208004, ; 212: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 87
	i32 2861189240, ; 213: Microsoft.Maui.Essentials => 0xaa8a4878 => 56
	i32 2868488919, ; 214: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2909740682, ; 215: System.Private.CoreLib => 0xad6f1e8a => 148
	i32 2916838712, ; 216: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 88
	i32 2919462931, ; 217: System.Numerics.Vectors.dll => 0xae037813 => 120
	i32 2959614098, ; 218: System.ComponentModel.dll => 0xb0682092 => 102
	i32 2978675010, ; 219: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 73
	i32 3038032645, ; 220: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 221: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 80
	i32 3059408633, ; 222: Mono.Android.Runtime => 0xb65adef9 => 150
	i32 3059793426, ; 223: System.ComponentModel.Primitives => 0xb660be12 => 100
	i32 3069363400, ; 224: Microsoft.Extensions.Caching.Abstractions.dll => 0xb6f2c4c8 => 42
	i32 3077302341, ; 225: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3147165239, ; 226: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 107
	i32 3159123045, ; 227: System.Reflection.Primitives.dll => 0xbc4c6465 => 127
	i32 3178803400, ; 228: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 81
	i32 3195844289, ; 229: Microsoft.Extensions.Caching.Abstractions => 0xbe7cb6c1 => 42
	i32 3220365878, ; 230: System.Threading => 0xbff2e236 => 141
	i32 3258312781, ; 231: Xamarin.AndroidX.CardView => 0xc235e84d => 67
	i32 3265493905, ; 232: System.Linq.Queryable.dll => 0xc2a37b91 => 113
	i32 3280506390, ; 233: System.ComponentModel.Annotations.dll => 0xc3888e16 => 99
	i32 3286872994, ; 234: SQLite-net.dll => 0xc3e9b3a2 => 59
	i32 3305363605, ; 235: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 236: System.Net.Requests.dll => 0xc5b097e4 => 119
	i32 3317135071, ; 237: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 72
	i32 3346324047, ; 238: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 82
	i32 3357674450, ; 239: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 240: System.Text.Json => 0xc82afec1 => 138
	i32 3360279109, ; 241: SQLitePCLRaw.core => 0xc849ca45 => 61
	i32 3362522851, ; 242: Xamarin.AndroidX.Core => 0xc86c06e3 => 70
	i32 3366347497, ; 243: Java.Interop => 0xc8a662e9 => 149
	i32 3374999561, ; 244: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 84
	i32 3381016424, ; 245: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 246: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 46
	i32 3430777524, ; 247: netstandard => 0xcc7d82b4 => 147
	i32 3463511458, ; 248: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 249: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 101
	i32 3476120550, ; 250: Mono.Android => 0xcf3163e6 => 151
	i32 3479583265, ; 251: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 252: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 253: System.Text.Json.dll => 0xcfbaacae => 138
	i32 3509114376, ; 254: System.Xml.Linq => 0xd128d608 => 143
	i32 3580758918, ; 255: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 256: System.Linq.dll => 0xd715a361 => 114
	i32 3624195450, ; 257: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 128
	i32 3641597786, ; 258: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 76
	i32 3643446276, ; 259: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 260: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 81
	i32 3657292374, ; 261: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 45
	i32 3660523487, ; 262: System.Net.NetworkInformation => 0xda2f27df => 117
	i32 3672681054, ; 263: Mono.Android.dll => 0xdae8aa5e => 151
	i32 3697841164, ; 264: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 265: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 80
	i32 3748608112, ; 266: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 105
	i32 3754567612, ; 267: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 63
	i32 3786282454, ; 268: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 68
	i32 3792276235, ; 269: System.Collections.NonGeneric => 0xe2098b0b => 96
	i32 3802395368, ; 270: System.Collections.Specialized.dll => 0xe2a3f2e8 => 97
	i32 3817368567, ; 271: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 272: System.Security.Cryptography.dll => 0xe3df9d2b => 135
	i32 3841636137, ; 273: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 47
	i32 3849253459, ; 274: System.Runtime.InteropServices.dll => 0xe56ef253 => 129
	i32 3876362041, ; 275: SQLite-net => 0xe70c9739 => 59
	i32 3889960447, ; 276: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 277: System.Collections.Concurrent.dll => 0xe839deed => 94
	i32 3896760992, ; 278: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 70
	i32 3928044579, ; 279: System.Xml.ReaderWriter => 0xea213423 => 144
	i32 3931092270, ; 280: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 83
	i32 3955647286, ; 281: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 65
	i32 3980434154, ; 282: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 283: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 284: System.Memory => 0xeff49a63 => 115
	i32 4046471985, ; 285: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 54
	i32 4054681211, ; 286: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 125
	i32 4068434129, ; 287: System.Private.Xml.Linq.dll => 0xf27f60d1 => 123
	i32 4073602200, ; 288: System.Threading.dll => 0xf2ce3c98 => 141
	i32 4094352644, ; 289: Microsoft.Maui.Essentials.dll => 0xf40add04 => 56
	i32 4099507663, ; 290: System.Drawing.dll => 0xf45985cf => 109
	i32 4100113165, ; 291: System.Private.Uri => 0xf462c30d => 122
	i32 4101842092, ; 292: Microsoft.Extensions.Caching.Memory => 0xf47d24ac => 43
	i32 4102112229, ; 293: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 294: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 295: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 46
	i32 4147896353, ; 296: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 125
	i32 4150914736, ; 297: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 298: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 133
	i32 4182413190, ; 299: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 78
	i32 4213026141, ; 300: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 105
	i32 4271975918, ; 301: Microsoft.Maui.Controls.dll => 0xfea12dee => 53
	i32 4274976490, ; 302: System.Runtime.Numerics => 0xfecef6ea => 131
	i32 4292120959 ; 303: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 78
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [304 x i32] [
	i32 117, ; 0
	i32 48, ; 1
	i32 58, ; 2
	i32 140, ; 3
	i32 33, ; 4
	i32 57, ; 5
	i32 129, ; 6
	i32 99, ; 7
	i32 68, ; 8
	i32 86, ; 9
	i32 30, ; 10
	i32 31, ; 11
	i32 102, ; 12
	i32 93, ; 13
	i32 126, ; 14
	i32 2, ; 15
	i32 30, ; 16
	i32 64, ; 17
	i32 15, ; 18
	i32 75, ; 19
	i32 62, ; 20
	i32 14, ; 21
	i32 142, ; 22
	i32 140, ; 23
	i32 115, ; 24
	i32 34, ; 25
	i32 26, ; 26
	i32 98, ; 27
	i32 74, ; 28
	i32 133, ; 29
	i32 146, ; 30
	i32 121, ; 31
	i32 13, ; 32
	i32 7, ; 33
	i32 52, ; 34
	i32 113, ; 35
	i32 49, ; 36
	i32 21, ; 37
	i32 35, ; 38
	i32 72, ; 39
	i32 19, ; 40
	i32 137, ; 41
	i32 94, ; 42
	i32 1, ; 43
	i32 143, ; 44
	i32 92, ; 45
	i32 16, ; 46
	i32 4, ; 47
	i32 130, ; 48
	i32 60, ; 49
	i32 119, ; 50
	i32 111, ; 51
	i32 25, ; 52
	i32 51, ; 53
	i32 104, ; 54
	i32 92, ; 55
	i32 122, ; 56
	i32 110, ; 57
	i32 100, ; 58
	i32 28, ; 59
	i32 58, ; 60
	i32 75, ; 61
	i32 107, ; 62
	i32 145, ; 63
	i32 98, ; 64
	i32 85, ; 65
	i32 109, ; 66
	i32 47, ; 67
	i32 3, ; 68
	i32 65, ; 69
	i32 108, ; 70
	i32 112, ; 71
	i32 77, ; 72
	i32 101, ; 73
	i32 90, ; 74
	i32 146, ; 75
	i32 16, ; 76
	i32 39, ; 77
	i32 22, ; 78
	i32 82, ; 79
	i32 39, ; 80
	i32 20, ; 81
	i32 43, ; 82
	i32 18, ; 83
	i32 2, ; 84
	i32 61, ; 85
	i32 73, ; 86
	i32 114, ; 87
	i32 32, ; 88
	i32 85, ; 89
	i32 69, ; 90
	i32 132, ; 91
	i32 0, ; 92
	i32 6, ; 93
	i32 95, ; 94
	i32 111, ; 95
	i32 66, ; 96
	i32 52, ; 97
	i32 95, ; 98
	i32 110, ; 99
	i32 37, ; 100
	i32 10, ; 101
	i32 5, ; 102
	i32 139, ; 103
	i32 25, ; 104
	i32 79, ; 105
	i32 88, ; 106
	i32 36, ; 107
	i32 71, ; 108
	i32 116, ; 109
	i32 139, ; 110
	i32 134, ; 111
	i32 89, ; 112
	i32 118, ; 113
	i32 135, ; 114
	i32 37, ; 115
	i32 38, ; 116
	i32 62, ; 117
	i32 67, ; 118
	i32 23, ; 119
	i32 1, ; 120
	i32 142, ; 121
	i32 106, ; 122
	i32 86, ; 123
	i32 49, ; 124
	i32 150, ; 125
	i32 17, ; 126
	i32 74, ; 127
	i32 9, ; 128
	i32 79, ; 129
	i32 90, ; 130
	i32 89, ; 131
	i32 83, ; 132
	i32 136, ; 133
	i32 132, ; 134
	i32 50, ; 135
	i32 29, ; 136
	i32 26, ; 137
	i32 112, ; 138
	i32 127, ; 139
	i32 8, ; 140
	i32 41, ; 141
	i32 96, ; 142
	i32 123, ; 143
	i32 44, ; 144
	i32 5, ; 145
	i32 41, ; 146
	i32 77, ; 147
	i32 0, ; 148
	i32 124, ; 149
	i32 76, ; 150
	i32 4, ; 151
	i32 106, ; 152
	i32 134, ; 153
	i32 120, ; 154
	i32 63, ; 155
	i32 103, ; 156
	i32 97, ; 157
	i32 55, ; 158
	i32 12, ; 159
	i32 51, ; 160
	i32 50, ; 161
	i32 121, ; 162
	i32 48, ; 163
	i32 91, ; 164
	i32 116, ; 165
	i32 14, ; 166
	i32 38, ; 167
	i32 45, ; 168
	i32 8, ; 169
	i32 84, ; 170
	i32 18, ; 171
	i32 148, ; 172
	i32 128, ; 173
	i32 118, ; 174
	i32 144, ; 175
	i32 44, ; 176
	i32 13, ; 177
	i32 10, ; 178
	i32 103, ; 179
	i32 60, ; 180
	i32 147, ; 181
	i32 149, ; 182
	i32 53, ; 183
	i32 126, ; 184
	i32 11, ; 185
	i32 93, ; 186
	i32 137, ; 187
	i32 136, ; 188
	i32 20, ; 189
	i32 91, ; 190
	i32 124, ; 191
	i32 71, ; 192
	i32 15, ; 193
	i32 40, ; 194
	i32 130, ; 195
	i32 145, ; 196
	i32 108, ; 197
	i32 104, ; 198
	i32 131, ; 199
	i32 64, ; 200
	i32 66, ; 201
	i32 21, ; 202
	i32 54, ; 203
	i32 55, ; 204
	i32 87, ; 205
	i32 27, ; 206
	i32 57, ; 207
	i32 6, ; 208
	i32 69, ; 209
	i32 19, ; 210
	i32 40, ; 211
	i32 87, ; 212
	i32 56, ; 213
	i32 36, ; 214
	i32 148, ; 215
	i32 88, ; 216
	i32 120, ; 217
	i32 102, ; 218
	i32 73, ; 219
	i32 34, ; 220
	i32 80, ; 221
	i32 150, ; 222
	i32 100, ; 223
	i32 42, ; 224
	i32 12, ; 225
	i32 107, ; 226
	i32 127, ; 227
	i32 81, ; 228
	i32 42, ; 229
	i32 141, ; 230
	i32 67, ; 231
	i32 113, ; 232
	i32 99, ; 233
	i32 59, ; 234
	i32 7, ; 235
	i32 119, ; 236
	i32 72, ; 237
	i32 82, ; 238
	i32 24, ; 239
	i32 138, ; 240
	i32 61, ; 241
	i32 70, ; 242
	i32 149, ; 243
	i32 84, ; 244
	i32 3, ; 245
	i32 46, ; 246
	i32 147, ; 247
	i32 11, ; 248
	i32 101, ; 249
	i32 151, ; 250
	i32 24, ; 251
	i32 23, ; 252
	i32 138, ; 253
	i32 143, ; 254
	i32 31, ; 255
	i32 114, ; 256
	i32 128, ; 257
	i32 76, ; 258
	i32 28, ; 259
	i32 81, ; 260
	i32 45, ; 261
	i32 117, ; 262
	i32 151, ; 263
	i32 33, ; 264
	i32 80, ; 265
	i32 105, ; 266
	i32 63, ; 267
	i32 68, ; 268
	i32 96, ; 269
	i32 97, ; 270
	i32 35, ; 271
	i32 135, ; 272
	i32 47, ; 273
	i32 129, ; 274
	i32 59, ; 275
	i32 32, ; 276
	i32 94, ; 277
	i32 70, ; 278
	i32 144, ; 279
	i32 83, ; 280
	i32 65, ; 281
	i32 27, ; 282
	i32 9, ; 283
	i32 115, ; 284
	i32 54, ; 285
	i32 125, ; 286
	i32 123, ; 287
	i32 141, ; 288
	i32 56, ; 289
	i32 109, ; 290
	i32 122, ; 291
	i32 43, ; 292
	i32 22, ; 293
	i32 17, ; 294
	i32 46, ; 295
	i32 125, ; 296
	i32 29, ; 297
	i32 133, ; 298
	i32 78, ; 299
	i32 105, ; 300
	i32 53, ; 301
	i32 131, ; 302
	i32 78 ; 303
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
