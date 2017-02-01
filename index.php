<?php
/*
 * Se trae la tasa de cambio del dia, por medio de un webservice de la superfinaciera
 */
$date = date("Y-m-d");
try {
	$soap = new soapclient("https://www.superfinanciera.gov.co/SuperfinancieraWebServiceTRM/TCRMServicesWebService/TCRMServicesWebService?WSDL", array(
		'soap_version'   => SOAP_1_1,
		'trace' => 1,
		"location" => "http://www.superfinanciera.gov.co/SuperfinancieraWebServiceTRM/TCRMServicesWebService/TCRMServicesWebService",
	));
	$response = $soap->queryTCRM(array('tcrmQueryAssociatedDate' => $date));
	$response = $response->return;
	if($response->success){
		//echo $response->value;
	}
} catch(Exception $e){
	echo $e->getMessage();
}
/*
 * Se realiza una consulta a la base de datos para traer los productos
 */
$enlace = mysqli_connect("localhost", "root", "m0v3", "arancel");
$consulta = "SELECT id,categoria, gravamen, iva FROM productos";

if ($resultado = mysqli_query($enlace, $consulta)) {

    /* obtener array asociativo */
    while ($row = mysqli_fetch_assoc($resultado)) {
        $productos[]=$row;
    }

    /* liberar el conjunto de resultados */
    mysqli_free_result($resultado);
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!---Carga de la hoja de estilos Bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
        <title>Calculadora de Envíos PoBox</title>
    </head>
    <body>
        <div class="container row">
            <div class="col-md-4 col-md-offset-4">
                <h1 class="text-center">Calculadora de Envíos</h1>
                <form>
                    <div class="form-group">
                        <label for="productos">Tipo de mercancía</label>
                        <select class="form-control" id="productos">
<?php
foreach ($productos as $producto)
{
?>
                            <option value="<?=$producto['id']?>" data-gravamen="<?=$producto['gravamen']?>" data-iva="<?=$producto['iva']?>"><?=$producto['categoria']?></option>
<?php
}
?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="valor_mercancia">Valor de la mercancía (USD)</label>
                        <input type="number" class="form-control" id="valor_mercancia" placeholder="$0,00 USD" min="1" max="5000" required="" pattern="[0-9,]*">
                    </div>
                    <div class="form-group">
                        <label for="peso_mercancia">Peso de la mercancía</label>
                        <input type="number" class="form-control" id="peso_mercancia" placeholder="0 kg" required="">
                        Kg<input type="radio" name="unidades" id="optionsRadios1" value="kg" checked>
                        Lb<input type="radio" name="unidades" id="optionsRadios2" value="lg">
                    </div>
                    <div class="checkbox">
                        <label for="check_dimensiones">
                            <input type="checkbox" id="check_dimensiones">¿Conoce las dimensiones de la mercancia (Alto, largo y ancho)?
                        </label>                                                
                    </div>                    
                    <div id="dimensiones">
                        <div class="form-group">
                            <label for="largo_mercancia">Largo de la mercancía</label>
                            <input type="number" class="form-control" id="largo_mercancia" placeholder="0 cm" >
                        </div>
                        <div class="form-group">
                            <label for="ancho_mercancia">Ancho de la mercancía</label>
                            <input type="number" class="form-control" id="ancho_mercancia" placeholder="0 cm" >
                        </div>
                        <div class="form-group">
                            <label for="alto_mercancia">Alto de la mercancía</label>
                            <input type="number" class="form-control" id="alto_mercancia" placeholder="0 cm" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="tasa_cambio">Tasa de cambio de hoy</label>
                        <input type="number" class="form-control" id="tasa_cambio" value="<?=$response->value?>" readonly=""/>
                    </div>
                    <button type="button" class="btn btn-default" id="calcular">Calcular</button>
                </form>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Concepto</th>
                                <th class="text-right">Valor (Pesos Colombianos)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Valor de la mercancía: </td>
                                <td id="valor_mercancia_pesos" class="text-right"></td>
                            </tr>                            
                            <tr>
                                <td>Valor del flete: </td>
                                <td id="valor_flete_pesos" class="text-right"></td>
                            </tr>
                            <tr>
                                <td>Valor de los impuestos: </td>
                                <td id="valor_impuestos_pesos" class="text-right"></td>
                            </tr>
                            <tr class="active">
                                <td>Valor total*: </td>
                                <td id="valor_total_pesos" class="text-right"></td>
                            </tr>                            
                        </tbody>
                    </table>
                    <p>*Importante: Por favor tenga en cuenta que éste valor es aproximado y puede variar según los datos reales del envío y el plan que tenga con nosotros.</p>
                </div>
            </div>
        </div>
    <!-- Carga de los archivos javascript jQuery y Bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>     
    <script>
        $(document).ready(function()
        {
            $('#dimensiones').hide(); //oculto mediante id
            var valor=0;
            var peso_fisico=0;
            var unidades;
            var ancho=0;
            var alto=0;
            var largo=0;
            var peso_volumetrico=0;
            var tasa_cambio=0;
            var peso=0;
            var tarifa_fisica=0;
            var tarifa_volumen=0;
            var diferencia=0;
            var valor_flete=0;
            var valor_impuestos=0;
            var gravamen=0;
            var iva=0;            
            $("#check_dimensiones").click(function () {                
                if( $('#check_dimensiones').prop('checked') ) {
                    $('#dimensiones').show(); 
                }
                else
                {
                    $('#dimensiones').hide();
                }
            });
            $("#calcular").click(function () {
                var seleccionado = $("#productos").find('option:selected');
                gravamen=seleccionado.data('gravamen');
                iva=seleccionado.data('iva');  
                console.log("gravamen: "+gravamen);
                valor=parseFloat($('#valor_mercancia').val());
                if(valor<=2000)
                {
                    peso_fisico=$('#peso_mercancia').val();
                    unidades=$('input:radio[name=unidades]:checked').val();
                    tasa_cambio=$('#tasa_cambio').val();                               

                    if($('#check_dimensiones').prop('checked')) 
                    {
                        ancho=$('#ancho_mercancia').val();
                        alto=$('#alto_mercancia').val();
                        largo=$('#largo_mercancia').val();
                    }

                    if(unidades=="kg")
                    {
                        peso_fisico=peso_fisico*2.20462;
                    }                
                    peso_volumetrico=redondeo2decimales(((ancho*alto*largo)/6000)*2.20462);                
                    peso_volumetrico=aproximarCuartos(peso_volumetrico);
                    if(peso_fisico>peso_volumetrico)
                    {
                        peso=peso_fisico;
                    }
                    else
                    {
                        peso=peso_volumetrico;
                    }
                    switch (true) {
                        case (peso >= 0 && peso <= 2): 
                            tarifa_fisica=10;
                            tarifa_volumen=10;
                            break;
                        case (peso > 2 && peso <= 10): 
                            tarifa_fisica=4.9;
                            tarifa_volumen=4;
                            break;
                        case (peso > 10 && peso <= 25): 
                            tarifa_fisica=4.7;
                            tarifa_volumen=3.6;
                            break;
                        case (peso > 25 && peso <= 50): 
                            tarifa_fisica=4.5;
                            tarifa_volumen=3.3;
                            break;
                        case (peso > 50 && peso <= 75): 
                            tarifa_fisica=4.3;
                            tarifa_volumen=3;
                            break;
                        case (peso > 75 && peso <= 100): 
                            tarifa_fisica=4.1;
                            tarifa_volumen=2.6;
                            break;
                        case (peso > 100 && peso <= 125): 
                            tarifa_fisica=3.9;
                            tarifa_volumen=2.3;
                            break;
                        case (peso > 125 && peso <= 150): 
                            tarifa_fisica=3.7;
                            tarifa_volumen=2.3;
                            break;
                        case (peso > 150): 
                            tarifa_fisica=3.5;
                            tarifa_volumen=2.3;
                            break;                        
                    }
                    diferencia=peso_volumetrico-peso_fisico;
                    if(diferencia>0)
                    {
                        valor_flete=(peso_fisico*tarifa_fisica)+(diferencia*tarifa_volumen);
                    }
                    else
                    {
                        valor_flete=peso_fisico*tarifa_fisica;
                    }
                    var valor_flete_pesos=rendondeo_centenas(valor_flete*tasa_cambio);
                    var valor_mercancia_pesos=rendondeo_centenas(valor*tasa_cambio);
                    if(valor>200)
                    {
                        valor_impuestos=rendondeo_centenas(valor_mercancia_pesos*((gravamen+iva)/100));
                    }
                    else
                    {
                        valor_impuestos=rendondeo_centenas(valor_mercancia_pesos*(gravamen/100));
                    }                
                    var valor_total_pesos=valor_flete_pesos+valor_mercancia_pesos+valor_impuestos;
                    $('#valor_flete_pesos').html("$" + currency(valor_flete_pesos,0,[',', "'", '.']));
                    $('#valor_mercancia_pesos').html("$" + currency(valor_mercancia_pesos,0,[',', "'", '.']));
                    $('#valor_impuestos_pesos').html("$" + currency(valor_impuestos,0,[',', "'", '.']));
                    $('#valor_total_pesos').html("$" + currency(valor_total_pesos,0,[',', "'", '.']));
                    console.log('peso fisico: '+ peso_fisico + ' peso volumetrico: '+ peso_volumetrico + ' tarifa fisica: '+ tarifa_fisica + ' tarifa volumen: '+ tarifa_volumen + ' diferencia: '+ diferencia  + ' valor flete: '+ valor_flete + ' valor mercancia: ' + valor + ' tasa de cambio: ' + tasa_cambio + ' valor mercancia pesos: '+ valor*tasa_cambio + ' valor flete pesos: '+ valor_flete*tasa_cambio  );
                }
                else
                {
                    $( "#valor_mercancia" ).focus();
                    alert("el valor maximo de la mercacia no puede exceder los 2000 dolares");
                }
            });
            
            function currency(value, decimals, separators) 
            {
                decimals = decimals >= 0 ? parseInt(decimals, 0) : 2;
                separators = separators || ['.', "'", ','];
                var number = (parseFloat(value) || 0).toFixed(decimals);
                if (number.length <= (4 + decimals))
                    return number.replace('.', separators[separators.length - 1]);
                var parts = number.split(/[-.]/);
                value = parts[parts.length > 1 ? parts.length - 2 : 0];
                var result = value.substr(value.length - 3, 3) + (parts.length > 1 ?
                    separators[separators.length - 1] + parts[parts.length - 1] : '');
                var start = value.length - 6;
                var idx = 0;
                while (start > -3) {
                    result = (start > 0 ? value.substr(start, 3) : value.substr(0, 3 + start))
                        + separators[idx] + result;
                    idx = (++idx) % 2;
                    start -= 3;
                }
                return (parts.length == 3 ? '-' : '') + result;
            }
            
            function redondeo2decimales(numero)
            {
                var flotante = parseFloat(numero);
                var resultado = Math.round(flotante*100)/100;
                return resultado;
            }
            
            function aproximarCuartos(numero)
            {
                var entero=Math.floor(numero);
                var decimales=(numero-entero)*100;
                switch (true) {
                    case (decimales =0):
                        decimales=0;
                        break;
                    case (decimales > 0 && decimales <= 25): 
                        decimales=25;
                        break;
                    case (decimales > 25 && decimales <= 50): 
                        decimales=50;
                        break;
                    case (decimales > 50 && decimales <= 75): 
                        decimales=75;
                        break;
                    case (decimales > 75 && decimales <= 100): 
                        decimales=100;
                        break;                        
                }
                numero=entero+(decimales/100); 
                return numero;
            }
            
            function rendondeo_centenas(value) 
            {
                return value - (value % 100);
            }            
        });        
    </script>
    </body>
</html>