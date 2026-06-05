-- 1

SELECT u.Nombre, u.Apellidos, v.Marca, v.Modelo, v.Matricula
FROM USUARIO u
JOIN VEHICULO v
ON u.Cod_vehiculo = v.Cod_vehiculo;

-- 2

SELECT u.Nombre, v.Marca, v.Modelo, a.Kilometros
FROM ALQUILA a
JOIN USUARIO u
ON a.Cod_usuario = u.Cod_usuario
JOIN VEHICULO v
ON a.Cod_vehiculo = v.Cod_vehiculo;

-- 3 

SELECT u.Nombre, u.Apellidos, r.Tipo
FROM USUARIO u
JOIN ROL r
ON u.Cod_rol = r.Cod_rol;