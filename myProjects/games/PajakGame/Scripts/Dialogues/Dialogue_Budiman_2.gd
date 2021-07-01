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
			"text" : "Aku denger-denger martabak kamu terbawa banjir lumpur torpedo.",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "e. e... anu... anu.. e",
			"emotion": "sedih",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Anu! Anu! Rasain lu nggak bayar pajak! Mau gimana membangun negri kalau nggak ada yang mau biayain!",
			"emotion": "marah",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Berisik lu, Bang!",
			"emotion": "marah",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Padalah pendaftarannya bisa online dan GPL lagi. Dasar pemalas!",
			"emotion": "marah",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "AaAAAaaAAAAaa~~",
			"emotion": "sedih",
			"next_index" : "8"
		},
		"8":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
