desc 'Import the data'

task :segment_data => :environment do 

  # TODO: if density > then easy medium hard

  Subject.destroy_all

  p "Getting max and min"
  minimum_x = DataPoint.minimum(:start_point)
  maximum_x = DataPoint.maximum(:start_point)

  start_x = minimum_x
  end_x = 2_000_000

  while start_x < maximum_x do 
    p "Creating segment between #{start_x} and #{end_x}"
    @subject = Subject.new
    @subject.data_points = DataPoint.where(:start_point => start_x..end_x)
    @subject.save
    start_x = end_x
    end_x = start_x + 2_000_000
  end

end

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
    
    if array[4] && array[0] != 'Chromosome'
      DataPoint.create(chromosome: array[0], start_point: array[1], end_point: array[2], probe: array[3], y_point: array[4].strip.to_f)
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
      DataPoint.create(probe: array[0], chromosome: "chr" + array[1], start_point: array[2].to_i - 12, end_point: array[2].to_i + 12, y_point: array[3].strip.to_f)
      print "Importing #{count} from Metabric_SNP6 \r"
      count+=1
    end
  end
  file.close
  
  print "Finished import.."
end