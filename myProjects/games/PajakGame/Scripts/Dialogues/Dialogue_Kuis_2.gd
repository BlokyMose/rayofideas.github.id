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
			"text" : "Yah.. dia lagi",
			"emotion": "lelah",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Selamat berjumpa lagi, Bang. Awak datang lagi untuk membawa kabar gembira untuk kita semua.\nBambang berkesempatan mendapat uang lewat kuis berhadiah jilid kedua!",
			"emotion": "sedih",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Langsung aja, bro",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Oke, bang.\nPertanyaan pertama, apa kepanjangan NPWP?",
			"emotion": "senang",
			"next_index" : "5"
		},
		"5":{
			"mode" : "choice",
			
			"option_1_text":"Nomor Pemilik Wajib Pajak",
			"option_1_next_index" : "6",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Nomor Peserta Wajib Pajak",
			"option_2_next_index" : "6",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Nomor Pokok Wajib Pajak",
			"option_3_next_index" : "7",
			"option_3_reward" : ["harta", 10]
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Tipis sekali, Bang. NPWP itu kepanjangan dari Nomor POKOK Wajib Pajak.",
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
			"text" : "Ok. Pertanyaan kedua:\nBerikut yang BUKAN slogan yang pernah dipakai Dirjen Pajak:",
			"emotion": "normal",
			"next_index" : "9"
		},
		"9":{
			"mode" : "choice",
			
			"option_1_text":"Orang Bijak Taat Pajak",
			"option_1_next_index" : "10",
			"option_1_reward" : ["", 0],
			
			"option_2_text":"Apa Kata Dunia !?",
			"option_2_next_index" : "10",
			"option_2_reward" : ["", 0],
			
			"option_3_text":"Pajak Kita, Untuk Anda",
			"option_3_next_index" : "11",
			"option_3_reward" : ["harta", 20]
		},
		"10":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Yah... bang. Sebenarnya itu betul loh.\n'Pajak Kita' itu sebenarnya 'Untuk Kita'. Tipis, bang.",
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
			"text" : "Ronde terakhir, bang.\nApa jenis hewan yang menjadi maskot Dirjen Pajak?",
			"emotion": "senang",
			"next_index" : "14"
		},
		"14":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Nah loh. Bukannya itu kamu?",
			"emotion": "terkejut",
			"next_index" : "15"
		},
		"15":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Bukan, bang. Awak namanya Ajib, yang maskot itu namanya Kojib (Kontribusi Wajib).\nDia mah amanah, rajin ke masjid. Ajib mah ke diskotik. Ajib ajib!",
			"emotion": "sedih",
			"next_index" : "16"
		},
		"16":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "seriusan",
			"emotion": "lelah",
			"next_index" : "17"
		},
		"17":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "'canda, bang. Awak sukanya kerja aja.\nKembali ke laptop, bang. Kojib itu hewan apa hayo?",
			"emotion": "sedih",
			"next_index" : "18"
		},
		"18":{
			"mode" : "choice",
			
			"option_1_text":"Tawon",
			"option_1_next_index" : "19",
			"option_1_reward" : ["hata", 30],
			
			"option_2_text":"Lebah",
			"option_2_next_index" : "19",
			"option_2_reward" : ["harta", 30],
			
			"option_3_text":"Siluman",
			"option_3_next_index" : "20",
			"option_3_reward" : ["", 0]
		},
		"19":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Jujur, bang. awak juga nggak tau bedanya lebah dan tawon. Jadi, aku kasih aja TIGA PULUH JUTA RUPIAAAAH!!!",
			"emotion": "senang",
			"next_index" : "21"
		},
		"20":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Kan udah awak bilang, awak dan teman-teman awak itu bukan siluman, BANG!\nAh! malas awak.",
			"emotion": "lelah",
			"next_index" : "21"
		},
		"21":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Udahan, bang. Sampai jumpa lagi!",
			"emotion": "normal",
			"next_index" : "22"
		},
		"22":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "da dah",
			"emotion": "normal",
			"next_index" : "23"
		},
		"23":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
