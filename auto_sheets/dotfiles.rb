module Timetrap
  module AutoSheets
    class Dotfiles
      def sheet		
		currentPath = Dir.pwd
		lastPath = nil
		sheetData = nil
		until currentPath == lastPath
			dotfile = File.join(currentPath, '.timetrap-sheet') 
			sheetData = File.read(dotfile).chomp if File.exist?(dotfile)
			
			break if !sheetData.nil?
			
			lastPath = currentPath
			currentPath = File.expand_path('..', currentPath)
		end

		sheetData
      end
    end
  end
end
