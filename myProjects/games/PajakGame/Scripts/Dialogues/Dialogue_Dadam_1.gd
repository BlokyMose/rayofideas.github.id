# Mode: text, choice, closing
# Emotion: normal, lelah, marah, sedih, senang, terkejut, normal_lurus
# Reward: [level_name, level_added] : kota, harta, dosa

var dialogue = \
{
	"other_character_path":"res://Scripts/CharactersData/Dadam.gd",
	"dialogues":\
	{
		"0":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Wah wah, ada Mas Dadam",
			"emotion": "senang",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Halooo~~ Lagi bikin apa nih~?",
			"emotion": "senang",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Lagi bikin martabak, Mas. Belakang ini lagi laku keras, Mas.",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Wis, mantap!\nNih, Mas. Aku mau ngobrol dikit mengenai usaha mas. Tapi sebelum itu kita main game dulu, Mas.",
			"emotion": "senang",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ini game-nya simple aja sih. Sebenarnya aku akan memberikan rapid kuestion, nggak ada salah dan benarnya, jadi rileks aja. \nJadi, aniting tet pops up in mind, boleh di-sher aja",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : ".. ok..(?)",
			"emotion": "normal",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "OK! Pertanyaan nomor satu:\nMengapa nama mas itu Bambang?",
			"emotion": "senang",
			"next_index" : "7"
		},
		"7":{
			"mode" : "choice",
			
			"option_1_text":"Karena saya mau jadi presiden",
			"option_1_next_index" : "8",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Karena saya mau jadi pesepak bola terkenal",
			"option_2_next_index" : "8",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Karena Bembeng mirip nama cokelat",
			"option_3_next_index" : "8",
			"option_3_reward" : ["", 0]
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Oh... begitu yah, mek sens",
			"emotion": "senang",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "...\n\nIya, mas, mek sens mek sens",
			"emotion": "normal",
			"next_index" : "10"
		},
		"10":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "OK! Pertanyaan berikutnya: Andai punya uang nih, mas mau kasih nama apa perusahaan game-nya, mas?",
			"emotion": "senang",
			"next_index" : "11"
		},
		"11":{
			"mode" : "choice",
			
			"option_1_text":"Martabak Production",
			"option_1_next_index" : "12",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Martabanesia",
			"option_2_next_index" : "12",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Martagate",
			"option_3_next_index" : "12",
			"option_3_reward" : ["", 0]
		},
		"12":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Nais, nais. \nTerakhir, mas. Podcast terfavorit mas:",
			"emotion": "senang",
			"next_index" : "13"
		},
		"13":{
			"mode" : "choice",
			
			"option_1_text":"Apa Kata Dunia Podcast",
			"option_1_next_index" : "14",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Press Start!",
			"option_2_next_index" : "14",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Telinga Najwa",
			"option_3_next_index" : "14",
			"option_3_reward" : ["", 0]
		},
		"14":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Okee. Jadi itu akhir dari pertanyaannya.\nJadi, mas, aku cuma mau ngobrol-ngobrol singkat aja mengenai perpajakan.",
			"emotion": "normal",
			"next_index" : "15"
		},
		"15":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Boleh, Mas, boleh. Aku mah rajin bayar pajak. Per bulannya wajib bayar pajak agar pembangunan kita tidak terhambat, Mas.",
			"emotion": "senang",
			"next_index" : "16"
		},
		"16":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Keren, Mas. \nItulah problem kita di zaman now. Pemerintah mau deliver pembangunan lebih faster, tapi karena invesmennya kurang, hasilnya nggak better. Betul nggak, mas?",
			"emotion": "normal",
			"next_index" : "17"
		},
		"17":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "...",
			"emotion": "normal",
			"next_index" : "18"
		},
		"18":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Aduh, Mas Dadam. Aku nggak tahu bahasa Inggris, bisa pakai bahasa Indonesia aja, nggak Mas?",
			"emotion": "normal",
			"next_index" : "19"
		},
		"19":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "A.. sori, Mas, sori",
			"emotion": "sedih",
			"next_index" : "20"
		},
		"20":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "...\n\nsama-sama, Mas",
			"emotion": "normal",
			"next_index" : "21"
		},
		"21":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "... ? ? ....\nok. Kalau gitu aku pamit undur diri dulu, Mas. Thank you, ya Mas",
			"emotion": "normal",
			"next_index" : "22"
		},
		"22":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Iya, tengkyu, mas, tengkyu.",
			"emotion": "senang",
			"next_index" : "23"
		},
		"23":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
