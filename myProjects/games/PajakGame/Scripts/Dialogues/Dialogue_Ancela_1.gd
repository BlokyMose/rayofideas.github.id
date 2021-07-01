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
			"text" : "Ancela Ancelei, pelanggan setiaku~",
			"emotion": "senang",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ey Bang! Lapar! Saya mo makan cpt cpt",
			"emotion": "normal",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Mau pesan apa hari ini, Ancela? Martabak asin? Martabak manis? Martabak asam manis?",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Lama gak makan bisa tepar\nTambah lama gak makan bisa buta\nUdah tahu aku lapar\nMasih aja melontar kata",
			"emotion": "marah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Keluar kota tanpa bensin\nMulai lapar, aku pun kronis\nKalau kaga suka martabak asin\nBagaimana kalau asam manis?",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Silahkan!",
			"emotion": "senang",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "nyam nyam!",
			"emotion": "senang",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Apa ini!? Pajak 10%? Ko kira saya punya banyak uang?",
			"emotion": "marah",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Ancela, itu pajak gunanya itu bangun negara. Bangga dong ikut serta membangun negara. Toh ujung-ujungnya buat kamu juga.",
			"emotion": "senang",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Sudah mi pae.",
			"emotion": "lelah",
			"next_index" : "10"
		},
		"10":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
