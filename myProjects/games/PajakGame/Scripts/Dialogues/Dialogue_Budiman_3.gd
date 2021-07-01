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
			"text" : "Gimana usaha?",
			"emotion": "lelah",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Aku udah mulai bayar pajak kayak kamu, bang. Ternyata tidak serepot yang aku kira.",
			"emotion": "normal",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Bagus, bagus. Kalau gini persaingan kita lebih sportip. Martabak Manis vs Hok Lo Pan",
			"emotion": "lelah",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Tunggu kamu, Bang!",
			"emotion": "marah",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Aku tunggu, Bud!",
			"emotion": "marah",
			"next_index" : "7"
		},
		"7":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
