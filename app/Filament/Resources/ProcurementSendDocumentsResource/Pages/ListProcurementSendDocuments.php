<?php

namespace App\Filament\Resources\ProcurementSendDocumentsResource\Pages;

use App\Filament\Resources\ProcurementSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListProcurementSendDocuments extends ListRecords
{
    protected static string $resource = ProcurementSendDocumentsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
