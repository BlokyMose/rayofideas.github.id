extends Panel

signal signal_paid_pajak(paid_pajak)
signal signal_laporan_tax(paid_tax, penalty)

var monthly_rate_fee = 0.1
var monthly_base_fee = 1

var monthly_taxes = [0,0,0, 0,0,0, 0,0,0, 0,0,0]
var current_month_income = 0
var current_month_tax
var unpaid_month = 1
var penalty = 0

var paid_tax = 0

func _ready():
	$ButtonBayar.disabled = true
	$ButtonBayar.text = "0"
	$ButtonBayar/Panah.visible = false

func add_current_month_income(add_income):
	current_month_income += add_income
	current_month_tax = ceil(current_month_income * monthly_rate_fee) + monthly_base_fee 
	if unpaid_month == Global.bulan:
		$ButtonBayar.text = String(current_month_tax)

func set_current_month_tax(current_month):
	$ButtonBayar.disabled = false
	current_month_tax = floor(current_month_income * monthly_rate_fee) + monthly_base_fee 
	if unpaid_month == Global.bulan:
		$ButtonBayar.text = String(current_month_tax)
		$ButtonBayar/Panah.visible = true
	else:
		if Global.bulan - unpaid_month > 3 :
			penalty += 1
	monthly_taxes[current_month-1] = current_month_tax
	current_month_tax = 0
	current_month_income = 0

func paid():
	if unpaid_month > 12: return
	
	emit_signal("signal_paid_pajak", monthly_taxes[unpaid_month-1])
	paid_tax += monthly_taxes[unpaid_month-1]
	monthly_taxes[unpaid_month-1] = 0
	$ButtonBayar.text = "0"
	unpaid_month += 1
	set_pajak_bulan_text(unpaid_month)
	if unpaid_month <= 12:
		if monthly_taxes[unpaid_month-1] == 0:
			$ButtonBayar.disabled = true # it's not yet next month
			$ButtonBayar.text = String(current_month_tax)
			$ButtonBayar/Panah.visible = false
		else:
			$ButtonBayar.text = String(monthly_taxes[unpaid_month-1])
			$ButtonBayar/Panah.visible = true
	else:
			$ButtonBayar.disabled = true # it's end year
			$LabelPajakBulan.text = "Lunas"
			$ButtonBayar/Panah.visible = false

func set_pajak_bulan_text(bulan:int):
	if bulan == 1:
		$LabelPajakBulan.text = "Pajak Januari"
	elif bulan == 2:
		$LabelPajakBulan.text = "Pajak Februari"
	elif bulan == 3:
		$LabelPajakBulan.text = "Pajak Maret"
	elif bulan == 4:
		$LabelPajakBulan.text = "Pajak April"
	elif bulan == 5:
		$LabelPajakBulan.text = "Pajak Mei"
	elif bulan == 6:
		$LabelPajakBulan.text = "Pajak Juni"
	elif bulan == 7:
		$LabelPajakBulan.text = "Pajak Juli"
	elif bulan == 8:
		$LabelPajakBulan.text = "Pajak Agustus"
	elif bulan == 9:
		$LabelPajakBulan.text = "Pajak September"
	elif bulan == 10:
		$LabelPajakBulan.text = "Pajak Oktober"
	elif bulan == 11:
		$LabelPajakBulan.text = "Pajak November"
	elif bulan == 12:
		$LabelPajakBulan.text = "Pajak Desember"
		
func reset():
	monthly_taxes = [0,0,0, 0,0,0, 0,0,0, 0,0,0]
	unpaid_month = 1
	penalty = 0
	paid_tax = 0
	set_pajak_bulan_text(unpaid_month)

func _on_ButtonBayar_pressed():
	$ButtonBayar/AudioPlayer.play()
	paid()
	$ButtonBayar.release_focus()

func _on_Linimasa_signal_end_month(current_month):
	set_current_month_tax(current_month)

func _on_Levels_signal_harta_added(added_harta):
	if added_harta > 0:
		add_current_month_income(added_harta)

func _on_Linimasa_signal_start_year(current_year, current_age):
	reset()

func _on_Linimasa_signal_show_laporan():
	for unpaid in monthly_taxes:
		penalty += unpaid
	penalty = floor(penalty+penalty*0.1)
	emit_signal("signal_laporan_tax", paid_tax, penalty)

func _on_LaporanTahunan_signal_laporan_ok(penalty):
	reset()
	$ButtonBayar.disabled = true
	$ButtonBayar/Panah.visible = false
