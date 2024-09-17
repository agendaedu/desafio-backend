require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'
Pagy::DEFAULT[:items]     = 15
Pagy::DEFAULT[:overflow] = :last_page
Pagy::I18n.load({ locale: 'pt-BR' })