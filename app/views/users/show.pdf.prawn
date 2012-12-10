pdf.font "Helvetica"
pdf.text "#{@user.updated_at.to_time.strftime('%d %b %Y %I:%M:%S %p')}"
pdf.table [["Name", "#{@user.title}. #{@user.name}"], ["Father Name", "Mr. #{@user.father_name}"], ["Profession", "#{@professions[@user.profession_id.to_s]}"], ["Address", "#{@user.address}"], ["Gender", "#{@user.gender_to_s}"]]
pdf.text "------------------------------------------------------------------------------"
pdf.text "#{ @user.summary }"