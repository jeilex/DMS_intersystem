<?php

namespace App\Filament\Resources\SalesDocumentResource\Pages;

use App\Filament\Resources\SalesDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSalesDocument extends ListRecords
{
    protected static string $resource = SalesDocumentResource::class;

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

