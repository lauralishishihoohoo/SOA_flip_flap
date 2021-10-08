# frozen_string_literal: false

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    list = []
    line = tsv.split("\n") # 先分割每個string
    header_word = line[0].strip.split("\t") # 再將每個string用tab分割(首先是第一行的標題)
    line[1..-1].each do |sep_str| # 分割每個string後 將每個string用tab分割(第一行之後)
      my_hash = {}
      each_word = sep_str.strip.split("\t")
      header_word.zip(each_word).each do |a1, a2|
        my_hash[a1] = a2
      end
      @data = list.append(my_hash)
    end
  end

  def to_tsv
    row = []
    list = []
    header_word = @data[0].keys.join("\t")
    @data.each do |a|
      row = "#{a['date']}\t#{a['student_id']}\t#{a['languages']}\t#{a['best_language']}\t#{a['app_experience']}\t#{a['tech_experience']}"
      list.append(row)
    end
    "#{header_word}\n#{list.join("\n")}\n"
  end
end
