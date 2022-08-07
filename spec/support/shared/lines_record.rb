require "rails_helper"

RSpec.shared_examples "data_csv" do
   let(:line) {
    [ 0,
    {
      supplier: {
        txt_fornecedor: "CATIA DA SILVA FREIRES",
        txt_cnpj_cpf: "372.235.580/0014-6"
      },
      expenditure: {
        txt_fornecedor: "CATIA DA SILVA FREIRES",
        vlr_liquido: "120",
        data_emissao: "2021-05-07T00:00:00",
        url_documento: "https://www.camara.leg.br/cota-parlamentar/documentos/publ/1671/2021/7200506.pdf",
        descricao: "MANUTENÇÃO DE ESCRITÓRIO DE APOIO À ATIVIDADE PARLAMENTAR"
      },
      deputy: {
        tx_nome_parlamentar: "João Campos",
        sg_uf: "GO",
        id_cadastro: "74366",
        cpf: "24254401191",
        sg_partido: "REPUBLICANOS"
      }
    }
   ]
  }
end
