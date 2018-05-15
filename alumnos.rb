file = File.open('alumnos.csv', 'r')
alumnos = file.readlines
file.close
opcion = 0
puts "A continuación tendrás un menú con el nombre de los alumnos, asistencia y notas"
puts""
puts "1.-Opción, Se generará un archivo.txt con el nombre del alumno y su promedio de notas"
puts "2.-Opción, Se mostraran las inasistencias totales de cada alumno en la lista"
puts "3.-Opción, Se mostrarán los alumnos Aprobados"
puts "4.-Opción, Salir del programa"

while opcion != 4
  puts "Ingrese una opción"
  opcion = gets.chomp.to_i

  while (opcion < 1 || opcion > 4)
    puts "Debe ingresar una opción correcta"
    opcion = gets.chomp.to_i
  end

  case opcion
  when 1
    puts "1.-Genera archivo con el nombre del alumno y su promedio de notas"
    puts""
    file = File.open('alumnos.csv', 'r')
    alumnos = file.readlines
    file.close

    file = File.open('alumnos_promedio.txt', 'w')
    alumnos.each do |alumno|
      data = alumno.split(', ').map(&:chomp)
      puts data[0]
      file.print "El promedio de, #{data[0]}, "

      data.delete_at(0)
      print data
      puts " Generando promedio..."

      suma = 0
      data.each do |nota|
        suma += nota.to_f
      end
      file.puts suma/data.length
    end
    file.close

  when 2
    puts "2.-Inasistencias totales"
    puts""
    alumnos.each do |alumno|
      data = alumno.split(', ').map(&:chomp)
      # print data
      count = 0
      data.each do |nota|
        if nota == "A"
          count = count + 1
        end
      end
      print "#{data[0]} tiene"
      print " "
      puts  "#{count} Inasistencia"
    end

  when 3
    print "3.-Alumnos Aprobados"
    file = File.open('alumnos_promedio.txt', 'r')
    alumnos = file.readlines
    file.close
    alumnos.each do |alumno|
      data = alumno.split(', ').map(&:chomp)

      def aprobados(nota, nom)
        if nota >= 5
          print "#{nom} Felicidades has aprobado"
        end
      end
      puts aprobados(data[2].to_f, data[1])
    end

  when 4
    puts "El programa ha sido finalizado con exito, hasta pronto"
    exit
  end
end
