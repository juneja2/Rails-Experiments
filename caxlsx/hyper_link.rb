require 'caxlsx'

Axlsx::Package.new do |p|
  p.workbook do |wb|
    wb.add_worksheet name: "Hyperlink Test" do |sheet|
      sheet.add_row ["FB", "Github"]
      sheet.add_hyperlink location: "https://www.fb.com", ref: sheet.rows.first.cells.first
      sheet.add_hyperlink location: "https://www.github.com", ref: sheet.rows.first.cells[1]
    end
    p.use_shared_strings = true
    p.serialize 'hyperlink.xlsx'
  end
end
