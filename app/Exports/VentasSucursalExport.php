<?php

namespace App\Exports;

use App\Models\Venta;
use App\Models\Sucursal;
use GuzzleHttp\Psr7\Request;
use Illuminate\Http\Request as Req;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use DB;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Illuminate\Support\Facades\Auth;

class VentasSucursalExport implements FromQuery, WithHeadings, WithMapping, WithColumnFormatting
{
    use Exportable;
    public function __construct(Req $request)
    {
        $this->request = $request;
        // return $this;
    }

    public function query()
    {
        $val = $this->request;
        return Venta::query()
        ->where('sucursal_id',$val->sucursal_id)
        ->where(function($query) use($val){
            if($val->cliente_id){
                $query->where('ventas.cliente_id',$val->cliente_id);
            }
            if($val->servicio_id){
                $query->where('ventas.servicio_id',$val->servicio_id);
            }
            if($val->operador_id){
                $query->where('ventas.user_id',$val->operador_id);
            }

            if($val->f_ini != '' && $val->f_fin != ''){
                // $query->whereBetween('created_at',[$request->f_ini,$request->f_fin]);
                $query->whereDate('ventas.created_at','>=',$val->f_ini)
                ->whereDate('ventas.created_at','<=',$val->f_fin);
            }else{
                if ($val->f_ini != '') {
                    $query->whereDate('ventas.created_at','>=',$val->f_ini);
                }elseif ($val->f_fin != '') {
                    $query->whereDate('ventas.created_at','<=',$val->f_fin);
                }
            }
        })
        ->leftjoin('servicios', 'ventas.servicio_id', '=', 'servicios.id')
        ->leftjoin('sucursals', 'ventas.sucursal_id', '=', 'sucursals.id')
        ->leftjoin('clientes', 'ventas.cliente_id', '=', 'clientes.id')
        ->leftjoin('users', 'ventas.user_id', '=', 'users.id')
        ->select('ventas.id', 'servicios.nombre as serviciov','ventas.precio','ventas.cantidad',
        'ventas.subtotal','ventas.descuento','ventas.total', 'ventas.caja', 'ventas.comision' ,'ventas.estado','clientes.nombre as clientev',
        'sucursals.nombre as sucursalv',
        DB::raw("(case when ventas.user_id is NULL then 'SIN ASIGNAR' else users.nombre end) as operadora"),
        'ventas.created_at'
        )
        ->orderBy($val->order,'desc');
        // ->get();
    }

    public function map($invoice): array
    {
        return [
            $invoice->id,
            $invoice->serviciov,
            $invoice->precio,
            $invoice->cantidad,
            $invoice->subtotal,
            $invoice->descuento,
           
            $invoice->caja,
            $invoice->comision,
 
            $invoice->total,

            $invoice->estado,
            $invoice->clientev,
            $invoice->sucursalv,
            $invoice->operadora,
            Date::dateTimeToExcel($invoice->created_at),
        ];
    }
    public function columnFormats(): array
    {
        return [
            'C' => NumberFormat::FORMAT_NUMBER_00,
            'D' => NumberFormat::FORMAT_NUMBER_00,
            'E' => NumberFormat::FORMAT_NUMBER_00,
            'F' => NumberFormat::FORMAT_NUMBER_00,
            'G' => NumberFormat::FORMAT_NUMBER_00,
            'H' => NumberFormat::FORMAT_NUMBER_00,
            'I' => NumberFormat::FORMAT_NUMBER_00,
            'N' => NumberFormat::FORMAT_DATE_DATETIME,
        ];
    }
    public function headings(): array
    {
        return [
            [$this->request->title],
            ["Fecha Inicio : ".$this->request->f_ini." - Fecha Fin : ".$this->request->f_fin],
            [
            '#',
            'Servicio',
            'Precio',
            'Cantidad',
            'Sub Total',
            'Descuento',

            'Caja',
            'Comision',

            'Total',
            'Estado',
            'Cliente',
            'Sucursal',
            'Operador',
            'Fecha',
            ]
        ];
    }

    // /**
    // * @return \Illuminate\Support\Collection
    // */
    // public function collection()
    // {
    //     return Venta::whereHas('cliente', function($q) use ($this->request){
    //         $q->where('nombre','LIKE',"%$request->search%");
    //     })
    //     ->where( function($query) use($request){
    //         if($request->f_ini != '' && $request->f_fin != ''){
    //             $query->whereBetween('created_at',[$request->f_ini,$request->f_fin]);
    //         }else{
    //             if ($request->f_ini != '') {
    //                 $query->where('created_at','>=',$request->f_ini);
    //             }elseif ($request->f_fin != '') {
    //                 $query->where('created_at','<=',$request->f_fin);
    //             }
    //         }
    //     })
    //     ->join('servicios', 'ventas.servicio_id', '=', 'servicios.id')
    //     ->join('sucursals', 'ventas.sucursal_id', '=', 'sucursals.id')
    //     ->join('clientes', 'ventas.cliente_id', '=', 'clientes.id')
    //     ->leftjoin('users', 'ventas.user_id', '=', 'users.id')
    //     ->select('ventas.id', 'servicios.nombre','ventas.precio','ventas.cantidad',
    //     'ventas.subtotal','ventas.descuento','ventas.total','ventas.estado','clientes.nombre',
    //     'sucursals.nombre',
    //     DB::raw("(case when ventas.user_id is NULL then 'SIN ASIGNAR' else users.nombre end) as operadora"))
    //     ->get();
    // }
}

