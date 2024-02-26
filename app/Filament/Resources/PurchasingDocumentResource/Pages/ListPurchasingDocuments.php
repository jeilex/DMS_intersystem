<?php

namespace App\Filament\Resources\PurchasingDocumentResource\Pages;

use App\Filament\Resources\PurchasingDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPurchasingDocuments extends ListRecords
{
    protected static string $resource = PurchasingDocumentResource::class;

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
