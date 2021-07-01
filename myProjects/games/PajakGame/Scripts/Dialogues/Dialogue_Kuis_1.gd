# Mode: text, choice, closing
# Emotion: normal, lelah, marah, sedih, senang, terkejut, normal_lurus
# Reward: [level_name, level_added] : kota, harta, dosa

var dialogue = \
{
	"other_character_path":"res://Scripts/CharactersData/Ajib.gd",
	"dialogues":\
	{
		"0":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Yah kamu lagi",
			"emotion": "lelah",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ampun, bang. Awak cuma bawa kabar gembira untuk kita semua.\nBambang berkesempatan mendapat uang lewat kuis berhadiah!",
			"emotion": "sedih",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Kuis berhadiah?\nSeriusan nih? Yah udah, gas!",
			"emotion": "lelah",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Oke, bang.\nNomor 1, lengkapi pernyataan berikut: 'Kemudian daripada itu untuk membentuk suatu pemerintah negara Republik Indonesia -",
			"emotion": "senang",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "- yang melindungi segenap bangsa Indonesia dan seluruh tumpah darah Indonesia dan untuk ...' \nSilahkan dilengkapi!",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "choice",
			
			"option_1_text":"memajukan kesejahteraan umum",
			"option_1_next_index" : "7",
			"option_1_reward" : ["harta", 10],
			
			"option_2_text":"memajukan kesejahteraan Bambang",
			"option_2_next_index" : "6",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"memajukan kesejahteraan dunia",
			"option_3_next_index" : "6",
			"option_3_reward" : ["", 0]
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Aduh, bang. Jawabannya itu: 'memajukan kesejahteraan umum'. Ini dikutip dari alinea keempat pembukaan UUD 1945. Jangan lupa, bang!",
			"emotion": "sedih",
			"next_index" : "8"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Sepuluh juta rupiaah!!!! ",
			"emotion": "senang",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ok. Pertanyaan kedua:\nKapan Hari Pajak diperingati?",
			"emotion": "normal",
			"next_index" : "9"
		},
		"9":{
			"mode" : "choice",
			
			"option_1_text":"4 Mei",
			"option_1_next_index" : "10",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"2 Juli",
			"option_2_next_index" : "10",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"14 Juli",
			"option_3_next_index" : "11",
			"option_3_reward" : ["harta", 20]
		},
		"10":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Sayang sekali, bang.. jawabannya 14 Juli.\nHARPANAS pertama itu digelar mulai pada tahun 2018.",
			"emotion": "sedih",
			"next_index" : "12"
		},
		"11":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "DUA PULUH JUTA RUPIAAAAH!!!",
			"emotion": "senang",
			"next_index" : "12"
		},
		"12":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ronde terakhir, bang.\nSebutkan nomor layanan Kring Pajak!",
			"emotion": "senang",
			"next_index" : "13"
		},
		"13":{
			"mode" : "choice",
			
			"option_1_text":"1500100",
			"option_1_next_index" : "14",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"1500200",
			"option_2_next_index" : "15",
			"option_2_reward" : ["harta", 30],
			
			"option_3_text":"1500300",
			"option_3_next_index" : "14",
			"option_3_reward" : ["harta", 0]
		},
		"14":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "yah... sayang sekali salah, bang. Kalau perlu apa-apa, kring 1500 200, bang.",
			"emotion": "sedih",
			"next_index" : "16"
		},
		"15":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "TIGA PULUH JUTA RUPIAAAAAAAAH!!!",
			"emotion": "senang",
			"next_index" : "16"
		},
		"16":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Oke, bang. Udahan dulu. Tenggorokan awak cape'. Sampai jumpa di kesempatan berikutnya!",
			"emotion": "senang",
			"next_index" : "17"
		},
		"17":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "da dah",
			"emotion": "normal",
			"next_index" : "18"
		},
		"18":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
