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
			"text" : "Budiman...",
			"emotion": "lelah",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Bambang...",
			"emotion": "lelah",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Bagaimana usaha martabak manismu? \nKelihatannya tidak selancar punyaku pastinya.",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Cih! Namanya itu Hok Lo Pan, bukan martabak manis. Dengarnya jijik tau nggak!",
			"emotion": "marah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Aku lebih mending bersekutu dengan Terang Bulan daripada dengan Hok Lo Pan.",
			"emotion": "marah",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Gini-gini bisnis aku lancar loh\nDasar!",
			"emotion": "marah",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Lu kan nggak bayar pajak, makanya masih bertahan!",
			"emotion": "marah",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Susssh!! Pajak tuh nggak ada gunanya.\nOrang Bijak Nggak Bayar Pajak.",
			"emotion": "marah",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Idih! Tunggu lu yah, biar tau rasa!",
			"emotion": "marah",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Cih!",
			"emotion": "marah",
			"next_index" : "10"
		},
		"10":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
