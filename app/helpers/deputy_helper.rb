module DeputyHelper
  def ufgs
    %w[AC AL AP AM BA CE DF ES
       GO MA MT MS MG PA PB PR
       PE PI RN RS RO RR SC SP SE TO].each_with_index.to_a  
  end
end