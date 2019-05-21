{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fplugin Test.Inspection.Plugin #-}
module MutualRecursion where

import System.Exit
import Test.Inspection

inf = go0
  where
    go0 = 'a' : go1
    go1 = 'b' : go2
    go2 = 'c' : go0
inf' = go0
  where
    go1 = 'b' : go2
    go0 = 'a' : go1
    go2 = 'c' : go0
inf2' = go0
  where
    go1 = 'b' : go2
    go2 = 'c' : go0
    go0 = 'a' : go1
inf3' = go0
  where
    go0 = 'a' : go1
    go1 = 'b' : go2
    go2 = 'c' : go0

inspect $ 'inf === 'inf'
inspect $ 'inf === 'inf2'
inspect $ 'inf === 'inf3'

letrec =
  let go0 = 'a' : go1
      go1 = 'b' : go2
      go2 = 'c' : go0
   in go0
letrec' =
  let go1 = 'b' : go2
      go0 = 'a' : go1
      go2 = 'c' : go0
   in go0
letrec2' =
  let go1 = 'b' : go2
      go2 = 'c' : go0
      go0 = 'a' : go1
   in go0
letrec3' =
  let go0 = 'a' : go1
      go1 = 'b' : go2
      go2 = 'c' : go0
   in go0

inspect $ 'letrec === 'letrec'
inspect $ 'letrec === 'letrec2'
inspect $ 'letrec === 'letrec3'

something_else =
  let go0 = 'a' : go1
      go1 = 'b' : go0
      go2 = 'c' : go0
   in go0


-- | Test to make sure we don't have any aggressively worst-case behavior.
bigletrec =
  let go0   = '\x0' : go1
      go1   = '\x1' : go2
      go2   = '\x2' : go3
      go3   = '\x3' : go4
      go4   = '\x4' : go5
      go5   = '\x5' : go6
      go6   = '\x6' : go7
      go7   = '\x7' : go8
      go8   = '\x8' : go9
      go9   = '\x9' : go10
      go10  = '\x10' : go11
      go11  = '\x11' : go12
      go12  = '\x12' : go13
      go13  = '\x13' : go14
      go14  = '\x14' : go15
      go15  = '\x15' : go16
      go16  = '\x16' : go17
      go17  = '\x17' : go18
      go18  = '\x18' : go19
      go19  = '\x19' : go20
      go20  = '\x20' : go21
      go21  = '\x21' : go22
      go22  = '\x22' : go23
      go23  = '\x23' : go24
      go24  = '\x24' : go25
      go25  = '\x25' : go26
      go26  = '\x26' : go27
      go27  = '\x27' : go28
      go28  = '\x28' : go29
      go29  = '\x29' : go30
      go30  = '\x30' : go31
      go31  = '\x31' : go32
      go32  = '\x32' : go33
      go33  = '\x33' : go34
      go34  = '\x34' : go35
      go35  = '\x35' : go36
      go36  = '\x36' : go37
      go37  = '\x37' : go38
      go38  = '\x38' : go39
      go39  = '\x39' : go40
      go40  = '\x40' : go41
      go41  = '\x41' : go42
      go42  = '\x42' : go43
      go43  = '\x43' : go44
      go44  = '\x44' : go45
      go45  = '\x45' : go46
      go46  = '\x46' : go47
      go47  = '\x47' : go48
      go48  = '\x48' : go49
      go49  = '\x49' : go50
      go50  = '\x50' : go51
      go51  = '\x51' : go52
      go52  = '\x52' : go53
      go53  = '\x53' : go54
      go54  = '\x54' : go55
      go55  = '\x55' : go56
      go56  = '\x56' : go57
      go57  = '\x57' : go58
      go58  = '\x58' : go59
      go59  = '\x59' : go60
      go60  = '\x60' : go61
      go61  = '\x61' : go62
      go62  = '\x62' : go63
      go63  = '\x63' : go64
      go64  = '\x64' : go65
      go65  = '\x65' : go66
      go66  = '\x66' : go67
      go67  = '\x67' : go68
      go68  = '\x68' : go69
      go69  = '\x69' : go70
      go70  = '\x70' : go71
      go71  = '\x71' : go72
      go72  = '\x72' : go73
      go73  = '\x73' : go74
      go74  = '\x74' : go75
      go75  = '\x75' : go76
      go76  = '\x76' : go77
      go77  = '\x77' : go78
      go78  = '\x78' : go79
      go79  = '\x79' : go80
      go80  = '\x80' : go81
      go81  = '\x81' : go82
      go82  = '\x82' : go83
      go83  = '\x83' : go84
      go84  = '\x84' : go85
      go85  = '\x85' : go86
      go86  = '\x86' : go87
      go87  = '\x87' : go88
      go88  = '\x88' : go89
      go89  = '\x89' : go90
      go90  = '\x90' : go91
      go91  = '\x91' : go92
      go92  = '\x92' : go93
      go93  = '\x93' : go94
      go94  = '\x94' : go95
      go95  = '\x95' : go96
      go96  = '\x96' : go97
      go97  = '\x97' : go98
      go98  = '\x98' : go99
      go99  = '\x99' : go100
      go100 = '\x100' : go101
      go101 = '\x101' : go102
      go102 = '\x102' : go103
      go103 = '\x103' : go104
      go104 = '\x104' : go105
      go105 = '\x105' : go106
      go106 = '\x106' : go107
      go107 = '\x107' : go108
      go108 = '\x108' : go109
      go109 = '\x109' : go110
      go110 = '\x110' : go111
      go111 = '\x111' : go112
      go112 = '\x112' : go113
      go113 = '\x113' : go114
      go114 = '\x114' : go115
      go115 = '\x115' : go116
      go116 = '\x116' : go117
      go117 = '\x117' : go118
      go118 = '\x118' : go119
      go119 = '\x119' : go120
      go120 = '\x120' : go121
      go121 = '\x121' : go122
      go122 = '\x122' : go123
      go123 = '\x123' : go124
      go124 = '\x124' : go125
      go125 = '\x125' : go126
      go126 = '\x126' : go127
      go127 = '\x127' : go128
      go128 = '\x128' : go129
      go129 = '\x129' : go130
      go130 = '\x130' : go131
      go131 = '\x131' : go132
      go132 = '\x132' : go133
      go133 = '\x133' : go134
      go134 = '\x134' : go135
      go135 = '\x135' : go136
      go136 = '\x136' : go137
      go137 = '\x137' : go138
      go138 = '\x138' : go139
      go139 = '\x139' : go140
      go140 = '\x140' : go141
      go141 = '\x141' : go142
      go142 = '\x142' : go143
      go143 = '\x143' : go144
      go144 = '\x144' : go145
      go145 = '\x145' : go146
      go146 = '\x146' : go147
      go147 = '\x147' : go148
      go148 = '\x148' : go149
      go149 = '\x149' : go150
      go150 = '\x150' : go151
      go151 = '\x151' : go152
      go152 = '\x152' : go153
      go153 = '\x153' : go154
      go154 = '\x154' : go155
      go155 = '\x155' : go156
      go156 = '\x156' : go157
      go157 = '\x157' : go158
      go158 = '\x158' : go159
      go159 = '\x159' : go160
      go160 = '\x160' : go161
      go161 = '\x161' : go162
      go162 = '\x162' : go163
      go163 = '\x163' : go164
      go164 = '\x164' : go165
      go165 = '\x165' : go166
      go166 = '\x166' : go167
      go167 = '\x167' : go168
      go168 = '\x168' : go169
      go169 = '\x169' : go170
      go170 = '\x170' : go171
      go171 = '\x171' : go172
      go172 = '\x172' : go173
      go173 = '\x173' : go174
      go174 = '\x174' : go175
      go175 = '\x175' : go176
      go176 = '\x176' : go177
      go177 = '\x177' : go178
      go178 = '\x178' : go179
      go179 = '\x179' : go180
      go180 = '\x180' : go181
      go181 = '\x181' : go182
      go182 = '\x182' : go183
      go183 = '\x183' : go184
      go184 = '\x184' : go185
      go185 = '\x185' : go186
      go186 = '\x186' : go187
      go187 = '\x187' : go188
      go188 = '\x188' : go189
      go189 = '\x189' : go190
      go190 = '\x190' : go191
      go191 = '\x191' : go192
      go192 = '\x192' : go193
      go193 = '\x193' : go194
      go194 = '\x194' : go195
      go195 = '\x195' : go196
      go196 = '\x196' : go197
      go197 = '\x197' : go198
      go198 = '\x198' : go199
      go199 = '\x199' : go200
      go200 = '\x200' : go201
      go201 = '\x201' : go202
      go202 = '\x202' : go203
      go203 = '\x203' : go204
      go204 = '\x204' : go205
      go205 = '\x205' : go206
      go206 = '\x206' : go207
      go207 = '\x207' : go208
      go208 = '\x208' : go209
      go209 = '\x209' : go210
      go210 = '\x210' : go211
      go211 = '\x211' : go212
      go212 = '\x212' : go213
      go213 = '\x213' : go214
      go214 = '\x214' : go215
      go215 = '\x215' : go216
      go216 = '\x216' : go217
      go217 = '\x217' : go218
      go218 = '\x218' : go219
      go219 = '\x219' : go220
      go220 = '\x220' : go221
      go221 = '\x221' : go222
      go222 = '\x222' : go223
      go223 = '\x223' : go224
      go224 = '\x224' : go225
      go225 = '\x225' : go226
      go226 = '\x226' : go227
      go227 = '\x227' : go228
      go228 = '\x228' : go229
      go229 = '\x229' : go230
      go230 = '\x230' : go231
      go231 = '\x231' : go232
      go232 = '\x232' : go233
      go233 = '\x233' : go234
      go234 = '\x234' : go235
      go235 = '\x235' : go236
      go236 = '\x236' : go237
      go237 = '\x237' : go238
      go238 = '\x238' : go239
      go239 = '\x239' : go240
      go240 = '\x240' : go241
      go241 = '\x241' : go242
      go242 = '\x242' : go243
      go243 = '\x243' : go244
      go244 = '\x244' : go245
      go245 = '\x245' : go246
      go246 = '\x246' : go247
      go247 = '\x247' : go248
      go248 = '\x248' : go249
      go249 = '\x249' : go250
      go250 = '\x250' : go251
      go251 = '\x251' : go252
      go252 = '\x252' : go253
      go253 = '\x253' : go254
      go254 = '\x254' : go255
      go255 = '\x255' : go256
      go256 = '\x256' : go0
  in go0
bigletrec' =
  let go0   = '\x0' : go1
      go1   = '\x1' : go2
      go2   = '\x2' : go3
      go3   = '\x3' : go4
      go4   = '\x4' : go5
      go5   = '\x5' : go6
      go6   = '\x6' : go7
      go7   = '\x7' : go8
      go8   = '\x8' : go9
      go9   = '\x9' : go10
      go10  = '\x10' : go11
      go11  = '\x11' : go12
      go12  = '\x12' : go13
      go13  = '\x13' : go14
      go14  = '\x14' : go15
      go15  = '\x15' : go16
      go16  = '\x16' : go17
      go17  = '\x17' : go18
      go18  = '\x18' : go19
      go19  = '\x19' : go20
      go20  = '\x20' : go21
      go21  = '\x21' : go22
      go22  = '\x22' : go23
      go23  = '\x23' : go24
      go24  = '\x24' : go25
      go25  = '\x25' : go26
      go26  = '\x26' : go27
      go27  = '\x27' : go28
      go28  = '\x28' : go29
      go29  = '\x29' : go30
      go30  = '\x30' : go31
      go31  = '\x31' : go32
      go32  = '\x32' : go33
      go33  = '\x33' : go34
      go34  = '\x34' : go35
      go35  = '\x35' : go36
      go36  = '\x36' : go37
      go37  = '\x37' : go38
      go38  = '\x38' : go39
      go39  = '\x39' : go40
      go40  = '\x40' : go41
      go41  = '\x41' : go42
      go42  = '\x42' : go43
      go43  = '\x43' : go44
      go44  = '\x44' : go45
      go45  = '\x45' : go46
      go46  = '\x46' : go47
      go47  = '\x47' : go48
      go48  = '\x48' : go49
      go49  = '\x49' : go50
      go50  = '\x50' : go51
      go51  = '\x51' : go52
      go52  = '\x52' : go53
      go53  = '\x53' : go54
      go54  = '\x54' : go55
      go55  = '\x55' : go56
      go56  = '\x56' : go57
      go57  = '\x57' : go58
      go58  = '\x58' : go59
      go59  = '\x59' : go60
      go60  = '\x60' : go61
      go61  = '\x61' : go62
      go62  = '\x62' : go63
      go63  = '\x63' : go64
      go64  = '\x64' : go65
      go65  = '\x65' : go66
      go66  = '\x66' : go67
      go67  = '\x67' : go68
      go68  = '\x68' : go69
      go69  = '\x69' : go70
      go70  = '\x70' : go71
      go71  = '\x71' : go72
      go72  = '\x72' : go73
      go73  = '\x73' : go74
      go74  = '\x74' : go75
      go75  = '\x75' : go76
      go76  = '\x76' : go77
      go77  = '\x77' : go78
      go78  = '\x78' : go79
      go79  = '\x79' : go80
      go80  = '\x80' : go81
      go81  = '\x81' : go82
      go82  = '\x82' : go83
      go83  = '\x83' : go84
      go84  = '\x84' : go85
      go85  = '\x85' : go86
      go86  = '\x86' : go87
      go87  = '\x87' : go88
      go88  = '\x88' : go89
      go89  = '\x89' : go90
      go90  = '\x90' : go91
      go91  = '\x91' : go92
      go92  = '\x92' : go93
      go93  = '\x93' : go94
      go94  = '\x94' : go95
      go95  = '\x95' : go96
      go96  = '\x96' : go97
      go97  = '\x97' : go98
      go98  = '\x98' : go99
      go99  = '\x99' : go100
      go100 = '\x100' : go101
      go101 = '\x101' : go102
      go102 = '\x102' : go103
      go103 = '\x103' : go104
      go104 = '\x104' : go105
      go105 = '\x105' : go106
      go106 = '\x106' : go107
      go107 = '\x107' : go108
      go108 = '\x108' : go109
      go109 = '\x109' : go110
      go110 = '\x110' : go111
      go111 = '\x111' : go112
      go112 = '\x112' : go113
      go113 = '\x113' : go114
      go114 = '\x114' : go115
      go115 = '\x115' : go116
      go116 = '\x116' : go117
      go117 = '\x117' : go118
      go118 = '\x118' : go119
      go119 = '\x119' : go120
      go120 = '\x120' : go121
      go121 = '\x121' : go122
      go122 = '\x122' : go123
      go123 = '\x123' : go124
      go124 = '\x124' : go125
      go125 = '\x125' : go126
      go126 = '\x126' : go127
      go127 = '\x127' : go128
      go128 = '\x128' : go129
      go129 = '\x129' : go130
      go130 = '\x130' : go131
      go131 = '\x131' : go132
      go132 = '\x132' : go133
      go133 = '\x133' : go134
      go134 = '\x134' : go135
      go135 = '\x135' : go136
      go136 = '\x136' : go137
      go137 = '\x137' : go138
      go138 = '\x138' : go139
      go139 = '\x139' : go140
      go140 = '\x140' : go141
      go141 = '\x141' : go142
      go142 = '\x142' : go143
      go143 = '\x143' : go144
      go144 = '\x144' : go145
      go145 = '\x145' : go146
      go146 = '\x146' : go147
      go147 = '\x147' : go148
      go148 = '\x148' : go149
      go149 = '\x149' : go150
      go150 = '\x150' : go151
      go151 = '\x151' : go152
      go152 = '\x152' : go153
      go153 = '\x153' : go154
      go154 = '\x154' : go155
      go155 = '\x155' : go156
      go156 = '\x156' : go157
      go157 = '\x157' : go158
      go158 = '\x158' : go159
      go159 = '\x159' : go160
      go160 = '\x160' : go161
      go161 = '\x161' : go162
      go162 = '\x162' : go163
      go163 = '\x163' : go164
      go164 = '\x164' : go165
      go165 = '\x165' : go166
      go166 = '\x166' : go167
      go167 = '\x167' : go168
      go168 = '\x168' : go169
      go169 = '\x169' : go170
      go170 = '\x170' : go171
      go171 = '\x171' : go172
      go172 = '\x172' : go173
      go173 = '\x173' : go174
      go174 = '\x174' : go175
      go175 = '\x175' : go176
      go176 = '\x176' : go177
      go177 = '\x177' : go178
      go178 = '\x178' : go179
      go179 = '\x179' : go180
      go180 = '\x180' : go181
      go181 = '\x181' : go182
      go182 = '\x182' : go183
      go183 = '\x183' : go184
      go184 = '\x184' : go185
      go185 = '\x185' : go186
      go186 = '\x186' : go187
      go187 = '\x187' : go188
      go188 = '\x188' : go189
      go189 = '\x189' : go190
      go190 = '\x190' : go191
      go191 = '\x191' : go192
      go192 = '\x192' : go193
      go193 = '\x193' : go194
      go194 = '\x194' : go195
      go195 = '\x195' : go196
      go196 = '\x196' : go197
      go197 = '\x197' : go198
      go198 = '\x198' : go199
      go199 = '\x199' : go200
      go200 = '\x200' : go201
      go201 = '\x201' : go202
      go202 = '\x202' : go203
      go203 = '\x203' : go204
      go204 = '\x204' : go205
      go205 = '\x205' : go206
      go206 = '\x206' : go207
      go207 = '\x207' : go208
      go208 = '\x208' : go209
      go209 = '\x209' : go210
      go210 = '\x210' : go211
      go211 = '\x211' : go212
      go212 = '\x212' : go213
      go213 = '\x213' : go214
      go214 = '\x214' : go215
      go215 = '\x215' : go216
      go216 = '\x216' : go217
      go217 = '\x217' : go218
      go218 = '\x218' : go219
      go219 = '\x219' : go220
      go220 = '\x220' : go221
      go221 = '\x221' : go222
      go222 = '\x222' : go223
      go223 = '\x223' : go224
      go224 = '\x224' : go225
      go225 = '\x225' : go226
      go226 = '\x226' : go227
      go227 = '\x227' : go228
      go228 = '\x228' : go229
      go229 = '\x229' : go230
      go230 = '\x230' : go231
      go231 = '\x231' : go232
      go232 = '\x232' : go233
      go233 = '\x233' : go234
      go234 = '\x234' : go235
      go235 = '\x235' : go236
      go236 = '\x236' : go237
      go237 = '\x237' : go238
      go238 = '\x238' : go239
      go239 = '\x239' : go240
      go240 = '\x240' : go241
      go241 = '\x241' : go242
      go242 = '\x242' : go243
      go243 = '\x243' : go244
      go244 = '\x244' : go245
      go245 = '\x245' : go246
      go246 = '\x246' : go247
      go247 = '\x247' : go248
      go248 = '\x248' : go249
      go249 = '\x249' : go250
      go250 = '\x250' : go251
      go251 = '\x251' : go252
      go252 = '\x252' : go253
      go253 = '\x253' : go254
      go254 = '\x254' : go255
      go255 = '\x255' : go256
      go256 = '\x256' : go0
  in go0
badletrec' =
  let go0   = 'a' : go1
      go1   = '\x1' : go2
      go2   = '\x2' : go3
      go3   = '\x3' : go4
      go4   = '\x4' : go5
      go5   = '\x5' : go6
      go6   = '\x6' : go7
      go7   = '\x7' : go8
      go8   = '\x8' : go9
      go9   = '\x9' : go10
      go10  = '\x10' : go11
      go11  = '\x11' : go12
      go12  = '\x12' : go13
      go13  = '\x13' : go14
      go14  = '\x14' : go15
      go15  = '\x15' : go16
      go16  = '\x16' : go17
      go17  = '\x17' : go18
      go18  = '\x18' : go19
      go19  = '\x19' : go20
      go20  = '\x20' : go21
      go21  = '\x21' : go22
      go22  = '\x22' : go23
      go23  = '\x23' : go24
      go24  = '\x24' : go25
      go25  = '\x25' : go26
      go26  = '\x26' : go27
      go27  = '\x27' : go28
      go28  = '\x28' : go29
      go29  = '\x29' : go30
      go30  = '\x30' : go31
      go31  = '\x31' : go32
      go32  = '\x32' : go33
      go33  = '\x33' : go34
      go34  = '\x34' : go35
      go35  = '\x35' : go36
      go36  = '\x36' : go37
      go37  = '\x37' : go38
      go38  = '\x38' : go39
      go39  = '\x39' : go40
      go40  = '\x40' : go41
      go41  = '\x41' : go42
      go42  = '\x42' : go43
      go43  = '\x43' : go44
      go44  = '\x44' : go45
      go45  = '\x45' : go46
      go46  = '\x46' : go47
      go47  = '\x47' : go48
      go48  = '\x48' : go49
      go49  = '\x49' : go50
      go50  = '\x50' : go51
      go51  = '\x51' : go52
      go52  = '\x52' : go53
      go53  = '\x53' : go54
      go54  = '\x54' : go55
      go55  = '\x55' : go56
      go56  = '\x56' : go57
      go57  = '\x57' : go58
      go58  = '\x58' : go59
      go59  = '\x59' : go60
      go60  = '\x60' : go61
      go61  = '\x61' : go62
      go62  = '\x62' : go63
      go63  = '\x63' : go64
      go64  = '\x64' : go65
      go65  = '\x65' : go66
      go66  = '\x66' : go67
      go67  = '\x67' : go68
      go68  = '\x68' : go69
      go69  = '\x69' : go70
      go70  = '\x70' : go71
      go71  = '\x71' : go72
      go72  = '\x72' : go73
      go73  = '\x73' : go74
      go74  = '\x74' : go75
      go75  = '\x75' : go76
      go76  = '\x76' : go77
      go77  = '\x77' : go78
      go78  = '\x78' : go79
      go79  = '\x79' : go80
      go80  = '\x80' : go81
      go81  = '\x81' : go82
      go82  = '\x82' : go83
      go83  = '\x83' : go84
      go84  = '\x84' : go85
      go85  = '\x85' : go86
      go86  = '\x86' : go87
      go87  = '\x87' : go88
      go88  = '\x88' : go89
      go89  = '\x89' : go90
      go90  = '\x90' : go91
      go91  = '\x91' : go92
      go92  = '\x92' : go93
      go93  = '\x93' : go94
      go94  = '\x94' : go95
      go95  = '\x95' : go96
      go96  = '\x96' : go97
      go97  = '\x97' : go98
      go98  = '\x98' : go99
      go99  = '\x99' : go100
      go100 = '\x100' : go101
      go101 = '\x101' : go102
      go102 = '\x102' : go103
      go103 = '\x103' : go104
      go104 = '\x104' : go105
      go105 = '\x105' : go106
      go106 = '\x106' : go107
      go107 = '\x107' : go108
      go108 = '\x108' : go109
      go109 = '\x109' : go110
      go110 = '\x110' : go111
      go111 = '\x111' : go112
      go112 = '\x112' : go113
      go113 = '\x113' : go114
      go114 = '\x114' : go115
      go115 = '\x115' : go116
      go116 = '\x116' : go117
      go117 = '\x117' : go118
      go118 = '\x118' : go119
      go119 = '\x119' : go120
      go120 = '\x120' : go121
      go121 = '\x121' : go122
      go122 = '\x122' : go123
      go123 = '\x123' : go124
      go124 = '\x124' : go125
      go125 = '\x125' : go126
      go126 = '\x126' : go127
      go127 = '\x127' : go128
      go128 = '\x128' : go129
      go129 = '\x129' : go130
      go130 = '\x130' : go131
      go131 = '\x131' : go132
      go132 = '\x132' : go133
      go133 = '\x133' : go134
      go134 = '\x134' : go135
      go135 = '\x135' : go136
      go136 = '\x136' : go137
      go137 = '\x137' : go138
      go138 = '\x138' : go139
      go139 = '\x139' : go140
      go140 = '\x140' : go141
      go141 = '\x141' : go142
      go142 = '\x142' : go143
      go143 = '\x143' : go144
      go144 = '\x144' : go145
      go145 = '\x145' : go146
      go146 = '\x146' : go147
      go147 = '\x147' : go148
      go148 = '\x148' : go149
      go149 = '\x149' : go150
      go150 = '\x150' : go151
      go151 = '\x151' : go152
      go152 = '\x152' : go153
      go153 = '\x153' : go154
      go154 = '\x154' : go155
      go155 = '\x155' : go156
      go156 = '\x156' : go157
      go157 = '\x157' : go158
      go158 = '\x158' : go159
      go159 = '\x159' : go160
      go160 = '\x160' : go161
      go161 = '\x161' : go162
      go162 = '\x162' : go163
      go163 = '\x163' : go164
      go164 = '\x164' : go165
      go165 = '\x165' : go166
      go166 = '\x166' : go167
      go167 = '\x167' : go168
      go168 = '\x168' : go169
      go169 = '\x169' : go170
      go170 = '\x170' : go171
      go171 = '\x171' : go172
      go172 = '\x172' : go173
      go173 = '\x173' : go174
      go174 = '\x174' : go175
      go175 = '\x175' : go176
      go176 = '\x176' : go177
      go177 = '\x177' : go178
      go178 = '\x178' : go179
      go179 = '\x179' : go180
      go180 = '\x180' : go181
      go181 = '\x181' : go182
      go182 = '\x182' : go183
      go183 = '\x183' : go184
      go184 = '\x184' : go185
      go185 = '\x185' : go186
      go186 = '\x186' : go187
      go187 = '\x187' : go188
      go188 = '\x188' : go189
      go189 = '\x189' : go190
      go190 = '\x190' : go191
      go191 = '\x191' : go192
      go192 = '\x192' : go193
      go193 = '\x193' : go194
      go194 = '\x194' : go195
      go195 = '\x195' : go196
      go196 = '\x196' : go197
      go197 = '\x197' : go198
      go198 = '\x198' : go199
      go199 = '\x199' : go200
      go200 = '\x200' : go201
      go201 = '\x201' : go202
      go202 = '\x202' : go203
      go203 = '\x203' : go204
      go204 = '\x204' : go205
      go205 = '\x205' : go206
      go206 = '\x206' : go207
      go207 = '\x207' : go208
      go208 = '\x208' : go209
      go209 = '\x209' : go210
      go210 = '\x210' : go211
      go211 = '\x211' : go212
      go212 = '\x212' : go213
      go213 = '\x213' : go214
      go214 = '\x214' : go215
      go215 = '\x215' : go216
      go216 = '\x216' : go217
      go217 = '\x217' : go218
      go218 = '\x218' : go219
      go219 = '\x219' : go220
      go220 = '\x220' : go221
      go221 = '\x221' : go222
      go222 = '\x222' : go223
      go223 = '\x223' : go224
      go224 = '\x224' : go225
      go225 = '\x225' : go226
      go226 = '\x226' : go227
      go227 = '\x227' : go228
      go228 = '\x228' : go229
      go229 = '\x229' : go230
      go230 = '\x230' : go231
      go231 = '\x231' : go232
      go232 = '\x232' : go233
      go233 = '\x233' : go234
      go234 = '\x234' : go235
      go235 = '\x235' : go236
      go236 = '\x236' : go237
      go237 = '\x237' : go238
      go238 = '\x238' : go239
      go239 = '\x239' : go240
      go240 = '\x240' : go241
      go241 = '\x241' : go242
      go242 = '\x242' : go243
      go243 = '\x243' : go244
      go244 = '\x244' : go245
      go245 = '\x245' : go246
      go246 = '\x246' : go247
      go247 = '\x247' : go248
      go248 = '\x248' : go249
      go249 = '\x249' : go250
      go250 = '\x250' : go251
      go251 = '\x251' : go252
      go252 = '\x252' : go253
      go253 = '\x253' : go254
      go254 = '\x254' : go255
      go255 = '\x255' : go256
      go256 = '\x256' : go0
  in go0


isSuccess :: Result -> Bool
isSuccess (Success _) = True
isSuccess (Failure _) = False

results :: [Result]
results =
  [ $(inspectTest $ 'letrec === 'something_else)
  , $(inspectTest $ 'bigletrec === 'badletrec')
  ]

main :: IO ()
main = do
  if fmap isSuccess results == [False, False]
     then exitSuccess
     else exitFailure
