<?php

namespace App\Filament\Resources\ProcurementDocumentResource\Pages;

use App\Filament\Resources\ProcurementDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateProcurementDocument extends CreateRecord
{
    protected static string $resource = ProcurementDocumentResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
