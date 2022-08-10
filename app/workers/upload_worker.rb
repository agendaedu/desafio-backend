class UploadWorker
  require 'csv'
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(id)
    @upload = Upload.find(id)
    @upload.csv_file.open do |file|
      CSV.foreach(file) do |row|

        next if row[0] == 'txNomeParlamentar'

        next if row[5] != 'CE'

        create_congressman(row[0..8]) unless Congressman.where(cpf: row[1]).exists?
        create_supplier(row[12..13]) unless Supplier.where(cpf_cnpj: row[13]).exists?
        response_expense_id = create_expense(row[8], row[9], row[10], row[11], row[13], row[1])
        response_invoice_id = create_invoice(row[14..27], response_expense_id)
        create_document(row[28..30], response_invoice_id)
      end
    end
  end

  def create_congressman(params)
    name, cpf, cod_register, cod_parliament, legislature, uf, party, cod_legislature = params
    Congressman.create!(name: name, cpf: cpf, cod_register: cod_register, 
                        cod_parliament: cod_parliament, legislature: 
                        legislature, uf: uf, party: party, cod_legislature: 
                        cod_legislature)
  end

  def create_supplier(params)
    name, cpf_cnpj = params
    Supplier.create!(name: name, cpf_cnpj: cpf_cnpj)
  end

  def create_expense(cod_sub_quota, description, num_specification_sub_quota, description_specification, cpf_cnpj, cpf)
    supplier = Supplier.find_by!(cpf_cnpj: cpf_cnpj)
    congressman = Congressman.find_by!(cpf: cpf)
    response_expense = Expense.create!(cod_sub_quota: cod_sub_quota,
                                       description: description,
                                       num_specification_sub_quota:
                                       num_specification_sub_quota,
                                       description_specification:
                                       description_specification,
                                       supplier_id: supplier.id,
                                       congressman_id: congressman.id)
    response_expense.id
  end

  def create_invoice(params, expense_id)
    num_invoice, document, issuance_date, brute_value, gloss_value, liquid_value,
    month, year, num_quota, passenger, num_lot, patch, refund, restitution = params

    response_invoice = Invoice.create!(num_invoice: num_invoice, document:
                                       document, issuance_date: issuance_date,
                                       brute_value: brute_value, gloss_value:
                                       gloss_value, liquid_value: liquid_value,
                                       month: month, year: year, num_quota:
                                       num_quota, passenger: passenger,
                                       num_lot: num_lot, patch: patch,
                                       refund: refund, restitution: restitution,
                                       expense_id: expense_id)
    response_invoice.id
  end

  def create_document(params, response_invoice_id)
    congressman_id, cod_document, url_document = params

    Document.create!(congressman_id: congressman_id, cod_document:
                     cod_document, url_document: url_document,
                     invoice_id: response_invoice_id)
  end

end