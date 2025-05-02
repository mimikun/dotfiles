---@type ({theme: string}|DropDate|{from:DropDate, to:DropDate}|{holiday:"us_thanksgiving"|"easter"})[]
local themes = {
    -- 正月: 1/1
    { theme = "new_year", month = 1, day = 1 },
    -- FF7の日: 1/31
    { theme = "fantasy", month = 1, day = 31 },
    -- バイナリの日: 2/1
    { theme = "binary", month = 2, day = 1 },
    -- バレンタインデー: 2/14
    { theme = "valentines_day", month = 2, day = 14 },
    -- 猫の日: 2/22
    { theme = "cats", month = 2, day = 22 },
    -- 科学小説の日: 2/28
    { theme = "cyberpunk", month = 2, day = 28 },
    -- 聖パトリックの祝日: 3/17
    { theme = "st_patricks_day", month = 3, day = 17 },
    -- 春分: 3/21
    { theme = "zodiac", month = 3, day = 21 },
    -- マトリックス映画の日: 3/31
    { theme = "matrix", month = 3, day = 31 },
    -- エイプリルフール: 4/1
    { theme = "april_fools", month = 4, day = 1 },
    -- パンの日: 4/12
    { theme = "bakery", month = 4, day = 12 },
    -- ガーデニングデー: 4/14
    { theme = "garden", month = 4, day = 14 },
    -- 世界芸術の日: 4/15
    { theme = "art", month = 4, day = 15 },
    -- よい風呂の日(テルマエ・ロマエ): 4/26
    { theme = "spa", month = 4, day = 26 },
    -- メーデー: 5/1
    { theme = "business", month = 5, day = 1 },
    -- ラスベガスデー: 5/15
    { theme = "casino", month = 5, day = 15 },
    -- 世界農業デー: 5/20
    { theme = "farm", month = 5, day = 20 },
    -- 復活祭(イースター): 不定
    { theme = "easter", holiday = "easter" },
    -- ハンバーガーデー: 5/28
    { theme = "diner", month = 5, day = 28 },
    -- 測量の日: 6/3
    { theme = "explorer", month = 6, day = 3 },
    -- 虫の日: 6/4
    { theme = "bugs", month = 6, day = 4 },
    -- 世界海洋デー: 6/8
    { theme = "deepsea", month = 6, day = 8 },
    -- ノスタルジアデー: 6/9
    { theme = "retro", month = 6, day = 9 },
    -- 時の記念日: 6/10
    { theme = "temporal", month = 6, day = 10 },
    -- スペースインベーダーの日: 6/16
    { theme = "arcade", month = 6, day = 16 },
    -- 世界砂漠デー: 6/17
    { theme = "desert", month = 6, day = 17 },
    -- 夏至: 6/21
    { theme = "mystical", month = 6, day = 21 },
    -- 世界熱帯雨林デー: 6/22
    { theme = "jungle", month = 6, day = 22 },
    -- 聖ヨハネの祝日: 6/24
    { theme = "medieval", month = 6, day = 24 },
    -- アメリカ独立記念日
    { theme = "us_independence_day", month = 7, day = 4 },
    -- 国際サーカスの日: 7/6
    { theme = "carnival", month = 7, day = 6 },
    -- 世界絵文字デー: 7/17
    { theme = "emotional", month = 7, day = 17 },
    -- TODO: it
    -- 海の日: 7月第3月曜日
    { theme = "ocean", month = 7, day = 21 },
    -- カウボーイデー: 7/23
    { theme = "wildwest", month = 7, day = 23 },
    -- 開拓者の日: 7/24
    { theme = "explorer", month = 7, day = 24 },
    -- 船の日: 7/25
    { theme = "pirate", month = 7, day = 25 },
    -- 世界自然保護デー: 7/28
    { theme = "wilderness", month = 7, day = 28 },
    -- ハリー・ポッターの誕生日: 7/31
    { theme = "magical", month = 7, day = 31 },
    -- 国際ボードゲームの日: 8/8
    { theme = "dice", month = 8, day = 8 },
    -- TODO: it
    -- 流星群観測日: 8/12頃
    { theme = "stars", month = 8, day = 12 },
    -- ハワイ州の日: 8/15
    { theme = "beach", month = 8, day = 15 },
    -- ハワイアンデー: 8/21
    { theme = "beach", month = 8, day = 21 },
    --宇宙の日: 9/12
    { theme = "space", month = 9, day = 12 },
    -- コーヒー豆の日: 9/29
    { theme = "coffee", month = 9, day = 29 },
    -- 国際音楽の日: 10/1
    { theme = "musical", month = 10, day = 1 },
    -- 世界動物の日: 10/4
    { theme = "zoo", month = 10, day = 4 },
    -- TODO: it
    -- 中秋の名月: 10/6 (2025Y)
    { theme = "lunar", month = 10, day = 6 },
    -- ミステリー記念日: 10/7
    { theme = "mystery", month = 10, day = 7 },
    -- 世界宇宙週間: 10/4-10/10
    { theme = "space", from = { month = 10, day = 4 }, to = { month = 10, day = 10 } },
    -- 海外旅行の日: 10/19
    { theme = "travel", month = 10, day = 19 },
    -- バック・トゥ・ザ・フューチャーの日: 10/21
    { theme = "steampunk", month = 10, day = 21 },
    -- TODO: it
    -- スポーツの日: 10月第2月曜日
    { theme = "sports", month = 10, day = 10 },
    -- 数学者の日: 10/10
    { theme = "mathematical", month = 10, day = 10 },
    -- ハロウィン: 10/31
    { theme = "halloween", month = 10, day = 31 },
    -- 世界都市計画の日: 11/8
    { theme = "urban", month = 11, day = 8 },
    -- お菓子の日: 11/11
    { theme = "candy", month = 11, day = 11 },
    -- いい風呂の日: 11/26
    { theme = "spa", month = 11, day = 26 },
    -- サンクスギビング: 11月の第4木曜日頃
    { theme = "us_thanksgiving", holiday = "us_thanksgiving" },
    -- ウィンター・ワンダーランド(Overwatch): 12/17-1/6
    { theme = "winter_wonderland", from = { month = 12, day = 17 }, to = { month = 1, day = 6 } },
    -- 冬至: 12/21
    { theme = "nocturnal", month = 12, day = 21 },
    -- クリスマス: 12/24-12/25
    { theme = "xmas", from = { month = 12, day = 24 }, to = { month = 12, day = 25 } },
    -- トランプの日: 12/28
    { theme = "cards", month = 12, day = 28 },
    -- 春: 3/20-6/20
    { theme = "spring", from = { month = 3, day = 20 }, to = { month = 6, day = 20 } },
    -- 夏: 6/21-9/22
    { theme = "summer", from = { month = 6, day = 21 }, to = { month = 9, day = 22 } },
    -- 秋: 9/23-12/22
    { theme = "leaves", from = { month = 9, day = 23 }, to = { month = 12, day = 22 } },
    -- 冬: 12/23-3/19
    { theme = "snow", from = { month = 12, day = 23 }, to = { month = 3, day = 19 } },
}

return themes
