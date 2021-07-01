# Mode: text, choice, closing
# Emotion: normal, lelah, marah, sedih, senang, terkejut, normal_lurus
# Reward: [level_name, level_added] : kota, harta, dosa

var dialogue = \
{
	"other_character_path":"res://Scripts/CharactersData/Bebeb.gd",
	"dialogues":\
	{
		"0":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Halo, cantik. Bisa abang Bambang bantu?",
			"emotion": "senang",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Martabak spesial cokelat, satu. Martabak stroberi, dua, bang",
			"emotion": "normal",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Siap, neng!\nMau ditambah apa lagi, neng? Butuh ekstra belahan hati? Karena abang punya satu",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Nggak, deh bang. Aku maunya cuma lelaki budiman, yang bertanggung jawab, dan setia seumur hidup",
			"emotion": "lelah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Wah, cocok dong! Kan aku ...",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "choice",
			
			"option_1_text":"Aku punya banyak uang",
			"option_1_next_index" : "6",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Aku bisa bikin martabak",
			"option_2_next_index" : "6",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Aku rajin bayar pajak",
			"option_3_next_index" : "8",
			"option_3_reward" : ["", 0]
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ah! Yang gituan sih banyak. Nggak selevel dengan aku",
			"emotion": "lelah",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "uhmm...\nTa-tapi-tapi, aku rajin bayar pajak loh!",
			"emotion": "sedih",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Serius, bang? Aduh~ jatuh cinta aku",
			"emotion": "senang",
			"next_index" : "10"
		},
		"10":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Kalau gitu, pesanannya jadi 1 cokelat, 2 stroberi, dan seperangkat alat sholat, ya neng",
			"emotion": "senang",
			"next_index" : "11"
		},
		"11":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
