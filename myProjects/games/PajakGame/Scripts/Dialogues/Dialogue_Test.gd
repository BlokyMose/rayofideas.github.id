# Mode: text, choice, closing
# Emotion: normal, lelah, marah, sedih, senang, terkejut, normal_lurus
# Reward: [level_name, level_added] : kota, harta, dosa

var dialogue = \
{
	"other_character_path":"res://Scripts/CharactersData/Bambang.gd",
	"dialogues":\
	{
		"0":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Halo, Bambang",
			"emotion": "normal",
			"next_index" : "1"
		},
		"1": {
			"mode" : "choice",
			
			"option_1_text":"Halo, kamu",
			"option_1_next_index" : "3",
			"option_1_reward" : ["kota", 25],
			
			"option_2_text":"Kamu siapa?",
			"option_2_next_index" : "3",
			"option_2_reward" : ["kota", 25],
			
			
			"option_3_text":"(Pilihan lain)",
			"option_3_next_index" : "4",
			"option_3_reward" : ["kota", 25]
		},
		"2":{
			"mode" : "closing",
			"peristiwa_path" : ""
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Nggak kenal akh!!",
			"emotion": "marah",
			"next_index" : "2"
		},
		"4": {
			"mode" : "choice",
			
			"option_1_text":"SIAPA!?",
			"option_1_next_index" : "3",
			
			"option_2_text":"EE kamu",
			"option_2_next_index" : "3",
			
			"option_3_text":"(Pilihan tadi)",
			"option_3_next_index" : "1",
		},
	}
}
