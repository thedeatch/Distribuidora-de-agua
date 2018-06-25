class Driver < ApplicationRecord
    has_and_belongs_to_many :trucks

    VALID_NAME_REGEX = /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/
    validates :first_name, presence: {message: 'ingrese nombre'}, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
    validates :last_name, presence: {message: 'ingrese apellido'}, length: { in: 3..50 }, format: {with: VALID_NAME_REGEX}
    validate :fecha_nacimiento_futuro, :mayor_de_edad
    validates :income, presence: {message: 'ingrese sueldo'}, numericality: { only_integer: true }
    validates :license, inclusion: { in: [ true, false ] }
    validates :rut, rut: true, uniqueness: true, presence: true
    #validates_with RutValidator

    def fecha_nacimiento_futuro
        if birthday >= Date.today
            errors.add(:birthday, "Fecha de nacimiento incorrecta, el conductor no pudo haber nacido hoy o en el futuro")
        end
    end

    def age
      now = Time.now.utc.to_date
      now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
    end

    def mayor_de_edad
      if age < 18
        errors.add(:birthday, "Fecha de nacimiento incorrecta, el conductor no puede ser menor de edad")
      end
    end 

    def fullName 
    [first_name, last_name].compact.join(' ')
  end

end
    def function checkRut(rut) {
   // Despejar Puntos
   var valor = rut.value.replace('.','');
   // Despejar Guión
   valor = valor.replace('-','');

   // Aislar Cuerpo y Dígito Verificador
   cuerpo = valor.slice(0,-1);
   dv = valor.slice(-1).toUpperCase();

   // Formatear RUN
   rut.value = cuerpo + '-'+ dv

   // Si no cumple con el mínimo ej. (n.nnn.nnn)
   if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}

   // Calcular Dígito Verificador
   suma = 0;
   multiplo = 2;
   end
   // Para cada dígito del Cuerpo
   for(i=1;i<=cuerpo.length;i++) {

       // Obtener su Producto con el Múltiplo Correspondiente
       index = multiplo * valor.charAt(cuerpo.length - i);

       // Sumar al Contador General
       suma = suma + index;

       // Consolidar Múltiplo dentro del rango [2,7]
       if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }end

   }

   // Calcular Dígito Verificador en base al Módulo 11
   dvEsperado = 11 - (suma % 11);

   // Casos Especiales (0 y K)
   dv = (dv == 'K')?10:dv;
   dv = (dv == 0)?11:dv;

   // Validar que el Cuerpo coincide con su Dígito Verificador
   if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }

   // Si todo sale bien, eliminar errores (decretar que es válido)
   rut.setCustomValidity('');end
}
