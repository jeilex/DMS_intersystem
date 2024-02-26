<?php

namespace App\Filament\Resources\PurchasingSendDocumentsResource\Pages;

use App\Filament\Resources\PurchasingSendDocumentsResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreatePurchasingSendDocuments extends CreateRecord
{
    protected static string $resource = PurchasingSendDocumentsResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}
