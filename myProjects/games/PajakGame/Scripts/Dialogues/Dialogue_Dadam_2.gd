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
			"text" : "Mas Dadam! Welkom bek. Aku udah bisa berbahasa Inglish, Mas. Jadi we can talk talk pakai inglish.",
			"emotion": "senang",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Wah, keren, Mas. Kebetulan aku mau bicarain mengenai cara pengusaha untuk bisa survive di industri sekarang ini, terutama di industri game.",
			"emotion": "senang",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Survive ya, Mas? survaiv...\n\n... survaip",
			"emotion": "sedih",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "oh. oh.\nKalau mau survaip di industri game, pertama ya, mesti tahu dulu how to cook martabak. Kalau nggak bisa survaip di dunia biasa, mana bisa survaip di dunia game. Betul right?",
			"emotion": "senang",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Yes.\nAda lagi, Mas?",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Kamu juga harus belajar perpajakan. Bahasa inggrisnya itu 'tex'. \nNah, saya advais kepada yang mau buka usaha atau gem developer itu untuk belajar pajak dan proses-proses hukumnya. Tets all menurut I think sih.",
			"emotion": "senang",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Kalau aku boleh nambahin nih. Ketahui kapan mesti jadi PT itu penting. Karena kalau sudah berbadan hukum, harta pribadi para developer juga bisa terlindungi oleh badan hukumnya kalau terjadi sengketa.",
			"emotion": "senang",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Thets right. Perhitungan pajak kalau sudah berbadan hukum juga beda dengan UMKM biasa loh. Jadi mesti hati-hati.",
			"emotion": "senang",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Mas tambah jago nih.\nSelagi aku di sini, pesan martabak cokelat satu dong, Mas.",
			"emotion": "normal",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Redi, mas, redi!",
			"emotion": "senang",
			"next_index" : "10"
		},
		"10":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
