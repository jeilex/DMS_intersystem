<?php

namespace App\Filament\Resources\ProcurementSendDocumentsResource\Pages;

use App\Filament\Resources\ProcurementSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateProcurementSendDocuments extends CreateRecord
{
    protected static string $resource = ProcurementSendDocumentsResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
