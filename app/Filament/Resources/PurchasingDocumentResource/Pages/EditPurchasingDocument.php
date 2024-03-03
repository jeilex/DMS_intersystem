<?php

namespace App\Filament\Resources\PurchasingDocumentResource\Pages;

use App\Filament\Resources\PurchasingDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPurchasingDocument extends EditRecord
{
    protected static string $resource = PurchasingDocumentResource::class;

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
