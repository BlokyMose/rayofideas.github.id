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
			"text" : "Beb, masih marah, beb?",
			"emotion": "sedih",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "...\nhng!",
			"emotion": "lelah",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Nih, beb. \nAku bawa hal yang paling bebeb suka ...",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "choice",
			
			"option_1_text":"Aku bawa uang Rp10jt",
			"option_1_next_index" : "4",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Aku bawa martabak topping es krim",
			"option_2_next_index" : "4",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Aku bawa SPT Tahunan",
			"option_3_next_index" : "6",
			"option_3_reward" : ["", 0]
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Nggak butuh!\nBanyak kok di rumah",
			"emotion": "marah",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "uhm uhm uhm..\nGimana kalau ini!!\nSPT tahunan-ku nggak ada di rumahnya bebeb, kan?",
			"emotion": "senang",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Astaga...!\nKa-kamu.. kamu ternyata rajin bayar pajak",
			"emotion": "senang",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Iya dong, beb.\nDemi bebeb dan negara, aku rajin bayar pajak supaya anak kita bisa hidup dengan aman, damai, sentosa",
			"emotion": "senang",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Yah udah, gas aja, bang Bambang",
			"emotion": "senang",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "YEEEEEEEEEEE",
			"emotion": "senang",
			"next_index" : "11"
		},
		"10":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
