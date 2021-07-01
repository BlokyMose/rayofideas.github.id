# Mode: text, choice, closing
# Emotion: normal, lelah, marah, sedih, senang, terkejut, normal_lurus
# Reward: [level_name, level_added] : kota, harta, dosa

var dialogue = \
{
	"other_character_path":"res://Scripts/CharactersData/Menteri.gd",
	"dialogues":\
	{
		"0":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Weleh, weleh. Ibu Menteri datang ke gubuk Bambang.",
			"emotion": "senang",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Halo, Bapak Bambang. Katanya Bapak ini punya martabak terharum setanah air.",
			"emotion": "normal",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Ah, berlebihan itu, Bu. Martabak aku itu terharum sedunia.",
			"emotion": "senang",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "...",
			"emotion": "lelah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Ngomong-ngomong, Bapak yah. Katanya Bapak ada pertanyaan mengenai sistem perpajakan sekarang ini. Bagaimana, Bapak Bambang?",
			"emotion": "normal",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Oh! Saya bingung pajak saya itu nanti larinya ke mana yah, Bu? Seakan-akan tidak ke mana-mana gitu loh.",
			"emotion": "normal",
			"next_index" : "6"
		},
		"6":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Iya, biar saya jelaskan. Menurut data kami, sekitar 1/4 APBN kita digunakan membangun Ekonomi negara, 1/4-nya lagi untuk Pelayanan Umum. ",
			"emotion": "senang",
			"next_index" : "7"
		},
		"7":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Kalau mau lebih detailnya lagi, coba deh cek di situs www.pajak.go,id. Di sana lengkap deh.",
			"emotion": "senang",
			"next_index" : "8"
		},
		"8":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Boleh, boleh. Terakhir nih, banyak tuh anak-anak yang kerjanya cuma main game nggak jelas, seperti game jualan martabak. Bagaimana supaya mereka bisa berkontribusi ke perpajakan kita, Bu?",
			"emotion": "lelah",
			"next_index" : "9"
		},
		"9":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Iya, saya senangnya itu kalau generasi milenial bisa ikut pahami, awasi, kritisi perpajakan kita supaya mereka tahu dipakai untuk apa pajak-pajak mereka. gituh..",
			"emotion": "senang",
			"next_index" : "10"
		},
		"10":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "ok, Bu. Terima kasih atas kunjungannya yang hangat, sehangat martabakku.",
			"emotion": "senang",
			"next_index" : "11"
		},
		"11":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Sama-sama, Bapak.",
			"emotion": "normal",
			"next_index" : "12"
		},
		"12":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
