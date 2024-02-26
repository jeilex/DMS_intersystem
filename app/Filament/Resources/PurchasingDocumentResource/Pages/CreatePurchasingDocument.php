<?php

namespace App\Filament\Resources\PurchasingDocumentResource\Pages;

use App\Filament\Resources\PurchasingDocumentResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreatePurchasingDocument extends CreateRecord
{
    protected static string $resource = PurchasingDocumentResource::class;
    protected function getRedirectUrl(): string
    {
    return $this->getResource()::getUrl('index');
    }
}

