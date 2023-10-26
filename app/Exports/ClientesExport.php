<?php

namespace App\Exports;

use App\Models\Cliente;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use PhpOffice\PhpSpreadsheet\Shared\Date;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\WithMapping;

class ClientesExport implements FromCollection, WithHeadings , WithMapping, WithColumnFormatting
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Cliente::
        select('id','nombre','ci','celular','fecha_nacimiento','created_at')
        ->get();
    }

    public function map($invoice): array
    {
        return [
            $invoice->id,
            $invoice->nombre,
            $invoice->ci,
            $invoice->celular,
            $invoice->fecha_nacimiento,
            Date::dateTimeToExcel($invoice->created_at),
        ];
    }

    public function columnFormats(): array
    {
        return [
            'E' => NumberFormat::FORMAT_DATE_DDMMYYYY,
            'F' => NumberFormat::FORMAT_DATE_DATETIME,
        ];
    }

    public function headings(): array
    {
        return [
            '#',
            'Nombre',
            'CI',
            'Celular',
            'Fecha nacimiento',
            'Fecha creación'
        ];
    }
}
