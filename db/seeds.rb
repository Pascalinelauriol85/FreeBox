# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..25).each do  |i|
  city = City.create(name:Faker::Address.city)
  puts "#{i} citys created"
end

(1..25).each do  |i|
  speciality = Speciality.create(
      name:["Allergy","immunology","Anesthesiology","Dermatology","Diagnostic radiology","Emergency medicine","Family medicine","Internal medicine","Medical genetics","Neurology","Nuclear medicine","Obstetrics and gynecology","Ophthalmology","Pathology","Pediatrics","Physical medicine and rehabilitation","Psychiatry","Surgery","Urology"].sample,
      doctor_id:nil
  )
  puts "#{i} specialities created"
end

(1..25).each do  |i|
  speciality_id = Speciality.all.sample.id
  doctor = Doctor.create(
      first_name:Faker::Name.first_name,
      last_name:Faker::Name.last_name,   
      specialties_id:specility_id,
      zip_code:Faker::Address.zip_code,
      city_id:City.all.sample.id
  )
  Speciality.find(speciality_id).doctor_id = doctor.id
  puts "#{i} doctors created and link to speciality"
end

(1..50).each do  |i|
  patient = Patient.new(
      first_name:Faker::Name.first_name,
      last_name:Faker::Name.last_name,
  )
  puts "#{i} patients created"
end

(1..75).each do  |i|
  appointments = Appointment.create(
      doctor_id:Doctor.all.sample.id, 
      patient_id:Patient.all.sample.id,
      date:Faker::Date.between(from: 300.days.ago, to: Date.today)
  )
  puts "#{i} appointments created"
end
