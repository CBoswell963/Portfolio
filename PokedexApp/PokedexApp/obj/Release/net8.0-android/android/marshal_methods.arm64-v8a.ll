; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [152 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [304 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 52
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 151
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 56
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 112
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 68
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 85
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 7: System.Reflection.Primitives => 0x7c6829760de3975 => 127
	i64 750875890346172408, ; 8: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 140
	i64 799765834175365804, ; 9: System.ComponentModel.dll => 0xb1956c9f18442ac => 102
	i64 815918840543911979, ; 10: PokedexApp.dll => 0xb52b9dcd02b202b => 92
	i64 849051935479314978, ; 11: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 12: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 62
	i64 872800313462103108, ; 13: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 73
	i64 1010599046655515943, ; 14: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 127
	i64 1120440138749646132, ; 15: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 89
	i64 1121665720830085036, ; 16: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 17: System.Drawing.dll => 0x119be62002c19ebb => 109
	i64 1301485588176585670, ; 18: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 61
	i64 1369545283391376210, ; 19: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 81
	i64 1476839205573959279, ; 20: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 118
	i64 1486715745332614827, ; 21: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 53
	i64 1513467482682125403, ; 22: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 150
	i64 1518315023656898250, ; 23: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 63
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 140
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 26: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 66
	i64 1628611045998245443, ; 27: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 78
	i64 1672383392659050004, ; 28: Microsoft.Data.Sqlite.dll => 0x17357fd5bfb48e14 => 37
	i64 1731380447121279447, ; 29: Newtonsoft.Json => 0x18071957e9b889d7 => 58
	i64 1743969030606105336, ; 30: System.Memory.dll => 0x1833d297e88f2af8 => 115
	i64 1767386781656293639, ; 31: System.Private.Uri.dll => 0x188704e9f5582107 => 122
	i64 1795316252682057001, ; 32: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 65
	i64 1825687700144851180, ; 33: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 128
	i64 1835311033149317475, ; 34: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 35: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 85
	i64 1875417405349196092, ; 36: System.Drawing.Primitives => 0x1a06d2319b6c713c => 108
	i64 1881198190668717030, ; 37: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 38: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 54
	i64 1959996714666907089, ; 39: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 40: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 77
	i64 1983698669889758782, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 42: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 43: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 108
	i64 2133195048986300728, ; 44: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 58
	i64 2192948757939169934, ; 45: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 39
	i64 2262844636196693701, ; 46: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 73
	i64 2287834202362508563, ; 47: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 94
	i64 2302323944321350744, ; 48: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 49: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 76
	i64 2335503487726329082, ; 50: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 137
	i64 2470498323731680442, ; 51: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 69
	i64 2497223385847772520, ; 52: System.Runtime => 0x22a7eb7046413568 => 134
	i64 2547086958574651984, ; 53: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 64
	i64 2602673633151553063, ; 54: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 55: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 46
	i64 2662981627730767622, ; 56: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2895129759130297543, ; 57: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 58: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 89
	i64 3289520064315143713, ; 59: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 75
	i64 3311221304742556517, ; 60: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 120
	i64 3325875462027654285, ; 61: System.Runtime.Numerics => 0x2e27e21c8958b48d => 131
	i64 3344514922410554693, ; 62: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 91
	i64 3429672777697402584, ; 63: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 56
	i64 3494946837667399002, ; 64: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 44
	i64 3522470458906976663, ; 65: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 86
	i64 3523004241079211829, ; 66: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 43
	i64 3551103847008531295, ; 67: System.Private.CoreLib.dll => 0x31480e226177735f => 148
	i64 3567343442040498961, ; 68: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 69: System.Runtime.dll => 0x319037675df7e556 => 134
	i64 3638003163729360188, ; 70: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 45
	i64 3647754201059316852, ; 71: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 144
	i64 3655542548057982301, ; 72: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 44
	i64 3716579019761409177, ; 73: netstandard.dll => 0x3393f0ed5c8c5c99 => 147
	i64 3727469159507183293, ; 74: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 84
	i64 3869221888984012293, ; 75: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 49
	i64 3890352374528606784, ; 76: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 54
	i64 3933965368022646939, ; 77: System.Net.Requests => 0x369840a8bfadc09b => 119
	i64 3966267475168208030, ; 78: System.Memory => 0x370b03412596249e => 115
	i64 4009997192427317104, ; 79: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 133
	i64 4073500526318903918, ; 80: System.Private.Xml.dll => 0x3887fb25779ae26e => 124
	i64 4120493066591692148, ; 81: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 82: System.ComponentModel => 0x39a7562737acb67e => 102
	i64 4187479170553454871, ; 83: System.Linq.Expressions => 0x3a1cea1e912fa117 => 112
	i64 4205801962323029395, ; 84: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 101
	i64 4337444564132831293, ; 85: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 60
	i64 4356591372459378815, ; 86: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4513320955448359355, ; 87: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 40
	i64 4612482779465751747, ; 88: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 39
	i64 4679594760078841447, ; 89: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4743821336939966868, ; 90: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 99
	i64 4794310189461587505, ; 91: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 64
	i64 4795410492532947900, ; 92: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 86
	i64 4809057822547766521, ; 93: System.Drawing => 0x42bd349c3145ecf9 => 109
	i64 4853321196694829351, ; 94: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 130
	i64 5103417709280584325, ; 95: System.Collections.Specialized => 0x46d2fb5e161b6285 => 97
	i64 5129462924058778861, ; 96: Microsoft.Data.Sqlite => 0x472f835a350f5ced => 37
	i64 5182934613077526976, ; 97: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 97
	i64 5290786973231294105, ; 98: System.Runtime.Loader => 0x496ca6b869b72699 => 130
	i64 5423376490970181369, ; 99: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 128
	i64 5471532531798518949, ; 100: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 101: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 102: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 110
	i64 5573260873512690141, ; 103: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 135
	i64 5692067934154308417, ; 104: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 88
	i64 6068057819846744445, ; 105: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 106: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 60
	i64 6200764641006662125, ; 107: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 108: System.Text.Json.dll => 0x565a67a0ffe264a7 => 138
	i64 6251069312384999852, ; 109: System.Transactions.Local => 0x56c0426b870da1ac => 142
	i64 6284145129771520194, ; 110: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 125
	i64 6357457916754632952, ; 111: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 112: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 76
	i64 6478287442656530074, ; 113: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 114: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 72
	i64 6560151584539558821, ; 115: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 51
	i64 6743165466166707109, ; 116: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 117: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 118: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 106
	i64 6814185388980153342, ; 119: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 145
	i64 6876862101832370452, ; 120: System.Xml.Linq => 0x5f6f85a57d108914 => 143
	i64 6894844156784520562, ; 121: System.Numerics.Vectors => 0x5faf683aead1ad72 => 120
	i64 7083547580668757502, ; 122: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 123
	i64 7220009545223068405, ; 123: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 124: System.Linq => 0x64e71ccf51a90a5a => 114
	i64 7377312882064240630, ; 125: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 101
	i64 7488575175965059935, ; 126: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 143
	i64 7489048572193775167, ; 127: System.ObjectModel => 0x67ee71ff6b419e3f => 121
	i64 7654504624184590948, ; 128: System.Net.Http => 0x6a3a4366801b8264 => 116
	i64 7708790323521193081, ; 129: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 130: System.Private.CoreLib => 0x6b0ff375198b9c17 => 148
	i64 7735176074855944702, ; 131: Microsoft.CSharp => 0x6b58dda848e391fe => 93
	i64 7735352534559001595, ; 132: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 90
	i64 7836164640616011524, ; 133: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 66
	i64 7972383140441761405, ; 134: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 42
	i64 8064050204834738623, ; 135: System.Collections.dll => 0x6fe942efa61731bf => 98
	i64 8083354569033831015, ; 136: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 75
	i64 8087206902342787202, ; 137: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 105
	i64 8167236081217502503, ; 138: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 149
	i64 8185542183669246576, ; 139: System.Collections => 0x7198e33f4794aa70 => 98
	i64 8246048515196606205, ; 140: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 57
	i64 8368701292315763008, ; 141: System.Security.Cryptography => 0x7423997c6fd56140 => 135
	i64 8400357532724379117, ; 142: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 83
	i64 8410671156615598628, ; 143: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 126
	i64 8518412311883997971, ; 144: System.Collections.Immutable => 0x76377add7c28e313 => 95
	i64 8563666267364444763, ; 145: System.Private.Uri => 0x76d841191140ca5b => 122
	i64 8599632406834268464, ; 146: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 147: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 148: Java.Interop => 0x77b654e585b55834 => 149
	i64 8638972117149407195, ; 149: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 93
	i64 8639588376636138208, ; 150: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 82
	i64 8677882282824630478, ; 151: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 152: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 105
	i64 8941376889969657626, ; 153: System.Xml.XDocument => 0x7c1626e87187471a => 145
	i64 9045785047181495996, ; 154: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9111603110219107042, ; 155: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 43
	i64 9250544137016314866, ; 156: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 38
	i64 9312692141327339315, ; 157: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 88
	i64 9324707631942237306, ; 158: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 65
	i64 9659729154652888475, ; 159: System.Text.RegularExpressions => 0x860e407c9991dd9b => 139
	i64 9678050649315576968, ; 160: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 69
	i64 9702891218465930390, ; 161: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 96
	i64 9808709177481450983, ; 162: Mono.Android.dll => 0x881f890734e555e7 => 151
	i64 9864956466380592553, ; 163: Microsoft.EntityFrameworkCore.Sqlite => 0x88e75da3af4ed5a9 => 41
	i64 9933555792566666578, ; 164: System.Linq.Queryable.dll => 0x89db145cf475c552 => 113
	i64 9956195530459977388, ; 165: Microsoft.Maui => 0x8a2b8315b36616ac => 55
	i64 9991543690424095600, ; 166: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 167: System.Net.Http.dll => 0x8b50e941206af13b => 116
	i64 10051358222726253779, ; 168: System.Private.Xml => 0x8b7d990c97ccccd3 => 124
	i64 10092835686693276772, ; 169: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 53
	i64 10143853363526200146, ; 170: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 171: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 72
	i64 10245369515835430794, ; 172: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 126
	i64 10364469296367737616, ; 173: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 125
	i64 10406448008575299332, ; 174: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 91
	i64 10430153318873392755, ; 175: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 70
	i64 10506226065143327199, ; 176: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 177: System.Net.Primitives => 0x95ac8cfb68830758 => 118
	i64 10811915265162633087, ; 178: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 40
	i64 10822644899632537592, ; 179: System.Linq.Queryable => 0x9631c23204ca5ff8 => 113
	i64 10880838204485145808, ; 180: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 10964653383833615866, ; 181: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 107
	i64 11002576679268595294, ; 182: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 50
	i64 11009005086950030778, ; 183: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 55
	i64 11103970607964515343, ; 184: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 185: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 87
	i64 11220793807500858938, ; 186: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 187: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 51
	i64 11340910727871153756, ; 188: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 71
	i64 11398376662953476300, ; 189: Microsoft.EntityFrameworkCore.Sqlite.dll => 0x9e2f2b2f0b71c0cc => 41
	i64 11485890710487134646, ; 190: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 129
	i64 11518296021396496455, ; 191: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 192: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 87
	i64 11530571088791430846, ; 193: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 49
	i64 11597940890313164233, ; 194: netstandard => 0xa0f429ca8d1805c9 => 147
	i64 11705530742807338875, ; 195: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11739066727115742305, ; 196: SQLite-net.dll => 0xa2e98afdf8575c61 => 59
	i64 11806260347154423189, ; 197: SQLite-net => 0xa3d8433bc5eb5d95 => 59
	i64 12145679461940342714, ; 198: System.Text.Json => 0xa88e1f1ebcb62fba => 138
	i64 12201331334810686224, ; 199: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 133
	i64 12269460666702402136, ; 200: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 95
	i64 12279246230491828964, ; 201: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 63
	i64 12341818387765915815, ; 202: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 203: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 74
	i64 12466513435562512481, ; 204: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 79
	i64 12475113361194491050, ; 205: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 206: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 106
	i64 12538491095302438457, ; 207: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 67
	i64 12550732019250633519, ; 208: System.IO.Compression => 0xae2d28465e8e1b2f => 111
	i64 12681088699309157496, ; 209: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 210: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 68
	i64 12708922737231849740, ; 211: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 136
	i64 12823819093633476069, ; 212: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 213: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 52
	i64 13068258254871114833, ; 214: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 132
	i64 13221551921002590604, ; 215: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 216: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 217: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 150
	i64 13381594904270902445, ; 218: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 219: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 90
	i64 13467053111158216594, ; 220: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 221: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 222: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 223: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 84
	i64 13717397318615465333, ; 224: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 100
	i64 13755568601956062840, ; 225: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 226: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 227: System.Console.dll => 0xc0a5f3cade5c6774 => 103
	i64 13955418299340266673, ; 228: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 48
	i64 13959074834287824816, ; 229: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 74
	i64 14100563506285742564, ; 230: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 231: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 67
	i64 14125464355221830302, ; 232: System.Threading.dll => 0xc407bafdbc707a9e => 141
	i64 14133832980772275001, ; 233: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 38
	i64 14254574811015963973, ; 234: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 136
	i64 14461014870687870182, ; 235: System.Net.Requests.dll => 0xc8afd8683afdece6 => 119
	i64 14464374589798375073, ; 236: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 237: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 238: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 137
	i64 14556034074661724008, ; 239: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14622043554576106986, ; 240: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 132
	i64 14669215534098758659, ; 241: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 46
	i64 14705122255218365489, ; 242: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 243: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 244: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 71
	i64 14892012299694389861, ; 245: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 246: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 247: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 47
	i64 14987728460634540364, ; 248: System.IO.Compression.dll => 0xcfff1ba06622494c => 111
	i64 15076659072870671916, ; 249: System.ObjectModel.dll => 0xd13b0d8c1620662c => 121
	i64 15111608613780139878, ; 250: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 251: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 110
	i64 15133485256822086103, ; 252: System.Linq.dll => 0xd204f0a9127dd9d7 => 114
	i64 15227001540531775957, ; 253: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 45
	i64 15370334346939861994, ; 254: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 70
	i64 15391712275433856905, ; 255: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 47
	i64 15527772828719725935, ; 256: System.Console => 0xd77dbb1e38cd3d6f => 103
	i64 15536481058354060254, ; 257: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 258: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 78
	i64 15609085926864131306, ; 259: System.dll => 0xd89e9cf3334914ea => 146
	i64 15620595871140898079, ; 260: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 48
	i64 15661133872274321916, ; 261: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 144
	i64 15664356999916475676, ; 262: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 263: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 264: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 16018552496348375205, ; 265: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 117
	i64 16154507427712707110, ; 266: System => 0xe03056ea4e39aa26 => 146
	i64 16288847719894691167, ; 267: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 268: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 50
	i64 16454459195343277943, ; 269: System.Net.NetworkInformation => 0xe459fb756d988f77 => 117
	i64 16649148416072044166, ; 270: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 57
	i64 16677317093839702854, ; 271: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 83
	i64 16755018182064898362, ; 272: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 61
	i64 16856067890322379635, ; 273: System.Data.Common.dll => 0xe9ecc87060889373 => 104
	i64 16890310621557459193, ; 274: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 139
	i64 16942731696432749159, ; 275: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 276: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 81
	i64 17008137082415910100, ; 277: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 96
	i64 17031351772568316411, ; 278: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 80
	i64 17062143951396181894, ; 279: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 100
	i64 17089008752050867324, ; 280: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17187273293601214786, ; 281: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 99
	i64 17230721278011714856, ; 282: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 123
	i64 17234219099804750107, ; 283: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 142
	i64 17260702271250283638, ; 284: System.Data.Common => 0xef8a5543bba6bc76 => 104
	i64 17333249706306540043, ; 285: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 107
	i64 17342750010158924305, ; 286: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 287: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 288: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 289: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 290: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 291: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 79
	i64 17710060891934109755, ; 292: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 77
	i64 17712670374920797664, ; 293: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 129
	i64 17777860260071588075, ; 294: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 131
	i64 18017743553296241350, ; 295: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 42
	i64 18025913125965088385, ; 296: System.Threading => 0xfa28e87b91334681 => 141
	i64 18099568558057551825, ; 297: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18104530357207465218, ; 298: PokedexApp => 0xfb4036701ea07d02 => 92
	i64 18121036031235206392, ; 299: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 80
	i64 18245806341561545090, ; 300: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 94
	i64 18305135509493619199, ; 301: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 82
	i64 18324163916253801303, ; 302: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18370042311372477656 ; 303: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 62
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [304 x i32] [
	i32 52, ; 0
	i32 151, ; 1
	i32 56, ; 2
	i32 112, ; 3
	i32 68, ; 4
	i32 85, ; 5
	i32 7, ; 6
	i32 127, ; 7
	i32 140, ; 8
	i32 102, ; 9
	i32 92, ; 10
	i32 10, ; 11
	i32 62, ; 12
	i32 73, ; 13
	i32 127, ; 14
	i32 89, ; 15
	i32 18, ; 16
	i32 109, ; 17
	i32 61, ; 18
	i32 81, ; 19
	i32 118, ; 20
	i32 53, ; 21
	i32 150, ; 22
	i32 63, ; 23
	i32 140, ; 24
	i32 16, ; 25
	i32 66, ; 26
	i32 78, ; 27
	i32 37, ; 28
	i32 58, ; 29
	i32 115, ; 30
	i32 122, ; 31
	i32 65, ; 32
	i32 128, ; 33
	i32 6, ; 34
	i32 85, ; 35
	i32 108, ; 36
	i32 28, ; 37
	i32 54, ; 38
	i32 28, ; 39
	i32 77, ; 40
	i32 2, ; 41
	i32 20, ; 42
	i32 108, ; 43
	i32 58, ; 44
	i32 39, ; 45
	i32 73, ; 46
	i32 94, ; 47
	i32 24, ; 48
	i32 76, ; 49
	i32 137, ; 50
	i32 69, ; 51
	i32 134, ; 52
	i32 64, ; 53
	i32 27, ; 54
	i32 46, ; 55
	i32 2, ; 56
	i32 7, ; 57
	i32 89, ; 58
	i32 75, ; 59
	i32 120, ; 60
	i32 131, ; 61
	i32 91, ; 62
	i32 56, ; 63
	i32 44, ; 64
	i32 86, ; 65
	i32 43, ; 66
	i32 148, ; 67
	i32 22, ; 68
	i32 134, ; 69
	i32 45, ; 70
	i32 144, ; 71
	i32 44, ; 72
	i32 147, ; 73
	i32 84, ; 74
	i32 49, ; 75
	i32 54, ; 76
	i32 119, ; 77
	i32 115, ; 78
	i32 133, ; 79
	i32 124, ; 80
	i32 33, ; 81
	i32 102, ; 82
	i32 112, ; 83
	i32 101, ; 84
	i32 60, ; 85
	i32 30, ; 86
	i32 40, ; 87
	i32 39, ; 88
	i32 0, ; 89
	i32 99, ; 90
	i32 64, ; 91
	i32 86, ; 92
	i32 109, ; 93
	i32 130, ; 94
	i32 97, ; 95
	i32 37, ; 96
	i32 97, ; 97
	i32 130, ; 98
	i32 128, ; 99
	i32 26, ; 100
	i32 29, ; 101
	i32 110, ; 102
	i32 135, ; 103
	i32 88, ; 104
	i32 23, ; 105
	i32 60, ; 106
	i32 23, ; 107
	i32 138, ; 108
	i32 142, ; 109
	i32 125, ; 110
	i32 34, ; 111
	i32 76, ; 112
	i32 11, ; 113
	i32 72, ; 114
	i32 51, ; 115
	i32 19, ; 116
	i32 22, ; 117
	i32 106, ; 118
	i32 145, ; 119
	i32 143, ; 120
	i32 120, ; 121
	i32 123, ; 122
	i32 26, ; 123
	i32 114, ; 124
	i32 101, ; 125
	i32 143, ; 126
	i32 121, ; 127
	i32 116, ; 128
	i32 17, ; 129
	i32 148, ; 130
	i32 93, ; 131
	i32 90, ; 132
	i32 66, ; 133
	i32 42, ; 134
	i32 98, ; 135
	i32 75, ; 136
	i32 105, ; 137
	i32 149, ; 138
	i32 98, ; 139
	i32 57, ; 140
	i32 135, ; 141
	i32 83, ; 142
	i32 126, ; 143
	i32 95, ; 144
	i32 122, ; 145
	i32 35, ; 146
	i32 21, ; 147
	i32 149, ; 148
	i32 93, ; 149
	i32 82, ; 150
	i32 21, ; 151
	i32 105, ; 152
	i32 145, ; 153
	i32 31, ; 154
	i32 43, ; 155
	i32 38, ; 156
	i32 88, ; 157
	i32 65, ; 158
	i32 139, ; 159
	i32 69, ; 160
	i32 96, ; 161
	i32 151, ; 162
	i32 41, ; 163
	i32 113, ; 164
	i32 55, ; 165
	i32 6, ; 166
	i32 116, ; 167
	i32 124, ; 168
	i32 53, ; 169
	i32 3, ; 170
	i32 72, ; 171
	i32 126, ; 172
	i32 125, ; 173
	i32 91, ; 174
	i32 70, ; 175
	i32 1, ; 176
	i32 118, ; 177
	i32 40, ; 178
	i32 113, ; 179
	i32 35, ; 180
	i32 107, ; 181
	i32 50, ; 182
	i32 55, ; 183
	i32 12, ; 184
	i32 87, ; 185
	i32 15, ; 186
	i32 51, ; 187
	i32 71, ; 188
	i32 41, ; 189
	i32 129, ; 190
	i32 13, ; 191
	i32 87, ; 192
	i32 49, ; 193
	i32 147, ; 194
	i32 9, ; 195
	i32 59, ; 196
	i32 59, ; 197
	i32 138, ; 198
	i32 133, ; 199
	i32 95, ; 200
	i32 63, ; 201
	i32 36, ; 202
	i32 74, ; 203
	i32 79, ; 204
	i32 34, ; 205
	i32 106, ; 206
	i32 67, ; 207
	i32 111, ; 208
	i32 14, ; 209
	i32 68, ; 210
	i32 136, ; 211
	i32 27, ; 212
	i32 52, ; 213
	i32 132, ; 214
	i32 1, ; 215
	i32 15, ; 216
	i32 150, ; 217
	i32 9, ; 218
	i32 90, ; 219
	i32 29, ; 220
	i32 30, ; 221
	i32 13, ; 222
	i32 84, ; 223
	i32 100, ; 224
	i32 8, ; 225
	i32 11, ; 226
	i32 103, ; 227
	i32 48, ; 228
	i32 74, ; 229
	i32 3, ; 230
	i32 67, ; 231
	i32 141, ; 232
	i32 38, ; 233
	i32 136, ; 234
	i32 119, ; 235
	i32 24, ; 236
	i32 5, ; 237
	i32 137, ; 238
	i32 36, ; 239
	i32 132, ; 240
	i32 46, ; 241
	i32 16, ; 242
	i32 32, ; 243
	i32 71, ; 244
	i32 33, ; 245
	i32 0, ; 246
	i32 47, ; 247
	i32 111, ; 248
	i32 121, ; 249
	i32 17, ; 250
	i32 110, ; 251
	i32 114, ; 252
	i32 45, ; 253
	i32 70, ; 254
	i32 47, ; 255
	i32 103, ; 256
	i32 4, ; 257
	i32 78, ; 258
	i32 146, ; 259
	i32 48, ; 260
	i32 144, ; 261
	i32 4, ; 262
	i32 12, ; 263
	i32 5, ; 264
	i32 117, ; 265
	i32 146, ; 266
	i32 18, ; 267
	i32 50, ; 268
	i32 117, ; 269
	i32 57, ; 270
	i32 83, ; 271
	i32 61, ; 272
	i32 104, ; 273
	i32 139, ; 274
	i32 25, ; 275
	i32 81, ; 276
	i32 96, ; 277
	i32 80, ; 278
	i32 100, ; 279
	i32 32, ; 280
	i32 99, ; 281
	i32 123, ; 282
	i32 142, ; 283
	i32 104, ; 284
	i32 107, ; 285
	i32 10, ; 286
	i32 25, ; 287
	i32 8, ; 288
	i32 20, ; 289
	i32 31, ; 290
	i32 79, ; 291
	i32 77, ; 292
	i32 129, ; 293
	i32 131, ; 294
	i32 42, ; 295
	i32 141, ; 296
	i32 19, ; 297
	i32 92, ; 298
	i32 80, ; 299
	i32 94, ; 300
	i32 82, ; 301
	i32 14, ; 302
	i32 62 ; 303
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
