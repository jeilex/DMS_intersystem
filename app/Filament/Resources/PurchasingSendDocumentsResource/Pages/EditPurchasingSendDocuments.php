<?php

namespace App\Filament\Resources\PurchasingSendDocumentsResource\Pages;

use App\Filament\Resources\PurchasingSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPurchasingSendDocuments extends EditRecord
{
    protected static string $resource = PurchasingSendDocumentsResource::class;

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
