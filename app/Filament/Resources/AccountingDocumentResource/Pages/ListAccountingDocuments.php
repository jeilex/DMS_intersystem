<?php

namespace App\Filament\Resources\AccountingDocumentResource\Pages;

use App\Filament\Resources\AccountingDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAccountingDocuments extends ListRecords
{
    protected static string $resource = AccountingDocumentResource::class;

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
