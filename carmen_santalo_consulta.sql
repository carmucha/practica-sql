select m.name , b.name , g.name , c.dt_compra, c.matricula, c.color, c.km, i.name, p.num_poliza 
from  practicacsn.coche c, practicacsn.empresa_seguro i, practicacsn.grupo g, practicacsn.marca b, practicacsn.modelo_coche m, practicacsn.poliza p
where  c.id_modelo  = m.id_modelo and m.id_marca = b.id_marca and b.id_grupo = g.id_grupo and c.id_poliza = p.id_poliza and p.id_empresa_seguro = i.id_empresa_seguro 

