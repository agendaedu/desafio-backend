class ProcessSpreadsheetWorker
  include Sidekiq::Worker
  require 'open-uri'
  require 'csv'


  def perform(file_params)
    file = open(file_params)

    CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
    puts "reading file's data"
    p row
    puts "importing data for database"
    deputy = Deputy.create(name: row[:txnomeparlamentar],
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

    fiscal_document = FiscalDocument.create(supplier: row[:txtfornecedor],
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
                                            deputy_id: deputy.id)
      puts "done!"
    end
  end
end