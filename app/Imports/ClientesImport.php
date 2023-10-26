<?php

namespace App\Imports;

use App\Models\Cliente;
use Maatwebsite\Excel\Concerns\ToModel;

class ClientesImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        // $input  = '11/06/1990';
        // $format = 'd/m/Y';

        // $date = Carbon\Carbon::createFromFormat($format, $input)

        return new Cliente([
            'nombre'     => $row[0],
            'ci'    => $row[1],
            'celular' => $row[2],
            'fecha_nacimiento' => $row[3] ? \Carbon\Carbon::instance(\PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($row[3]))  : null,
        ]);
    }
}
