# Existem dois pontos nos comentários do código,
# 	onde não foi especificado o que fazer

class DogWalking < ApplicationRecord
	scope :future_walkings, -> () { where("scheduled_date >= ?", Date.today)}

	# Contantes utilizadas
	PERIOD_30_MINUTES = 30
	PERIOD_60_MINUTES = 60
	VALUE_LTE_30_MINUTES = 25
	VALUE_LTE_60_MINUTES = 35

	# Método que cria o tempo real da duração
	def calc_real_dutation( start_datetime, finish_datetime )
		# retorno em minutos completos
		return ((finish_datetime - start_datetime) / 60).to_i
	end

	# O método de cáculo está a seguir, porém não especifica
	# 	como ele deve ser invocado
	def calc_price_dog_walking!
		duration = calc_real_dutation(start_datetime, finish_datetime)

		if duration <= PERIOD_30_MINUTES
			additional_dog = 15
			period_value = VALUE_LTE_30_MINUTES
			period = PERIOD_30_MINUTES

		elsif duration <= PERIOD_60_MINUTES
			additional_dog = 20
			period_value = VALUE_LTE_60_MINUTES
			period = PERIOD_60_MINUTES
		end
		gros_value = calc_gross_value(period_value,additional_dog,qtde_dogs)
		proportional_value = calc_proportional_value(gros_value, period)

		return proportional_value
		# Não há especificação do que ser feito quando
		#   for um passeio maior que uma hora

	end

private
	# Método usado para calcular valor bruto
	def calc_gross_value(period_value, additional_dogs_value, qtde_dogs)
		return period_value + (additional_dogs_value * qtde_dogs)
	end

	# Método que retorna o valor proporcional
	def calc_proportional_value(value, period)
		return (value*period)/period
	end

end
