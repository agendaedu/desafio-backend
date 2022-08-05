module Process
  class Creator < ::Base
    attr_accessor :file
    def initialize(file)
      @file = file
    end

    def self.run(file)
      new(file).run
    end

    def run
      process
    end

    private

    def process
      records = read_file(file)
      records.each do |record|
        deputy = find_or_create_deputy(record[1][:deputy])
        supplier = find_or_create_supplier(record[1][:supplier])
        create_expenditure(record[1][:expenditure], deputy, supplier)
      end
      file.processed!
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

    def create_expenditure(record, deputy, supplier)
      Expenditure.create(
        txt_fornecedor: record[:txt_fornecedor],
        vlr_liquido: record[:vlr_liquido],
        data_emissao: record[:data_emissao],
        url_documento: record[:url_documento],
        deputy_id: deputy.id,
        supplier_id: supplier.id
        )
    end
  end
end