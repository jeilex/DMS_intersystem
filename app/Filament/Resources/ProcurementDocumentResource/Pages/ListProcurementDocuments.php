<?php

namespace App\Filament\Resources\ProcurementDocumentResource\Pages;

use App\Filament\Resources\ProcurementDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListProcurementDocuments extends ListRecords
{
    protected static string $resource = ProcurementDocumentResource::class;

    protected function getHeaderActions(): array
    {
        return [
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
