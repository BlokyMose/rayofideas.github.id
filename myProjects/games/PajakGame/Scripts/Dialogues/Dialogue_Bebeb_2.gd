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
			"text" : "Halo, beb. Udah makan? Mau aku bikinin martabak?",
			"emotion": "senang",
			"next_index" : "1"
		},
		"1":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Aduh, bang. Malas aku makan martabak terus. Bisa bikin pecel nggak?",
			"emotion": "lelah",
			"next_index" : "2"
		},
		"2":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Pecel? \nTapi pecel kan nggak enak, beb",
			"emotion": "sedih",
			"next_index" : "3"
		},
		"3":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "Nggak suka pecel? Tapi kan itu makanan favorit aku!\nYah udah, kalau gitu, mulai hari ini kita PUTUS",
			"emotion": "marah",
			"next_index" : "4"
		},
		"4":{
			"mode" : "text",
			
			"is_bambang" : true,
			"text" : "Yah, beb... jangan gitu\nPecel lele gimana, Beb? Aku sukanya pecel lele",
			"emotion": "sedih",
			"next_index" : "5"
		},
		"5":{
			"mode" : "text",
			
			"is_bambang" : false,
			"text" : "BEDA!! Pecel lele itu ikan, BANG!\nAku tahu kok kamu juga udah mulai malas bayar pajak. \nUdah! Kita putus..tus...tus...",
			"emotion": "marah",
			"next_index" : "6"
		},
		"6":{
			"mode" : "closing",
			"peristiwa_path" : ""
		}
	}
}
