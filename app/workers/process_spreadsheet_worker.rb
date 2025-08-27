require 'open-uri'
require 'csv'

class ProcessSpreadsheetWorker
  include Sidekiq::Worker

  def perform(file_params)
    deputies = []

    CSV.foreach(file_params, headers: true, header_converters: :symbol, col_sep: ";",  liberal_parsing: true) do |row|
      if row[:cpf] != "" && row[:sguf] == "AL"
        deputy = Deputy.new(name: row[:txnomeparlamentar],
                              cpf: row[:cpf],
                              unique_identifier: row[:idecadastro],
                              portfolio_number: row[:nucarteiraparlamentar],
                              legislature_number: row[:nulegislatura],
                              uf_acronym: row[:sguf],
                              party_acronym: row[:sgpartido],
                              legislature_code: row[:codlegislatura],
                              sub_quota_number: row[:numsubcota],
                              sub_quota_description: row[:txtdescricao],
                              subquota_specification_number: row[:numespecificacaosubcota],
                              subquota_specification_description: row[:txtdescricaoespecificacao])

        deputy.fiscal_documents.build(supplier: row[:txtfornecedor],
                                                cnpj: row[:txtcnpjcpf],
                                                document_number: row[:txtnumero],
                                                document_type: row[:indtipodocumento],
                                                issue_date: row[:datemissao],
                                                gloss_value: row[:vlrglosa],
                                                net_value: row[:vlrliquido],
                                                month: row[:numes],
                                                year: row[:numano],
                                                installment_number: row[:numparcela],
                                                passenger: row[:txtpassageiro],
                                                segment: row[:txttrecho],
                                                lot_number: row[:numlote], 
                                                reinbursement_number: row[:numressarcimento],
                                                refund_amount: row[:vlrrestituicao],
                                                document_url: row[:urldocumento],
                                                deputy_id: deputy.id)
        deputies << deputy
      end
    end

    deputies.uniq!{|d| [d.name, d.cpf]}
    Deputy.import deputies
  end
end