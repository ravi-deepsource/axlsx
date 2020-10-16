#!/usr/bin/env ruby -w -s

$LOAD_PATH.unshift "#{File.dirname(__FILE__)}/../lib"

# ```ruby
require 'axlsx'
package = Axlsx::Package.new
package.workbook do |workbook|
  workbook.styles do |s|
    gridstyle_border = s.add_style border: { style: :thin, color: 'FFCDCDCD' }
    workbook.add_worksheet name: 'Custom Borders' do |sheet|
      sheet.sheet_view.show_grid_lines = false
      sheet.add_row %w[with grid style], style: gridstyle_border
      sheet.add_row %w[no border]
    end
  end
end
package.serialize 'no_grid_with_borders.xlsx'
