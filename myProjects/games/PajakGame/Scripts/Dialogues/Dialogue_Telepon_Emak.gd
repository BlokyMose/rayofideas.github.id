# Mode: text, choice, closing
# Emotion: normal, lelah, marah, sedih, senang, terkejut, normal_lurus
# Reward: [level_name, level_added] : kota, harta, dosa

var dialogue = \
{
	"other_character_path":"res://Scripts/CharactersData/Telepon.gd",
	"dialogues":\
	{
		"0":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "HALOooOoO!!",
			"emotion": "marah",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Martabak Bambang, enak gurih renyah. Dengan Bambang, bisa saya bantu?",
			"emotion": "normal",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "INI EMAKK, HAaALLOOoOO!!",
			"emotion": "marah",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Emak? Kenapa nggak nelpon lewat HP, mak?",
			"emotion": "lelah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "AAAAAaaAAa?! APA KAUUU BILANGG!??? 'DAK KEDENGARAAAAANNN!",
			"emotion": "marah",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "... \n\nAda apa nelpon, mak",
			"emotion": "normal",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "INI, NAAaAK! DJP MINTA UANG KE EMAK UNTUK BIKIN BUKU PERPAJAKAN.\n\nKURANG UANGNYA EMAK Rp2 JUTA",
			"emotion": "marah",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Itu penipuan, mak. Dirjen Pajak nggak pernah minta-minta uang, toh semua layanannya gratis.",
			"emotion": "terkejut",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "APAAaAaAA!??? GRATIIISSS??",
			"emotion": "marah",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Kalau informasi pribadi juga jangan dikasih, Mak. KTP, SIM, segala macam.",
			"emotion": "normal",
			"next_index" : "10"
		},
		"10":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "BETULAAaAAaN!???",
			"emotion": "marah",
			"next_index" : "11"
		},
		"11":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Iya, mak.",
			"emotion": "normal",
			"next_index" : "12"
		},
		"12":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "...",
			"emotion": "normal",
			"next_index" : "13"
		},
		"13":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "OH!",
			"emotion": "marah",
			"next_index" : "14"
		},
		"14":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Ada lagi, Mak?",
			"emotion": "normal",
			"next_index" : "15"
		},
		"15":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "BAGAIMANA KABaAAaRNYA DEDEKMU, BUD? AGUS PUNYA HIDUNG SUDAH SEMBUuUH? EMAKNYA PACARNYA SERING DATANG KE RUMAH, KASIH PECEL. EEeENAK!",
			"emotion": "marah",
			"next_index" : "16"
		},
		"16":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Adek? Budi? Agus?\nSaya Bambang, mak.",
			"emotion": "lelah",
			"next_index" : "17"
		},
		"17":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "...",
			"emotion": "normal",
			"next_index" : "18"
		},
		"18":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "OH!\n\nSALAH SAMBUNG! EMAK KIRA KAMU BUDIMAN",
			"emotion": "marah",
			"next_index" : "19"
		},
		"19":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "...\n\nYah sudah kalau begitu.",
			"emotion": "lelah",
			"next_index" : "20"
		},
		"20":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "SABAR, BANG! EMAK PESEN SATU MARTABAK COKELAT. EMAK LAPER.",
			"emotion": "marah",
			"next_index" : "21"
		},
		"21":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "iya, Mak.",
			"emotion": "lelah",
			"next_index" : "22"
		},
		"22":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
