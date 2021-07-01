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
			"text" : "Ada siluman!",
			"emotion": "terkejut",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Halo, bapak. Awak bukan siluman, bapak. Awak itu petugas pajak",
			"emotion": "normal",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "oooh.... Gangguin aja",
			"emotion": "normal",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Yah elah, Pak. Awak cuma minta bapak isi survei. \nAda waktu, Pak?",
			"emotion": "lelah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Oh jelas. Apapun untuk negara tercinta. Silahkan!",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Terima kasih, Bapak. \nNomor 1. Nama perusahaan bapak apa?",
			"emotion": "senang",
			"next_index" : "6"
		},
		"6":{
			"mode" : "choice",
			
			"option_1_text":"PT Cinta Martabak",
			"option_1_next_index" : "9",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"PT Semerbak Martabak",
			"option_2_next_index" : "9",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"(Pilihan lain)",
			"option_3_next_index" : "7",
			"option_3_reward" : ["", 0]
		},
		"7":{
			"mode" : "choice",
			
			"option_1_text":"PT Anti Patah Hati",
			"option_1_next_index" : "9",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"PT Sudah terbiasa",
			"option_2_next_index" : "9",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"(Pilihan lain)",
			"option_3_next_index" : "8",
			"option_3_reward" : ["", 0]
		},
		"8":{
			"mode" : "choice",
			
			"option_1_text":"PT Setia Takjir",
			"option_1_next_index" : "9",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"PT Bambang Ganteng",
			"option_2_next_index" : "9",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"(Pilihan lain)",
			"option_3_next_index" : "6",
			"option_3_reward" : ["", 0]
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Namanya sangat kreatif, ya Pak. \nNomor 2. Apakah Bapak rajin bayar pajak?",
			"emotion": "normal",
			"next_index" : "10"
		},
		"10":{
			"mode" : "choice",
			
			"option_1_text":"Pajak? Apaan?",
			"option_1_next_index" : "101",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Iya dong!",
			"option_2_next_index" : "102",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Anu.. tadi baru mau bayar tapi ada anu.. kamu anu...",
			"option_3_next_index" : "103",
			"option_3_reward" : ["", 0]
		},
		"101":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Aduh, Bapak. Pajak itu uang yang dipungut negara untuk membangun negara. Harus rajin dibayar per bulan",
			"emotion": "sedih",
			"next_index" : "11"
		},
		"102":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Awak terkesima dengan Bapak. Tanggal bayar udah dekat, terus ingat, ya Pak",
			"emotion": "senang",
			"next_index" : "11"
		},
		"103":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Aduh, Bapak. Jangan malas, nanti pembangunan negara terhambat loh",
			"emotion": "sedih",
			"next_index" : "11"
		},
		"11":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "iya, iya. Ada lagi?",
			"emotion": "normal",
			"next_index" : "12"
		},
		"12":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Terakhir. \nMenurut Bapak, bagaimana performa petugas pajak sekarang ini?",
			"emotion": "normal",
			"next_index" : "13"
		},
		"13":{
			"mode" : "choice",
			
			"option_1_text":"Bagus dong",
			"option_1_next_index" : "14",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"B-b-b..bbagus dong!",
			"option_2_next_index" : "14",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Semenjak kamu ada, performanya tambah bagus dong!",
			"option_3_next_index" : "14",
			"option_3_reward" : ["", 0]
		},
		"14":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Terima kasih, Bapak. Aku pamit dulu. Sampai jumpa lagi~",
			"emotion": "senang",
			"next_index" : "15"
		},
		"15":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "da dah",
			"emotion": "normal",
			"next_index" : "16"
		},
		"16":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
