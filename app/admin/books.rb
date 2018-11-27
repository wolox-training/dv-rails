ActiveAdmin.register Book do
  permit_params %i[genre author image title publisher year]
end
