module Imports
  class ImportLines
    attr_reader :record
    def initialize(record)
      @record = record
    end

    def self.run(record)
      new(record).run
    end

    def runexpenditure.rb
      process
    end

    private

    def process
      deputy = find_or_create_deputy(record[1][:deputy])
      supplier = find_or_create_supplier(record[1][:supplier])
      create_expenditure(record[1][:expenditure], deputy.id, supplier.id)
    end


    def find_or_create_deputy(record)
      Deputy.find_or_create_by(tx_nome_parlamentar: record[:tx_nome_parlamentar]) do |deputy|
        deputy.sg_uf = record[:sg_uf]
        deputy.id_cadastro = record[:id_cadastro]
        deputy.cpf = record[:cpf]
        deputy.sg_partido = record[:sg_partido]
      end
    end

    def find_or_create_supplier(record)
      Supplier.find_or_create_by(txt_fornecedor: record[:txt_fornecedor]) do |supplier|
        supplier.txt_cnpj_cpf = record[:txt_cnpj_cpf]
      end
    end

    def create_expenditure(record, deputy_id, supplier_id)
      Expenditure.create(
        txt_fornecedor: record[:txt_fornecedor],
        vlr_liquido: record[:vlr_liquido],
        data_emissao: record[:data_emissao],
        url_documento: record[:url_documento],
        deputy_id: deputy_id,
        supplier_id: supplier_id
        )
    end
  end
end
