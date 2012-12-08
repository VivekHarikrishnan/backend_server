pdf.font "Helvetica"
pdf.text "Name: "#{@user.title}. #{@user.name}", :size => 16, :style => :bold, :spacing => 4
pdf.text "Father Name: Mr. #{@user.father_name}", :spacing => 16
pdf.text "Profession: #{@professions[@user.profession_id.to_s]}"
pdf.text "Address: #{@user.address}"
pdf.text "Gender: #{@user.gender_to_s}"
pdf.text "#{ @user.summary }"