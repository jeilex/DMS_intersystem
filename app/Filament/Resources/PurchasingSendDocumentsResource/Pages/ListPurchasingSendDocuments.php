<?php

namespace App\Filament\Resources\PurchasingSendDocumentsResource\Pages;

use App\Filament\Resources\PurchasingSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPurchasingSendDocuments extends ListRecords
{
    protected static string $resource = PurchasingSendDocumentsResource::class;

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
