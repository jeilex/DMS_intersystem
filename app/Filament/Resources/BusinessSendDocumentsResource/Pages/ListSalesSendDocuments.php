<?php

namespace App\Filament\Resources\SalesSendDocumentsResource\Pages;

use App\Filament\Resources\SalesSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSalesSendDocuments extends ListRecords
{
    protected static string $resource = SalesSendDocumentsResource::class;

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
