package DB;

import Entities.Article;
import Entities.Descuento;
import java.util.ArrayList;

public class ArticleDB {
    private static final ArrayList<Article> articles = new ArrayList();
    private static boolean preparado = false;
    private static Descuento discount;
    
    public static ArrayList getArticles() {
        if(preparado) return articles;
        articles.add(new Article("Don Simon Naranja", "images/articulos/zumos/don-simon-naranja-escalar.jpg", "1.43", "bebidas", "zumos", "", "El nectar de naranja Don Simon es el unico en el mercado elaborado con zumo exprimido, diferenciandose de otros nectares de la competencia hechos con zumo de naranja a base de concentrado."));
        articles.add(new Article("Juver Melocoton", "images/articulos/zumos/juver-melocoton-escalar.jpg", "1.34", "bebidas", "zumos", "", "Juver Disfruta es la mejor opcion para controlar los azucares y calorias de tu dieta de una forma sana y deliciosa."));
        articles.add(new Article("Juver Pina", "images/articulos/zumos/juver-pina-escalar.jpg", "1.44", "bebidas", "zumos", "", "Todo el sabor de la fruta sin azúcares añadidos y pocas calorías. Juver Disfruta es la mejor opción para controlar los azúcares y calorías de tu dieta de una forma sana y deliciosa."));
        articles.add(new Article("Libby's Naranja", "images/articulos/zumos/libby's-naranja-1L-escalar.jpg", "1.60", "bebidas", "zumos", "", "Zumo de naranja a partir de zumo de naranja concentrado, pulpa de naranja."));
        articles.add(new Article("Colimoro Montepulciano", "images/articulos/vinos/Colimoro-Montepulciano-escalar.jpg", "2.60", "bebidas", "vinos", "", "Vino tinto producido en los viñedos que rodean la ciudad de Montepulciano, Italia. El vino se hace principalmente con uvas de la variedad Sangiovese (conocida localmente como Prugnolo) (mínimo de 70%), mezclado con Canaiolo Nero (10%-20%) y pequeñas cantidades de otras variedades locales como la Mammolo."));
        articles.add(new Article("Romaneira", "images/articulos/vinos/Romaneira-escalar.jpg", "3.60", "bebidas", "vinos", "", "Con su aroma floral delicado y su finura característica y la pureza de la fruta, la Romaneira Touriga Nacional es a la vez una auténtica expresión del terroir único de la Quinta y del carácter distintivo de esta variedad de uva notable. nariz floral delicado con notas de rosas silvestres y violetas. Elegante, fresco, armonioso, con taninos sedosos en el paladar y un acabado fino largo."));
        articles.add(new Article("Fernando Castilla", "images/articulos/vinos/Fernando-castilla-escalar.jpg", "2.89", "bebidas", "vinos", "", "Elaborado con uvas pasificadas de la variedad que le da nombre, Pedro Ximenez es un vino increíblemente dulce que, tras tres décadas de crianza en barrica, ha desarrollado unos aromas y sabores únicos, y un color caoba intenso, muy oscuro, apreciable desde su exterior como todos los vinos de la selecta gama Antique."));
        articles.add(new Article("Joel Gott", "images/articulos/vinos/Joel-Gott-escalar.jpg", "3.10", "bebidas", "vinos", "", "Desde nuestro comienzo en 1996, hemos seleccionado la mejor fruta de las regiones de cultivo en California, Oregon y Washington, que combinamos para crear vinos más equilibrados, limpios, complejos y elegantes. Estamos orientados a continuar ofreciendo a nuestros clientes vinos expresivos y amigables con los alimentos a excelentes precios. ¡Esperamos que lo disfrute y nos deje saber lo que piensa!"));
        articles.add(new Article("Pago de los Capellanes", "images/articulos/vinos/Pago-de-los-Capellanes-escalar.jpg", "2.90", "bebidas", "vinos", "", "Llega la nueva añada de un habitual en nuestros rankings de vinos Más Vendidos y Mejor Valorados. Hablamos del Joven Roble de Pago de los Capellanes, el vino con mejor relación calidad/precio de la bodega. En esta nueva añada 2016 vuelve a hacer gala de su alegre carácter frutal, convirtiéndose en un tinto muy apto para la temporada estival. Su acidez refrescante y su sutil tanicidad terminan por modelarlo como el acompañante perfecto para una elegante noche de verano."));
        articles.add(new Article("Pepsi 2L", "images/articulos/refrescos/sabores/Pepsi-2L-escalar.png", "1.90", "bebidas", "refrescos", "sabores", "El refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo."));
        articles.add(new Article("Coca cola", "images/articulos/refrescos/sabores/coca-cola-lata-escalar.jpg", "1.20", "bebidas", "refrescos", "sabores", "Corría el año 1886. Lugar: Atlanta (Georgia). Un farmacéutico llamado John Pemberton se propuso crear una bebida que fuera a la vez refrescante y vigorizante. Buscó la mezcla perfecta de ingredientes frescos de todo el mundo hasta que la encontró.\n"+"La mezcla exacta de los ingredientes y los extractos vegetales provenientes de todo el mundo que, hasta hoy, siguen formando parte de la fórmula secreta más famosa del mundo."));
        articles.add(new Article("Fanta", "images/articulos/refrescos/sabores/fanta-lata-escalar.jpg", "1.15", "bebidas", "refrescos", "sabores", "Bebida refrescante de zumo de frutas. Con azúcares y edulcorantes.\n"+"Fanta es la bebida refrescante con zumo de frutas preferida por los jóvenes de nuestro país. Joven, alegre, extrovertida y siempre asociada a un sentimiento universal: la diversión con amigos"));
        articles.add(new Article("Pepsi Lata", "images/articulos/refrescos/sabores/pepsi-lata-escalar.jpg", "1.35", "bebidas", "refrescos", "sabores", "El refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo."));
        articles.add(new Article("Sprite 1.5L", "images/articulos/refrescos/sabores/sprite-1.5L-escalar.jpg", "1.75", "bebidas", "refrescos", "sabores", "Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente."));
        articles.add(new Article("Sprite Lata", "images/articulos/refrescos/sabores/sprite-lata-escalar.jpg", "1.20", "bebidas", "refrescos", "sabores", "Bebida refrescante de extractos. Con azúcares y edulcorantes. Ideal para esos momentos en los que te apetece una bebida con un sabor diferente."));
        articles.add(new Article("Coca Cola Light", "images/articulos/refrescos/light/coca-cola-light-escalar.jpg", "1.20", "bebidas", "refrescos", "light", "Agua carbonatada, colorante E-150d, edulcorantes E-952, E-950 y aspartamo, acidulantes E-338 y E-330 y aromas naturales (incluyendo cafeína). Contiene una fuente de fenilalanina."));
        articles.add(new Article("Fanta Light", "images/articulos/refrescos/light/fanta-light-escalar.jpg", "1.15", "bebidas", "refrescos", "light", "Bebida refrescante de zumo de frutas. Sin azúcares añadidos. Con edulcorantes.\n"+"Fanta es la bebida refrescante con zumo de frutas preferida por los jóvenes de nuestro país. Joven, alegre, extrovertida y siempre asociada a un sentimiento universal: la diversión con amigos."));
        articles.add(new Article("Pepsi Light", "images/articulos/refrescos/light/pepsi-Light-escalar.jpg", "1.35", "bebidas", "refrescos", "light", "Sin azúcar. Bebida refrescante aromatizada con edulcorantes. Todo el sabor de la Pepsi, el refresco carbonatado seña de identidad de PepsiCo. Desde sus humildes comienzos hace unos 100 años, Pepsi-Cola ha crecido hasta ser uno de los productos más conocidos y amados alrededor del mundo."));
        articles.add(new Article("Sprite Light", "images/articulos/refrescos/light/sprite-light-escalar.jpg", "1.20", "bebidas", "refrescos", "light", "Refresco Light sin azúcar añadido. Bebida refrescante de extractos con edulcorantes. Sprite Zero es una bebida refrescante de sabor lima-limón, transparente y con gas, con el auténtico sabor de Sprite y cero calorías."));
        articles.add(new Article("Bezolla 1.5L", "images/articulos/agua/bezolla-1.5L-escalar.jpg", "0.95", "bebidas", "agua", "", "De mineralización muy débil. Tiene un residuo seco muy bajo, que le hace diferente de la gran mayoría de las aguas. Uno de sus principales valores es que está indicada para dietas pobres en sodio y para la preparación de alimentos infantiles.\n"+"El Agua Bezoya procede de la Sierra de Guadarrama, ubicada en plena Naturaleza y en la provincia de Segovia."));
        articles.add(new Article("Firgas 1.5L", "images/articulos/agua/firgas-1.5L-escalar.jpg", "1.05", "bebidas", "agua", "", "Agua mineral natural con gas extra botella 1,5 L."));
        articles.add(new Article("Font Vella 1.5L", "images/articulos/agua/font-vella-1.5L-escalar.jpg", "1.15", "bebidas", "agua", "", "Font Vella es un agua equilibrada, de mineralización débil y 0% impurezas. Baja en sodio.\n"+"Durante más de 15 años Font Vella recorre intacta un largo camino subterráneo, protegida por la naturaleza a más de 150 metros de profundidad, en el Parque Natural del Montseny y en el del Barranco del Río Dulce, dos parajes naturales."));
        articles.add(new Article("Teror Sin Gas", "images/articulos/agua/teror-sin-gas-1.5L-escalar.jpg", "1.10", "bebidas", "agua", "", "Agua mineral natural sin gas botella 1,5 L."));
        articles.add(new Article("Ariel", "images/articulos/drogueria/ariel-escalar.jpg", "3.45", "drogueria", "", "", "Detergente líquido para lavadora regular ARIEL 70 ds."));
        articles.add(new Article("Colon", "images/articulos/drogueria/colon-escalar.jpg", "4.10", "drogueria", "", "", "Detergente azul en polvo COLON 30 + 9ds."));
        articles.add(new Article("Mimosin Vaporesse", "images/articulos/drogueria/mimosin-vaporesse-escalar.jpg", "3.10", "drogueria", "", "", "Agua de planchar perfumada MIMOSIN Vaporesse 1 L."));
        articles.add(new Article("Norit", "images/articulos/drogueria/norit-escalar.jpg", "3.60", "drogueria", "", "", "Detergente delicado lavado a mano NORIT 45 lavados. 1125 ml."));
        articles.add(new Article("Vanish", "images/articulos/drogueria/vanish-escalar.jpg", "4.20", "drogueria", "", "", "Activador de lavado en polvo para lavar la ropa de color con oxígeno VANISH 2 L."));
        articles.add(new Article("Airport Mochila Azul", "images/articulos/papeleria/airport-mochila-azul-escalar.jpg", "10.95", "papeleria", "", "", "Para los que les gusta ir con colores llamativos, esta mochila turquesa les proporciona no solo diseño sino confort al usar."));
        articles.add(new Article("Airport Mochila Vintage", "images/articulos/papeleria/airport-mochila-vintage-escalar.jpg", "15.95", "papeleria", "", "", "Mochila Vintage Puma con compartimentos y espaldar acolchado para mayor comodidad al transportar, AIRPORT."));
        articles.add(new Article("Bic Cristal Soft Azul", "images/articulos/papeleria/bic-cristal-soft-azul-escalar.jpg", "9.10", "papeleria", "", "", "Duran hasta 2 veces más que un bolígrafo común."));
        articles.add(new Article("Oxford Cuaderno", "images/articulos/papeleria/oxford-cuaderno-escalar.jpg", "3.30", "papeleria", "", "", "Cuaderno de tamaño A5, con cuadrícula de 4x4 mm, 80 hojas y tapas encuadernadas OXFORD."));
        articles.add(new Article("Pacsa Cuaderno 3x3", "images/articulos/papeleria/pacsa-cuaderno-3x3-escalar.jpg", "1.50", "papeleria", "", "", "Cuaderno de cuadrícula de 3x3 con margen, 80 hojas y tapa dura, PACSA."));
        articles.add(new Article("Pacsa Cuaderno 4x4", "images/articulos/papeleria/pacsa-cuaderno-4x4-escalar.jpg", "3.10", "papeleria", "", "", "Dispone de tapas de polipropileno de alta resistencia y microperforado con encuadernación con espiral metálica. Las hojas de este cuaderno son de papel extrablanco."));
        articles.add(new Article("Estuche Patrulla Canina", "images/articulos/papeleria/patrulla-canina-estuche-escalar.jpg", "5.10", "papeleria", "", "", "El estuche incluye: 1 portaminas, 1 bolígrafo, 4 reglas, 1 sacapuntas, 1 libro para colorear y 18 rotuladores.\n"+"Producto no recomendado para menores de 3 años."));
        articles.add(new Article("Pilot Super Grip Azul", "images/articulos/papeleria/pilot-super-grip-azul-escalar.jpg", "3.10", "papeleria", "", "", "Tinta con base de aceite color azul. Estos bolígrafos al tener tinta con base de aceite, hace que escribir cueste muy poco esfuerzo, ya que se convierte en una acción muy fluida."));
        articles.add(new Article("UniBall Eye Ub-150", "images/articulos/papeleria/uni-ball-eye-ub-150-escalar.jpg", "2.95", "papeleria", "", "", "La tinta pigmentada de estos bolígrafos es resistente al agua y a la luz, lo que los confiere una escritura suave y constante."));
        articles.add(new Article("Ecolecera Espaguettis", "images/articulos/pastas/ecolecera-espaguettis-escalar.jpg", "1.75", "alimentacion", "pastas", "", "Espaguetis ecológicos, pasta compuesta integral de calidad superior ECOLECERA 500 gr."));
        articles.add(new Article("Gallo Espaguettis", "images/articulos/pastas/gallo-espaguettis-escalar.jpg", "2.95", "alimentacion", "pastas", "", "Espagueti Nº 3 GALLO paquete de 500 grs."));
        articles.add(new Article("Gallo Fideos", "images/articulos/pastas/gallo-fideos-escalar.jpg", "3.65", "alimentacion", "pastas", "", "Estrellas GALLO paquete de 500 gr."));
        articles.add(new Article("Gallo Macarrones", "images/articulos/pastas/gallo-macarrones-escalar.jpg", "4.95", "alimentacion", "pastas", "", "Macarrón rayado GALLO paquete de 500 gr."));
        articles.add(new Article("Gallo Sedalis Espaguettis", "images/articulos/pastas/gallo-sedalis-espaguettis-escalar.jpg", "3.95", "alimentacion", "pastas", "", "Espagueti Nº 3 GALLO SEDALIS paquete de 500 grs."));
        articles.add(new Article("Gallo Sin Gluten Macarrones", "images/articulos/pastas/gallo-sin-gluten-macarrones-escalar.jpg", "4.95", "alimentacion", "pastas", "", "Gallo sin gluten GALLO, 500 gr,."));
        articles.add(new Article("Romero Fideos", "images/articulos/pastas/romero-fideos-escalar.jpg", "3.65", "alimentacion", "pastas", "", "Fideo cabellín ROMERO paquete de 500 gr."));
        articles.add(new Article("Romero Macarrones", "images/articulos/pastas/romero-macarrones-escalar.jpg", "4.95", "alimentacion", "pastas", "", "Espirales,pasta ROMERO 500 gr."));
        articles.add(new Article("Sam Mills Macarrones", "images/articulos/pastas/sam-mills-macarrones-escalar.jpg", "4.95", "alimentacion", "pastas", "", "Fusilli, pasta sin Gluten SAM MILLS 500 gr,."));
        articles.add(new Article("Carretilla Alubias", "images/articulos/preparados/Carretilla-alubias-escalar.jpg", "6.95", "alimentacion", "preparados", "", "Alubias al estilo casero CARRETILLA 300 g."));
        articles.add(new Article("Carretilla Arroz con pollo al Curry", "images/articulos/preparados/Carretilla-arroz-con-pollo-al-curry-escalar.jpg", "7.95", "alimentacion", "preparados", "", "Arroz con pollo al curry Carretilla 300 g."));
        articles.add(new Article("Isabel Albondigas con Atun", "images/articulos/preparados/Isabel-albondigas-con-atun-escalar.jpg", "5.95", "alimentacion", "preparados", "", "Albóndigas de atún con tomate ISABEL 100 g."));
        articles.add(new Article("Lourino Albondigas con Guisantes", "images/articulos/preparados/Lourino-albondigas-con-guisantes-escalar.jpg", "6.95", "alimentacion", "preparados", "", "Albóndigas con guisantes LOURIÑO lata de 425 g."));
        articles.add(new Article("Yatekomo Arroz 3 Delicias", "images/articulos/preparados/Yatekomo-arroz-3-delicias-escalar.jpg", "5.95", "alimentacion", "preparados", "", "Arroz 3 delicias YATEKOMO 100 grs."));
        articles.add(new Article("Rolmovil Cubre Volante", "images/articulos/automovil/accesorios/Rolmovil-cubre-volante-escalar.jpg", "15.95", "automovil", "accesorios", "", "Cubrevolante de 37-39 centímetros ROLMOVIL."));
        articles.add(new Article("Rolmovil Extintor", "images/articulos/automovil/accesorios/Rolmovil-extintor-escalar.jpg", "19.95", "automovil", "accesorios", "", "Extintor apagafuegos con manómetro y capacidad de 1 kilogramo ROLMOVIL."));
        articles.add(new Article("Rolmovil Parasol", "images/articulos/automovil/accesorios/Rolmovil-parasol-escalar.jpg", "14.95", "automovil", "accesorios", "", "Parasol aluminizado con cerrado meidnate correas elásticas, efecto laser, cortina térmica refelctora y medida de 145x90 centímetros ROLMOVIL."));
        articles.add(new Article("Rolmovil Triangulo de Emergencia", "images/articulos/automovil/accesorios/Rolmovil-triangulo-de-emergencia-escalar.jpg", "29.95", "automovil", "accesorios", "", "Se puede plegar quedando guardado en un práctico y reducido estuche, por lo que nos ocupará muy poco espacio en nuestro maletero."));
        articles.add(new Article("Air-Wick 2D Ambientador", "images/articulos/automovil/limpieza/air-wick-2d-ambientador-escalar.jpg", "9.95", "automovil", "limpieza", "", "El olor tiene una duración aproximada de 7 semanas."));
        articles.add(new Article("Arbre Magique Ambientador", "images/articulos/automovil/limpieza/arbre-magique-ambientador-escalar.jpg", "5.95", "automovil", "limpieza", "", "Difunde una agradable fragancia que elimina los malos olores de nuestro vehículo durante siete semanas aproximadamente."));
        articles.add(new Article("Krafft Limpia Parabrisas", "images/articulos/automovil/limpieza/krafft-limpia-parabrisas-escalar.jpg", "18.95", "automovil", "limpieza", "", "Listo para usar, no necesita añadir agua, siendo capaz de limpiar de forma eficaz las manchas de barro, insectos, grasa...que pueda haber en nuestro parabrisas o en nuestros faros.\n"+"Temperatura de congelación de -5 ºC."));
        articles.add(new Article("Rolmovil Ambientador", "images/articulos/automovil/limpieza/rolmovil-ambientador-escalar.jpg", "19.95", "automovil", "limpieza", "", "Al ser un formato XXL, la fragancia tiene una duración aproximada de 60 días."));
        articles.add(new Article("Abadan Alas de Pollo", "images/articulos/congelados/carne/abadan-alas-de-pollo-escalar.jpg", "14.95", "alimentacion", "congelados", "carne", "Alas de pollo ABADAN 900 gr."));
        articles.add(new Article("Meet Beef Albondigas", "images/articulos/congelados/carne/meet-beef-albondigas-escalar.jpg", "19.95", "alimentacion", "congelados", "carne", "Albóndigas de vacuno MEAT BEEF 600 gr."));
        articles.add(new Article("Meet Chicken Solomillo de Pollo", "images/articulos/congelados/carne/meet-chicken-solomillo-de-pollo-escalar.jpg", "18.95", "alimentacion", "congelados", "carne", "Solomillos de pollo MEAT CHICKEN 600 gr."));
        articles.add(new Article("Campos Bocados de Atun", "images/articulos/congelados/pescado/campos-bocados-de-atun-escalar.jpg", "14.95", "alimentacion", "congelados", "pescado", "Atún en dados CAMPOS 250 gr."));
        articles.add(new Article("Campos Filetes de Atun", "images/articulos/congelados/pescado/campos-filetes-de-atun-escalar.jpg", "16.95", "alimentacion", "congelados", "pescado", "Atún en solomillo CAMPOS 250 gr."));
        articles.add(new Article("Findus Bacalado Rebosado", "images/articulos/congelados/pescado/findus-bacalado-rebosado-escalar.jpg", "15.95", "alimentacion", "congelados", "pescado", "Bacalao rebozado FINDUS 280 gr."));
        articles.add(new Article("Pescanova Anillos a la Romana", "images/articulos/congelados/pescado/pescanova-anillos-a-la-romana-escalar.jpg", "15.95", "alimentacion", "congelados", "pescado", "Calamares a la romana en anillas PESCANOVA 400 gr."));
        articles.add(new Article("Huevos Dagu 12 Unidades", "images/articulos/lacteos/huevos/dagu-12u-escalar.jpg", "5.95", "alimentacion", "lacteos", "huevos", "Huevos Clase L Chef DAGU 12 Unidades."));
        articles.add(new Article("Huevos Los Rancheros 6 Unidades", "images/articulos/lacteos/huevos/los-rancheros-6u-escalar.jpg", "4.55", "alimentacion", "lacteos", "huevos", "Huevos clase M LOS RANCHEROS cartón de 6 uds."));
        articles.add(new Article("Huevos Pazo de Vilane 6 Unidades", "images/articulos/lacteos/huevos/pazo-de-vilane-6u-escalar.jpg", "4.95", "alimentacion", "lacteos", "huevos", "En Vilane mantenemos la tradición, nuestras gallinas de crían al aire libre y completan su dieta a voluntad en los extensos campos del Pazo."));
        articles.add(new Article("Huevos Pitas 12 Unidades", "images/articulos/lacteos/huevos/pitas-12u-escalar.jpg", "6.95", "alimentacion", "lacteos", "huevos", "Huevos Clase L PITAS 12 Unidades."));
        articles.add(new Article("Yogur Activia Limon 4 Unidades", "images/articulos/lacteos/yogur/activia-limon-4u-escalar.jpg", "2.45", "alimentacion", "lacteos", "yogur", "Yogur bifidus con sabor a limón DANONE ACTIVIA CREMOSO pack de 4 uds de 120 gr."));
        articles.add(new Article("Yogur Danone 4 Unidades", "images/articulos/lacteos/yogur/danone-4u-escalar.jpg", "2.35", "alimentacion", "lacteos", "yogur", "El Yogur Danone está elaborado con leche fresca de ganaderos españoles que trabajan con Danone hace muchos años.\n"+"Es un alimento nutritivo, con fermentos activos exclusivos."));
        articles.add(new Article("Yogur Danone Limon 4 Unidades", "images/articulos/lacteos/yogur/danone-limon-4u-escalar.jpg", "2.25", "alimentacion", "lacteos", "yogur", "El Yogur Danone está elaborado con leche fresca de ganaderos españoles que trabajan con Danone hace muchos años.\n"+"Es un alimento nutritivo, con fermentos activos exclusivos."));
        articles.add(new Article("Natillas Danone 4 Unidades", "images/articulos/lacteos/yogur/danone-natillas-4u-escalar.jpg", "2.65", "alimentacion", "lacteos", "yogur", "Ahora Danet Doble Placer te trae tus Danet con deliciosa base de vainilla o chocolate cubierta por una esponjosa mousse de nata o de chocolate. ¡Mires como lo mires, una combinación irresistible! Con Danet Sabor Vainilla con Nata, descubrirás la perfecta harmonía del sabor de la vainilla combinado con una deliciosa capa de mousse de nata."));
        articles.add(new Article("Yogur Kalise Variado 8 Unidades", "images/articulos/lacteos/yogur/kalise-variado-8u-escalar.jpg", "3.45", "alimentacion", "lacteos", "yogur", "Gracias a sus fermentos naturales, facilita la digestión de la lactosa que contienen."));
        articles.add(new Article("Leche Asturiana Desnatada", "images/articulos/lacteos/leche/asturiana-desnatada-escalar.jpg", "2.95", "alimentacion", "lacteos", "leche", "Leche desnatada 0,0% materia grasa CENTRAL LECHERA ASTURIANA."));
        articles.add(new Article("Leche Asturiana Entera", "images/articulos/lacteos/leche/asturiana-entera-escalar.jpg", "2.95", "alimentacion", "lacteos", "leche", "Leche entera CENTRAL LECHERA ASTURIANA."));
        articles.add(new Article("Leche Calo Entera", "images/articulos/lacteos/leche/calo-entera-escalar.jpg", "2.75", "alimentacion", "lacteos", "leche", "Leche entera Calo 1L."));
        articles.add(new Article("Leche Celgan Desnatada", "images/articulos/lacteos/leche/celgan-desnatada-escalar.jpg", "3.10", "alimentacion", "lacteos", "leche", "Leche desnatada celga 1L."));
        articles.add(new Article("Leche Celta Entera", "images/articulos/lacteos/leche/celta-entera-escalar.jpg", "2.85", "alimentacion", "lacteos", "leche", "Leche entera CELTA 1.5 L."));
        articles.add(new Article("Leche Pascual Desnatada", "images/articulos/lacteos/leche/pascual-desnatada-escalar.jpg", "3.25", "alimentacion", "lacteos", "leche", "Leche desnatada PASCUAL 1.5 L."));
        articles.add(new Article("Leche Pascual Entera", "images/articulos/lacteos/leche/pascual-entera-escalar.jpg", "3.15", "alimentacion", "lacteos", "leche", "Leche entera PASCUAL 1 L."));
        articles.add(new Article("Leche Puleva Desnatada", "images/articulos/lacteos/leche/puleva-desnatada-escalar.jpg", "3.45", "alimentacion", "lacteos", "leche", "Leche desnatada con calcio PULEVA 1L."));
        articles.add(new Article("Leche Puleva Entera", "images/articulos/lacteos/leche/puleva-entera-escalar.jpg", "3.45", "alimentacion", "lacteos", "leche", "Leche entera con calcio PULEVA 1L."));
        preparado = true;
        establishedDiscount(discount);
        return articles;
    }
    
    public static Article getArticle(int id) {
        for (Article article : articles) {
            if(article.getId() == id)
                return article;
        }
        return null;
    }
    
    public static ArrayList getTypeArticle(String type) {
        ArrayList listArticles = new ArrayList();
        for (Article article : articles) {
            if(article.getType().equals(type) || article.getSubtype1().equals(type) || article.getSubtype2().equals(type))
                listArticles.add(article);
        }
        return listArticles;
    }
    
    public static ArrayList searchArticle(String article) {
        ArrayList listArticles = new ArrayList();
        for (Article product : articles) {
            if(product.getNombre().equals(article) || product.getType().equals(article) || 
                    product.getSubtype1().equals(article) || product.getSubtype2().equals(article))
                listArticles.add(product);
        }
        return listArticles;
    }
    
    public static void setDiscount(Descuento descuento) {
        discount = descuento;
    }

    public static Descuento getDiscount() {
        return discount;
    }
    
    private static void establishedDiscount(Descuento descuento) {
        ArrayList<String> types = descuento.getDiscountArticle();
        int sales = descuento.getValue();
        for (Article article : articles) {
            if(article.getType().equals(types.get(0)) || article.getSubtype1().equals(types.get(0)) || article.getSubtype2().equals(types.get(0)))
                updateAmount(article, Double.toString(Math.round((Double.parseDouble(article.getPvp())-(Double.parseDouble(article.getPvp())*(new Double(sales)/100.0)))*100.0)/100.0));
            if(article.getType().equals(types.get(1)) || article.getSubtype1().equals(types.get(1)) || article.getSubtype2().equals(types.get(1)))
                updateAmount(article, Double.toString(Math.round((Double.parseDouble(article.getPvp())-(Double.parseDouble(article.getPvp())*(new Double(sales)/100.0)))*100.0)/100.0));
            if(article.getType().equals(types.get(2)) || article.getSubtype1().equals(types.get(2)) || article.getSubtype2().equals(types.get(2)))
                updateAmount(article, Double.toString(Math.round((Double.parseDouble(article.getPvp())-(Double.parseDouble(article.getPvp())*(new Double(sales)/100.0)))*100.0)/100.0));
        }
    }

    private static void updateAmount(Article article, String price) {
        article.setPvp(price);
    }
}