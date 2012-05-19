desc 'Import the data'
task :import_data => :environment do
  
  count = 1
  
  # Import Dataset1DEMOdata2
  file = File.new(Rails.root.to_s + "/lib/data/Dataset1DEMOdata2.igv", "r")
  while (line = file.gets)
    array = line.split("\t")
  
    # create_table "data_sets", :force => true do |t|
    #   t.string   "chromosome"
    #   t.integer  "start_point", :limit => 8
    #   t.integer  "end_point",   :limit => 8
    #   t.integer  "y_point",     :decimal
    #   t.string   "probe"
    #   t.datetime "created_at",               :null => false
    #   t.datetime "updated_at",               :null => false
    # end
    
    # ["chr1", "192255266", "192255316", "CHR01FS192255266", "0.0395049658720801\n"]
    
    if array[4]
      DataSet.create(chromosome: array[0], start_point: array[1], end_point: array[2], probe: array[3], y_point: array[4].strip.to_f)
      print "Importing #{count} from Dataset1DEMOdata2 \r"
        count+=1
    end
  end
  file.close
  
  # Import Metabric_SNP6.cn
  file = File.new(Rails.root.to_s + "/lib/data/Metabric_SNP6.cn", "r")
  while (line = file.gets)
    array = line.split("\t")
    
    if array[3] && array[0] != 'Name'
      # p array[4].strip.to_f
      DataSet.create(probe: array[0], chromosome: "chr" + array[1], start_point: array[2].to_i - 12, end_point: array[2].to_i + 12, y_point: array[3].strip.to_f)
      print "Importing #{count} from Metabric_SNP6 \r"
      count+=1
    end
  end
  file.close
  
  print "Finished import.."
end