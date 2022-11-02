-- #############################################################################
-- 1 reporte del monto de descuentos otorgados por vendedores
select 
  e.NOMBRE||' '||e.APPATERNO vendedor
  , to_char(
      sum(nvl(dv.PRECIO_UNITARIO * dv.CANTIDAD * dv.DESCUENTO, 0))
      , '$999G999G999G999'
    ) as monto_descto
from DETALLE_VENTAS dv
join ventas v
  using(venta_id)
right join EMPLEADOS e
  on e.EMPLEADO_ID = v.VENDEDOR_ID
join CARGOS c
  using(cargo_id)
where
  c.NOMBRE = 'vendedor'
group by
  e.nombre
  , e.appaterno
order by
  sum(nvl(dv.PRECIO_UNITARIO * dv.CANTIDAD * dv.DESCUENTO, 0)) desc
;

-- #############################################################################

-- 2 productos que se han vendido menos de 3 unidades. Ordenados por cantidad
-- y producto id
select
  PRODUCTO_ID
  , p.NOMBRE producto
  , sum(dv.CANTIDAD) cant_ventas
from DETALLE_VENTAS dv
right join productos p
  using(producto_id)
group by
  PRODUCTO_ID
  , p.NOMBRE
having
  sum(dv.CANTIDAD) < 3
order by
  sum(dv.CANTIDAD)
  , PRODUCTO_ID
;

-- #############################################################################

-- 3 cargos que faltan por llenar en la empresa
select
  CARGO_ID
  , c.NOMBRE
  , 'SIN LLENAR' ESTADO
from cargos c
left join EMPLEADOS e
  using(cargo_id)
where
  empleado_id is null
order by
    c.nombre
;

-- #############################################################################

-- 4 reporte de ventas x cliente meses marzo y abril del 2016
select
  c.NOMBRE||' '||c.APPATERNO cliente  
  , to_char(sum(
    CASE WHEN extract(month from v.fecha) = 3 THEN
      dv.PRECIO_UNITARIO * dv.CANTIDAD * (1-dv.DESCUENTO)
    ELSE
      0
    END
  ), '$999G999G999') AS Marzo
  , to_char(sum(
    CASE WHEN extract(month from v.fecha) = 4 THEN
      dv.PRECIO_UNITARIO * dv.CANTIDAD * (1-dv.DESCUENTO)
    ELSE
      0
    END
  ), '$999G999G999') AS Abril
from CLIENTES c
left join VENTAS v
  using(cliente_id)
left join DETALLE_VENTAS dv
  using(venta_id)
where
  extract(year from v.fecha) = 2016
group by
  c.NOMBRE
  , c.APPATERNO
order by
  c.APPATERNO
;

-- #############################################################################

-- 5 reporte con vendedores que llevan contratados + de 60 días y no tienen 
-- ventas
select
  e.EMPLEADO_ID
  , e.NOMBRE||' '||e.APPATERNO nombre_completo
  , c.NOMBRE cargo  
  , count(v.VENTA_ID) cant_ventas
  , e.FECHA_CONTRATO
from EMPLEADOS e
join CARGOS c
  using(cargo_id)
left join VENTAS v
  on v.VENDEDOR_ID = e.EMPLEADO_ID
where
  c.NOMBRE = 'vendedor'
  and to_date('18-04-2016', 'dd-mm-yyyy') - e.FECHA_CONTRATO >= 60
group by
  e.EMPLEADO_ID
  , e.NOMBRE
  , e.APPATERNO
  , c.NOMBRE
  , e.FECHA_CONTRATO
having
  count(v.VENTA_ID) = 0
;

-- #############################################################################

--6 reporte total de ventas por número de documento y cálculo comisión 2% al vendedor
select
  v.NUMERO_DOCUMENTO
  , v.TIPO_DOCUMENTO
  , c.NOMBRE||' '||c.APPATERNO cliente
  , to_char(sum(dv.PRECIO_UNITARIO * dv.CANTIDAD * (1-dv.DESCUENTO)), '$999G999G999') monto
  , e.NOMBRE||' '||e.APPATERNO vendedor
  , to_char(
      round(sum(dv.PRECIO_UNITARIO * dv.CANTIDAD * (1-dv.DESCUENTO)) * 0.02)
    , '$999G999') as comision
from DETALLE_VENTAS dv
join VENTAS v
  using(venta_id)
join CLIENTES c
  using(cliente_id)
join EMPLEADOS e
  on e.EMPLEADO_ID = v.VENDEDOR_ID
group by
  c.NOMBRE
  , c.APPATERNO
  , e.NOMBRE
  , e.APPATERNO
  , v.NUMERO_DOCUMENTO
  , v.TIPO_DOCUMENTO
order 
  by v.NUMERO_DOCUMENTO desc
;

-- #############################################################################

--7 reporte de todos los clientes que NO compraron en marzo 2016
select
  *
from clientes c
where
  c.cliente_id not in (
                select
                  distinct cliente_id
                from clientes c
                left outer join ventas v
                  using(cliente_id)
                where
                  extract(month from v.fecha) = 3
                  and extract(year from v.FECHA) = 2016
                )
;

-- #############################################################################

--8 detalle de ventas de marzo
select
  v.NUMERO_DOCUMENTO num_doc
  , to_char(v.FECHA, 'dd-Mon-YYYY') fecha
  , v.TIPO_DOCUMENTO tipo_doc
  , c.NOMBRE||' '||c.APPATERNO cliente
  , e.NOMBRE||' '||e.APPATERNO vendedor
  , to_char(dv.PRECIO_UNITARIO * dv.CANTIDAD * (1-dv.DESCUENTO)
      , '$999G999G999'
      )
      as monto
  , to_char(p.PRECIO, '999G999G999') precio_unitario
  , dv.CANTIDAD  
  , dv.DESCUENTO * 100||'%' descto
  , p.NOMBRE producto
from DETALLE_VENTAS dv
join productos p
  using(producto_id)
join VENTAS v
  using(venta_id)
join EMPLEADOS e
  on v.vendedor_id = e.empleado_id
join clientes c 
  using(cliente_id)
where
  extract(month from v.fecha) = 3
  and extract(year from v.fecha) = 2016
order by
  v.NUMERO_DOCUMENTO
;

-- #############################################################################

--9 vista con el cálculo de la edad de los clientes. Los clientes que no tengan
-- su fecha de nacimiento o estado civil, deben aparecer primero y en su
-- reemplazo debe aparecer SIN DATOS. Si su género es M poner Masculino y si es
-- F poner Femenino.

--create or replace view v_clientes as
select
  cliente_id
  , c.NOMBRE||' '||c.APPATERNO||' '||c.APMATERNO nombre_completo
  , CASE WHEN c.sexo = 'M' THEN 'Masculino' ELSE 'Femenino' END "Genero"
  , nvl(to_char(trunc(MONTHS_BETWEEN
           (TO_DATE('18-04-2016','DD-MM-YYYY'),
            c.FECHA_NACIMIENTO)/12)), 'SIN DATOS') "edad"
  , nvl(c.estado_civil, 'SIN DATOS') estado_civil
from CLIENTES c  
order by
  c.FECHA_NACIMIENTO desc
  , c.estado_civil desc
;

-- #############################################################################

--10 empleados con calculo de años y join a cargos
--create or replace view v_empleados as
  select 
    EMPLEADO_ID
    , e.NOMBRE||' '||e.APPATERNO||' '||e.APMATERNO "nombre_completo"
    , c.NOMBRE
    , to_char(
        e.SUELDO_BASE
        , '$999G999'
        , 'NLS_NUMERIC_CHARACTERS = '',.'' 
            NLS_CURRENCY = ''UsDollars'' '
      ) as "sueldo_base"
    , to_char(e.FECHA_CONTRATO, 'dd" de "Month" del "YYYY') fecha_contrato
    , trunc(MONTHS_BETWEEN
           (TO_DATE('18-04-2016','DD-MM-YYYY'),
            e.FECHA_CONTRATO)/12) "annos_contratado"
  from EMPLEADOS e
  join CARGOS c
    using(cargo_id)
  order by
    e.SUELDO_BASE desc
    , trunc(MONTHS_BETWEEN
           (TO_DATE('18-04-2016','DD-MM-YYYY'),
            e.FECHA_CONTRATO)/12)
;

-- #############################################################################
